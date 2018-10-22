using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManageBlog : System.Web.UI.Page
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
        rpBlog.DataSource = DS.BlogSelectAllAdmin();
        rpBlog.DataBind();
    }
    #endregion

    protected void rpBlog_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "approve")
        {
            PS.BlogID = Convert.ToInt32(e.CommandArgument);
            ds1 = DS.BlogSelectStatus(PS);

            string s = ds1.Tables[0].Rows[0]["IsApprove"].ToString();

            if (s == "N")
            {
                PS.IsAppove = "Y";
                DS.BlogUpdateApp(PS);
                BindRep();
            }
            else
            {
                PS.IsAppove = "N";
                DS.BlogUpdateApp(PS);
                BindRep();
            }
        }
    }
}