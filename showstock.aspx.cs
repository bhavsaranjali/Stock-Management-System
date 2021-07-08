using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace webapp1
{
  public partial class showstock : System.Web.UI.Page
  {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
      Label1.Text = Session["Dist_name"].ToString();
      string distno = Session["Dist_no"].ToString();
      con.Open();
      string ss = "SELECT Company, SUM(stock) AS Sum FROM stock WHERE Dist_No=@dist GROUP BY Company";
      SqlCommand cmds = new SqlCommand(ss, con);
      cmds.Parameters.AddWithValue("@dist", distno);
      SqlDataReader rdr = cmds.ExecuteReader();
      string Company = String.Empty;
      string sum = String.Empty;
      while (rdr.Read())
      {
        Company = rdr["Company"].ToString();
        sum = rdr["Sum"].ToString();
        AddControls(Company, sum);

      }
      rdr.Close();
      con.Close();
    }
    int z = 0;
    private void AddControls(string Company, string sum)
    {
      z++;
      Label l1 = new Label();
      Label l2 = new Label();
      l1.ID = "lblname" + z.ToString();
      l2.ID = "lblno" + z.ToString();
      l1.Text = Company;
      l2.Text = sum;
      HtmlGenericControl h5 = new HtmlGenericControl("h5");
      HtmlGenericControl h4 = new HtmlGenericControl("h4");
      h4.Controls.Add(l1);
      h5.Controls.Add(l2);
      HtmlGenericControl dinner = new HtmlGenericControl("div");
      dinner.Attributes.Add("class", "inner");
      dinner.Controls.Add(h4);
      dinner.Controls.Add(h5);
      HtmlGenericControl dinfo = new HtmlGenericControl("div");
      dinfo.Attributes.Add("class", "info-box");
      dinfo.Controls.Add(dinner);
      HtmlGenericControl dmain = new HtmlGenericControl("div");
      dmain.Attributes.Add("class", "col-lg-4 col-6");
      dmain.Attributes.Add("onclick", "window.location='showstock1.aspx?Company=" + Company + "'");
      dmain.Controls.Add(dinfo);
      Panel1.Controls.Add(dmain);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Response.Redirect("login.aspx");
    }
  }
}
