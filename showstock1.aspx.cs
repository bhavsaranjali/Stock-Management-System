using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp1
{
  public partial class showstock1 : System.Web.UI.Page
  {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
      Label1.Text = Session["Dist_name"].ToString();
      String distno = Session["Dist_no"].ToString();
      String companyname = Request.QueryString["Company"].ToString();
      SqlDataSource1.SelectParameters["com"].DefaultValue = companyname;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      Response.Redirect("login.aspx");
    }
  }
}
