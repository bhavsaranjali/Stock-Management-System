using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Configuration;

namespace webapp1
{
  public partial class invoice : System.Web.UI.Page
  {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
      lbDistNo.Text = Session["Dist_No"].ToString();
      lbDist1.Text = Session["Dist_name"].ToString();
      string s = String.Format("{0:d9}", (DateTime.Now.Ticks / 10) % 1000000000);
      lbInvoice.Text = s;
      lbDist.Text = Session["Dist_name"].ToString();
      lbCustNo.Text = Application["CustomerNo"].ToString();
      lbCust.Text = Application["CustomerName"].ToString();
      DateTime dt = DateTime.UtcNow.Date;
      lbDate.Text = dt.ToString("MM/dd/yyyy");
      string time = DateTime.Now.ToString("h:mm:ss tt");
      lbTime.Text = time.ToString();
      showgrid();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
      //base.VerifyRenderingInServerForm(control);

    }
    private void exportpdf()
    {
      Response.ContentType = "application/pdf";
      Response.AddHeader("content-disposition", "attachment;filename=BillReceipt.pdf");
      Response.Cache.SetCacheability(HttpCacheability.NoCache);
      StringWriter sw = new StringWriter();
      HtmlTextWriter hw = new HtmlTextWriter(sw);
      Panel1.RenderControl(hw);
      StringReader sr = new StringReader(sw.ToString());
      Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
      HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
      PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
      pdfDoc.Open();
      htmlparser.Parse(sr);
      pdfDoc.Close();
      Response.Write(pdfDoc);
      Response.End();
    }



    protected void download_Click(object sender, EventArgs e)
    {
      exportpdf();
    }
    private void showgrid()
    {
      DataTable dt = new DataTable();
      DataRow dr;
      dt.Columns.Add("Company_Name");
      dt.Columns.Add("Product_name");
      dt.Columns.Add("Type");
      dt.Columns.Add("Number_Of_CementBags");
      dt.Columns.Add("Price");
      dt.Columns.Add("Amount");
      SqlCommand cmd = new SqlCommand("select * from PurchaseHistory where Dist_No=@d1 and User_No=@u1 and Date=@d2");
      cmd.Parameters.AddWithValue("@d1", Session["Dist_no"].ToString());
      cmd.Parameters.AddWithValue("@u1", lbCustNo.Text);
      cmd.Parameters.AddWithValue("@d2", lbDate.Text);
      cmd.Connection = con;
      SqlDataAdapter da = new SqlDataAdapter();
      da.SelectCommand = cmd;
      DataSet ds = new DataSet();
      da.Fill(ds);
      int totalrows = ds.Tables[0].Rows.Count;
      int i = 0;
      int grandtotal = 0;
      while (i < totalrows)
      {
        dr = dt.NewRow();
        dr["Company_Name"] = ds.Tables[0].Rows[i]["Company_Name"].ToString();
        dr["Product_name"] = ds.Tables[0].Rows[i]["Product_name"].ToString();
        dr["Type"] = ds.Tables[0].Rows[i]["Type"].ToString();
        dr["Number_Of_CementBags"] = ds.Tables[0].Rows[i]["Number_Of_CementBags"].ToString();
        dr["Price"] = ds.Tables[0].Rows[i]["Price"].ToString();
        int price = Convert.ToInt32(ds.Tables[0].Rows[i]["Price"].ToString());
        int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["Number_Of_CementBags"].ToString());
        int amount = price * quantity;
        dr["Amount"] = amount;
        grandtotal = grandtotal + amount;
        dt.Rows.Add(dr);
        i = i + 1;
      }
      GridView1.DataSource = dt;
      GridView1.DataBind();
      lbgtotal.Text = grandtotal.ToString();
      lbamount.Text = ConvertNumbertoWords(grandtotal);
    }
    public string ConvertNumbertoWords(long number)
    {
      if (number == 0) return "ZERO";
      if (number < 0) return "minus " + ConvertNumbertoWords(Math.Abs(number));
      string words = "";
      if ((number / 1000000) > 0)
      {
        words += ConvertNumbertoWords(number / 100000) + " LAKES ";
        number %= 1000000;
      }
      if ((number / 1000) > 0)
      {
        words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
        number %= 1000;
      }
      if ((number / 100) > 0)
      {
        words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
        number %= 100;
      }
      //if ((number / 10) > 0)  
      //{  
      // words += ConvertNumbertoWords(number / 10) + " RUPEES ";  
      // number %= 10;  
      //}  
      if (number > 0)
      {
        if (words != "") words += "AND ";
        var unitsMap = new[]
        {
            "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"
        };
        var tensMap = new[]
        {
            "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"
        };
        if (number < 20) words += unitsMap[number];
        else
        {
          words += tensMap[number / 10];
          if ((number % 10) > 0) words += " " + unitsMap[number % 10];
        }
      }
      return words;
    }
  }
}
