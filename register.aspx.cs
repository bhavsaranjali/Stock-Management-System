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
  public partial class register : System.Web.UI.Page
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
    protected void password_change()
    {
      TextBox3.Text = Encrypt(TextBox3.Text);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void btnclick(object sender, EventArgs e)
    {
      con.Open();
      string s = "select * from User_login where User_no=@p1 ";

      SqlCommand cmd = new SqlCommand(s, con);

      cmd.Parameters.AddWithValue("@p1", TextBox2.Text);

      SqlDataAdapter da = new SqlDataAdapter(cmd);

      DataTable dt = new DataTable();

      da.Fill(dt);
      con.Close();
      if (dt.Rows.Count > 0)
      {

        TextBox2.Text = "";
        Label1.Text = "Mobile No Is All ready Register ";

      }


      else
      {

        con.Open();
        string s1 = "insert into User_login values (@p1,@p2,@p3,NULL,NULL,NULL,NULL,NULL) ";

        SqlCommand cmd1 = new SqlCommand(s1, con);
        cmd1.Parameters.AddWithValue("@p1", TextBox1.Text);
        cmd1.Parameters.AddWithValue("@p2", TextBox2.Text);
        password_change();
        cmd1.Parameters.AddWithValue("@p3", TextBox3.Text);


        cmd1.ExecuteNonQuery();
        con.Close();
        TextBox1.Text = "";
        TextBox2.Text = "";

        Response.Redirect("login.aspx");

      }
    }

  }
}
