﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_FeedBackPG : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
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
        FeedbackRep.DataSource = DS.SelectFeedbackUser();
        FeedbackRep.DataBind();
    }
    #endregion
}