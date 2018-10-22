using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageFAQ : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    #region LoadPage
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAdd.Text = "ADD";
            BindRep();
        }
    }
    #endregion

    #region ButtonClick
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.Question = txtQue.Text;
            PS.Answer = txtAns.Text;
            DS.FAQInsert(PS);
            BindRep();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            PS.Question = txtQue.Text;
            PS.Answer = txtAns.Text;
            PS.FId = Convert.ToInt32(hfID.Value);
            DS.FAQUpdate(PS);
            BindRep();
            ClearControls();
            btnAdd.Text = "ADD";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        ClearControls();
        btnAdd.Text = "ADD";
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        rpFAQ.DataSource = DS.FAQSelectAll();
        rpFAQ.DataBind();
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtQue.Text = "";
        txtAns.Text = "";
    }
    #endregion

    #region ItemCommand
    protected void rpFAQ_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.FId = Convert.ToInt32(e.CommandArgument);
            ds = DS.FAQSelectByID(PS);
            txtQue.Text = ds.Tables[0].Rows[0]["Question"].ToString();
            txtAns.Text = ds.Tables[0].Rows[0]["Answer"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.FId = Convert.ToInt32(e.CommandArgument);
            DS.FAQDelete(PS);
            BindRep();
        }
    }
    #endregion
}