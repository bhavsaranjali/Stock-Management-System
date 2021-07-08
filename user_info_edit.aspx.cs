using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection.Emit;

namespace webapp1
{
  public partial class user_info_edit : System.Web.UI.Page
  {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
     
      Label2.Text = Session["Username"].ToString();
      Label3.Text = Session["User_no"].ToString();
      TextBox1.Text = Session["Age"].ToString();
      TextBox2.Text = Session["Street"].ToString();
      TextBox3.Text = Session["Road"].ToString();
      TextBox4.Text = Session["City"].ToString();

    }
    string strgender;

    protected void Button1_Click(object sender, EventArgs e)
    {
      con.Open();
      string s = "UPDATE User_login SET Gender=@gender,Age=@p1, Street=@p2 , Road=@p3,City=@p4 WHERE User_no=@p5";

      if (rbMale.Checked)
      {
        if (rbFemale.Checked)
        {
          strgender = "Female";
        }
      }
      else
      {
        strgender = "Male";
      }
      SqlCommand cmd = new SqlCommand(s, con);
      cmd.Parameters.AddWithValue("@p5", Session["User_no"]);
      cmd.Parameters.AddWithValue("@p1", TextBox1.Text);
      cmd.Parameters.AddWithValue("@p2", TextBox2.Text);
      cmd.Parameters.AddWithValue("@p3", TextBox3.Text);
      cmd.Parameters.AddWithValue("@p4", TextBox4.Text);
      cmd.Parameters.AddWithValue("@gender", strgender);
      _ = cmd.ExecuteNonQuery();

      con.Close();

      Response.Redirect("user_info.aspx");
    }
  }
}
