using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CSlideBar : System.Web.UI.UserControl
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            ds1 = DS.RegUserSelectByID(PS);
            rep1.DataSource = ds1;
            rep1.DataBind();
        }
    }
    #region Logout Button
    protected void lnbLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    #endregion
}