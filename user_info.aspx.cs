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

namespace webapp1
{
  public partial class user_info : System.Web.UI.Page
  {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
      //SqlDataReader reader;
      Label1.Text = Session["Username"].ToString();
      Label9.Text = Session["Username"].ToString();
      Label2.Text = Session["Username"].ToString();
      Label3.Text = Session["User_no"].ToString();
      Label4.Text = Session["Gender"].ToString();
      Label5.Text = Session["Age"].ToString();
      Label6.Text = Session["Street"].ToString();
      Label7.Text = Session["Road"].ToString();
      Label8.Text = Session["City"].ToString();

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
      Response.Redirect("user_info_edit.aspx");
    }
  }
}
