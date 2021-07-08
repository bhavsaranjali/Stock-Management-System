using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;
namespace webapp1
{
  public partial class Login : System.Web.UI.Page
  {
    static string Encrypt(string value)//for encryption of text
    {
      using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
      {
        UTF8Encoding utf8 = new UTF8Encoding();
        byte[] data = md5.ComputeHash(utf8.GetBytes(value));
        return Convert.ToBase64String(data);
      }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());

    protected void btnclick(object sender, EventArgs e)
    {

      if (remember.Checked)
      {
        con.Open();
        string s = Encrypt(TextBox2.Text);
        SqlDataReader reader;
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.CommandText = string.Format("select * from Dist_login where Dist_no='{0}' and Password='{1}'", TextBox1.Text, s);
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
          Session["Dist_no"] = TextBox1.Text;
          Session["Dist_name"] = reader["Dist_name"];
          TextBox1.Text = "";
          Response.Redirect("distributer_panel.aspx");
          con.Close();
        }
        else
        {
          TextBox1.Text = "";
          con.Close();
        }
      }
      
      else{
        con.Open();
        string s = Encrypt(TextBox2.Text);
        SqlDataReader reader;
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.CommandText = string.Format("select * from User_login where User_no='{0}' and Password='{1}'", TextBox1.Text, s);
        reader = cmd.ExecuteReader();        
        if (reader.Read())
        {
          Session["User_no"] = TextBox1.Text;
          Session["Username"] = reader["Username"];
          Session["Id"] = reader["Id"];
          Session["Gender"] = reader["Gender"];
          Session["Age"] = reader["Age"];
          Session["Street"] = reader["Street"];
          Session["Road"] = reader["Road"];
          Session["City"] = reader["City"];
          TextBox1.Text = "";
          Response.Redirect("User_panel.aspx");
          con.Close();
        }
        else
        {
          TextBox1.Text = "";
          con.Close();
        }
       
      }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
      con.Open();
      string s = "select * from AdminInfo where Admin_no=@p1 and Password=@p2 ";

      SqlCommand cmd = new SqlCommand(s, con);

      cmd.Parameters.AddWithValue("@p1", TextBox1.Text);

      cmd.Parameters.AddWithValue("@p2", TextBox2.Text);
      SqlDataAdapter da = new SqlDataAdapter(cmd);

      DataTable dt = new DataTable();

      da.Fill(dt);
      con.Close();
      if (dt.Rows.Count > 0)
      {
        Session["Admin_no"] = TextBox1.Text;
        TextBox1.Text = "";
        Response.Redirect("Admin_panel.aspx");

      }
      else
      {
        TextBox1.Text = "";
      }
    }
  }
}
