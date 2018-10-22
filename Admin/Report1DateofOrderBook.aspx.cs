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

public partial class Admin_Report1DateofOrderBook : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PS.StartDate = Convert.ToDateTime("01/01/2015");
            PS.StopDate = Convert.ToDateTime("31/01/2015");
            BindRP();
        }
    }
    public void BindRP()
    {
        rpData.DataSource = DS.BookingSelectByDate(PS);
        rpData.DataBind();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMonth.SelectedIndex == 1)
        {
            PS.StartDate = Convert.ToDateTime("01/01/2015");
            PS.StopDate = Convert.ToDateTime("31/01/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 2)
        {
            PS.StartDate = Convert.ToDateTime("01/02/2015");
            PS.StopDate = Convert.ToDateTime("28/02/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 3)
        {
            PS.StartDate = Convert.ToDateTime("01/03/2015");
            PS.StopDate = Convert.ToDateTime("31/03/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 4)
        {
            PS.StartDate = Convert.ToDateTime("01/04/2015");
            PS.StopDate = Convert.ToDateTime("30/04/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 5)
        {
            PS.StartDate = Convert.ToDateTime("01/05/2015");
            PS.StopDate = Convert.ToDateTime("31/05/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 6)
        {
            PS.StartDate = Convert.ToDateTime("01/06/2015");
            PS.StopDate = Convert.ToDateTime("30/06/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 7)
        {
            PS.StartDate = Convert.ToDateTime("01/07/2015");
            PS.StopDate = Convert.ToDateTime("31/07/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 8)
        {
            PS.StartDate = Convert.ToDateTime("01/08/2015");
            PS.StopDate = Convert.ToDateTime("31/08/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 9)
        {
            PS.StartDate = Convert.ToDateTime("01/09/2015");
            PS.StopDate = Convert.ToDateTime("30/09/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 10)
        {
            PS.StartDate = Convert.ToDateTime("01/10/2015");
            PS.StopDate = Convert.ToDateTime("31/10/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 11)
        {
            PS.StartDate = Convert.ToDateTime("01/11/2015");
            PS.StopDate = Convert.ToDateTime("30/11/2015");
            BindRP();
        }
        if (ddlMonth.SelectedIndex == 12)
        {
            PS.StartDate = Convert.ToDateTime("01/12/2015");
            PS.StopDate = Convert.ToDateTime("31/12/2015");
            BindRP();
        }
    }
    protected void btnRP_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Details.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}