using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class Admin_Report2HighestBlogCat : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rpData.DataSource = DS.SelectRegisterUser();
            rpData.DataBind();
        }
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment;filename=Customers.xls");
        Response.ContentType = "applicatio/excel";
        StringWriter sw = new StringWriter(); ;
        HtmlTextWriter htm = new HtmlTextWriter(sw);
        rpData.RenderControl(htm);
        Response.Write("<table>");
        //Response.Write(stringWrite.ToString()); 
        Response.Write(sw.ToString());
        Response.Write("</table>");
        Response.End();
    }
    protected void btnRP_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Details.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        //Document pdfDoc = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
       Document pdfDoc = new Document(PageSize.A4, 0f, 0f, 0f, 0f);
        Font NormalFont = FontFactory.GetFont("Calibri", 8, Font.NORMAL, Color.BLACK);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}