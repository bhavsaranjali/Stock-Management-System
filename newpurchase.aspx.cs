using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;

namespace webapp1
{
  public partial class newpurchase : System.Web.UI.Page
  {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
      DisName.Text = Session["Dist_name"].ToString();
      for (int i = 1; i <= TotalNumberAdded; i++)
      {
        AddControls(i + 1);
      }
    }
    int z = 1;
    protected void Button1_Click(object sender, EventArgs e)
    {
      TotalNumberAdded++;
      AddControls(TotalNumberAdded);
    }
    private void AddControls(int controlNumber)
    {
      z++;
      TextBox tb1 = new TextBox();
      TextBox tb2 = new TextBox();
      TextBox tb3 = new TextBox();
      TextBox tb4 = new TextBox();
      TextBox tb5 = new TextBox();
      tb1.ID = "TextBoxmo" + z.ToString();
      tb2.ID = "TextBoxty" + z.ToString();
      tb3.ID = "TextBoxca" + z.ToString();
      tb4.ID = "TextBoxno" + z.ToString();
      tb5.ID = "TextBoxpr" + z.ToString();
      tb1.CssClass = "form-control";
      tb2.CssClass = "form-control";
      tb3.CssClass = "form-control";
      tb4.CssClass = "form-control";
      tb5.CssClass = "form-control";
      tb1.Attributes.Add("placeholder", "Enter Product Name");
      tb1.AutoPostBack = true;
      tb1.TextChanged += TextBoxmo_TextChanged;

      tb2.Attributes.Add("placeholder", "Enter Type");
      tb3.Attributes.Add("placeholder", "Enter Capacity");
      tb4.Attributes.Add("placeholder", "Enter No. of Cements");
      tb5.Attributes.Add("placeholder", "Enter Price");




      HtmlGenericControl d = new HtmlGenericControl("div");
      HtmlGenericControl d1 = new HtmlGenericControl("div");
      HtmlGenericControl d2 = new HtmlGenericControl("div");
      HtmlGenericControl d3 = new HtmlGenericControl("div");
      HtmlGenericControl d4 = new HtmlGenericControl("div");
      HtmlGenericControl d5 = new HtmlGenericControl("div");
      d1.Attributes.Add("class", "col-3");
      d2.Attributes.Add("class", "col-2");
      d3.Attributes.Add("class", "col-2");
      d4.Attributes.Add("class", "col-2");
      d5.Attributes.Add("class", "col-2");
      d.Attributes.Add("class", "row");

      d1.Controls.Add(tb1);
      d2.Controls.Add(tb2);
      d3.Controls.Add(tb3);
      d4.Controls.Add(tb4);
      d5.Controls.Add(tb5);

      d.Controls.Add(d1);
      d.Controls.Add(d2);
      d.Controls.Add(d3);
      d.Controls.Add(d4);
      d.Controls.Add(d5);

      paneladd.Controls.Add(d);
    }
    protected int TotalNumberAdded
    {
      get { return (int)(ViewState["TotalNumberAdded"] ?? 0); }
      set { ViewState["TotalNumberAdded"] = value; }
    }
    //SELECT Company, SUM(stock) AS Sum FROM stock  GROUP BY Company WHERE Dist_No=@dist

    protected void Button2_Click(object sender, EventArgs e)
    {
      for (int a = 1; a <= z; a++)
      {
        con.Open();
        TextBox tb1 = paneladd.FindControl("TextBoxmo" + a.ToString()) as TextBox;
        TextBox tb2 = paneladd.FindControl("TextBoxty" + a.ToString()) as TextBox;
        TextBox tb3 = paneladd.FindControl("TextBoxca" + a.ToString()) as TextBox;
        TextBox tb4 = paneladd.FindControl("TextBoxno" + a.ToString()) as TextBox;
        TextBox tb5 = paneladd.FindControl("TextBoxpr" + a.ToString()) as TextBox;

        string ss = "select * from Cement where Product_Name=@p6 and Type=@p8";
        SqlCommand cmds = new SqlCommand(ss, con);
        cmds.Parameters.AddWithValue("@p6", tb1.Text);
        cmds.Parameters.AddWithValue("@p8", tb2.Text);
        SqlDataReader rdr = cmds.ExecuteReader();
        string Company = String.Empty;
        string Category = String.Empty;
        string Capacity = String.Empty;
        string Price = String.Empty;
        
        while (rdr.Read())
        {
          Company = rdr["Company"].ToString();
          Category = rdr["Category"].ToString();
          Capacity = rdr["Capacity"].ToString();
          Price = rdr["Price"].ToString();
          
        }
        rdr.Close();

        string s1 = "insert into PurchaseHistory (Dist_No,Dist_name,User_No,User_Name,Company_Name,Product_Name,Category,Type,Capacity,Price,Number_Of_CementBags,Date) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12)";
        SqlCommand cmd1 = new SqlCommand(s1, con);

        cmd1.Parameters.AddWithValue("@p1", Session["Dist_no"].ToString());
        cmd1.Parameters.AddWithValue("@p2", Session["Dist_name"].ToString());
        cmd1.Parameters.AddWithValue("@p3", TBcno.Text);
        cmd1.Parameters.AddWithValue("@p4", TBcna.Text);
        cmd1.Parameters.AddWithValue("@p5", Company);
        cmd1.Parameters.AddWithValue("@p6", tb1.Text);
        cmd1.Parameters.AddWithValue("@p7", Category);
        cmd1.Parameters.AddWithValue("@p8", tb2.Text);
        cmd1.Parameters.AddWithValue("@p9", Capacity);
        cmd1.Parameters.AddWithValue("@p10", tb5.Text);
        cmd1.Parameters.AddWithValue("@p11", tb4.Text);
        cmd1.Parameters.AddWithValue("@p12", Convert.ToDateTime(TBdate.Text));
        cmd1.ExecuteNonQuery();

        string stk = "UPDATE stock SET stock=stock-@stk WHERE Dist_No=@dist AND Product_Name=@mdl AND Type=@tp ";
        SqlCommand cmdstk = new SqlCommand(stk, con);
        cmdstk.Parameters.AddWithValue("@dist", Session["Dist_no"].ToString());
        cmdstk.Parameters.AddWithValue("@mdl", tb1.Text);
        cmdstk.Parameters.AddWithValue("@tp", tb2.Text);
        cmdstk.Parameters.AddWithValue("@stk", tb4.Text);
        cmdstk.ExecuteNonQuery();
        con.Close();
      }
      lbladded.Text = "New Purchase Information Added.";
      Application["CustomerName"] = TBcna.Text;
      Application["CustomerNo"] = TBcno.Text;
      Response.Redirect("invoice.aspx");
    }

    protected void TBcno_TextChanged(object sender, EventArgs e)
    {

      TextBox textBox = sender as TextBox;
      String idi = textBox.Text;
      con.Open();
      string s = "select * from User_login where User_no=@p7";
      SqlCommand cmds = new SqlCommand(s, con);
      cmds.Parameters.AddWithValue("@p7", textBox.Text);
      SqlDataReader rdr = cmds.ExecuteReader();
      string Username = String.Empty;
      while (rdr.Read())
      {
        Username = rdr["Username"].ToString();
      }
      rdr.Close();
      TextBox tb2 = paneladd.FindControl("TBcna") as TextBox;
      tb2.Text = Username;

    }

    protected void TextBoxmo_TextChanged(object sender, EventArgs e)
    {

      TextBox textBox = sender as TextBox;
      
      String idi = textBox.ID;
      String indexx = idi.Substring(9);
      
      TextBox textBox2 = paneladd.FindControl("TextBoxmo" + indexx) as TextBox;
     
      con.Open();
      string s = "select * from Cement where Product_Name=@p7 AND Type=@p8";
      SqlCommand cmds = new SqlCommand(s, con);
      cmds.Parameters.AddWithValue("@p7", textBox2.Text);
      cmds.Parameters.AddWithValue("@p8", textBox.Text);

      SqlDataReader rdr = cmds.ExecuteReader();
      string Price = String.Empty;
      string Capacity = String.Empty;
      
      
      while (rdr.Read())
      {
        Price = rdr["Price"].ToString();
        Capacity = rdr["Capacity"].ToString();
      }
      rdr.Close();
      TextBox tb3 = paneladd.FindControl("TextBoxca" + indexx) as TextBox;
      TextBox tb5 = paneladd.FindControl("TextBoxpr" + indexx) as TextBox;
      tb3.Text = Capacity;
      tb5.Text = Price;
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
      Response.Redirect("login.aspx");
    }
  }
}
