using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_Report2HighestBlogCat : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rpData.DataSource = DS.RefUserCount();
            rpData.DataBind();

            //Response.ClearContent();
            //Response.Buffer = true;
            //Response.AddHeader("Content-disposition", string.Format("attachment; filename={0}", "MostTestDownload.xls"));
            //Response.ContentType = "application/ms-excel";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter htw = new HtmlTextWriter(sw);
            //HtmlForm frm = new HtmlForm();
            //rpData.Page.Controls.Add(frm);
            ////GridView2.Parent.Controls.Add(frm);
            //frm.Attributes["runat"] = "server";
            //frm.Controls.Add(rpData);
            //frm.RenderControl(htw);

            ////GridView2.AllowPaging = false;
            ////FillGrid1();
            //for (int i = 0; i < rpData.Items.Count; i++)
            //{
            //    rpData.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");

            //}
            ////GridView1.RenderControl(htw);
            //Response.Write(sw.ToString());
            //Response.End();

        }
    }
}