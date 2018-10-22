using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Contactus : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds1 = DS.AdminSelectAll();
            rpDetails.DataSource = ds1;
            rpDetails.DataBind();
            BindRep();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        PS.UserName = txtName.Text;
        PS.EmailID = txtEmailID.Text;
        PS.FeedBack = txtFeedBack.Text;
        DS.FeedBackInsert(PS);
        txtName.Text = "";
        txtEmailID.Text = "";
        txtFeedBack.Text = "";
    }

    #region Bind Repeater
    public void BindRep()
    {
        rpFAQ.DataSource = DS.FAQSelectAll();
        rpFAQ.DataBind();
    }
    #endregion
}