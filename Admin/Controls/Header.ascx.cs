using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Controls_Header : System.Web.UI.UserControl
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds1 = DS.AdminSelectAll();
            repImage.DataSource = ds1;
            repImage.DataBind();
        }
    }
    protected void lnklogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("LoginPG.aspx");
    }
}