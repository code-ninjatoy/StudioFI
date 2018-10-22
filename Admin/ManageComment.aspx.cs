using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageComment : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRep();
        }
    }

    #region Bind Repeater
    public void BindRep()
    {
        rpComment.DataSource = DS.CommentSelectAllAdmin();
        rpComment.DataBind();
    }
    #endregion

    protected void rpComment_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "approve")
        {
            PS.CommentID = Convert.ToInt32(e.CommandArgument);
            ds1 = DS.CommentSelectStatus(PS);

            string s = ds1.Tables[0].Rows[0]["IsApprove"].ToString();

            if (s == "N")
            {
                PS.IsAppove = "Y";
                DS.CommentUpdateApp(PS);
                BindRep();
            }
            else
            {
                PS.IsAppove = "N";
                DS.CommentUpdateApp(PS);
                BindRep();
            }
        }
    }
}