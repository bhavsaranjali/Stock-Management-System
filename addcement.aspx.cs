using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace webapp1
{

  public partial class addcement : System.Web.UI.Page
  {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

      Label1.Text = Session["Dist_name"].ToString();
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {

      con.Open();

      string s = "select * from Cement where Type=@p1 ";


      SqlCommand cmd = new SqlCommand(s, con);


      cmd.Parameters.AddWithValue("@p1", TextBox3.Text);


      SqlDataAdapter da = new SqlDataAdapter(cmd);


      DataTable dt = new DataTable();


      da.Fill(dt);

      con.Close();

      if (dt.Rows.Count > 0)
      {


        TextBox4.Text = "";

        Label2.Text = "Type is Already Registered ";

      }



      else
      {

        con.Open();

        string s1 = "insert into Cement (Company, Product_Name, Category, Type, Capacity, Price) values (@p1,@p2,@p3,@p4,@p5,@p6) ";


        SqlCommand cmd1 = new SqlCommand(s1, con);


        cmd1.Parameters.AddWithValue("@p1", TextBox1.Text);

        cmd1.Parameters.AddWithValue("@p2", TextBox2.Text);

        cmd1.Parameters.AddWithValue("@p3", TextBox3.Text);

        cmd1.Parameters.AddWithValue("@p4", TextBox4.Text);

        cmd1.Parameters.AddWithValue("@p5", TextBox5.Text);

        cmd1.Parameters.AddWithValue("@p6", TextBox6.Text);

       


        cmd1.ExecuteNonQuery();


        con.Close();

        TextBox1.Text = "";

        TextBox2.Text = "";

        TextBox3.Text = "";

        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
       
        Label2.Text = "Added new Cement Information";

      }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      Response.Redirect("login.aspx");
    }




  }
}
