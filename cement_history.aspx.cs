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
  public partial class cement_history : System.Web.UI.Page
  {

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
     Label2.Text = Session["Username"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      Response.Redirect("login.aspx");
    }
  }
}
