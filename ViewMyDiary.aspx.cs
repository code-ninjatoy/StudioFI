using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMyDiary : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    int i = 0;

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRep();
        }
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        if (Session["UserID"] != null)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            rpDairy.DataSource = DS.BlogSelectByUser(PS);
            rpDairy.DataBind();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    #endregion

    protected void rpDairy_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        LinkButton lnkCom = (LinkButton)e.Item.FindControl("MoreCmt");
        Repeater rp = (Repeater)e.Item.FindControl("rpComment");
        if (e.CommandName == "Comment")
        {
            rp.Visible = true;
            PS.BlogID = Convert.ToInt32(e.CommandArgument);
            rp.DataSource = DS.CommentSelectByID(PS);
            rp.DataBind();
            lnkCom.Text = "Hide Comment";
        }
    }
}