using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Portfolio : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            btnAdd.Text = "ADD";
            BindRep();
            BindDropDown();
        }
    }
    #endregion

    #region Bind Dropdown
    public void BindDropDown()
    {
        ds = DS.CategorySelectAll();
        ddlCategory.DataSource = ds;
        ddlCategory.DataTextField = "CatName";
        ddlCategory.DataValueField = "CatID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, "--- Select Category ---");
    }
    #endregion

    #region Button Click Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.Pf_name = txtPortfoilio.Text;
            PS.CatId = Convert.ToInt32(ddlCategory.SelectedValue);
            fuImage.SaveAs(Server.MapPath("~/images/PImages/" + fuImage.FileName));
            PS.FilePath = fuImage.FileName;
            PS.Up_Date = Convert.ToDateTime(DateTime.Now);
            DS.PortfolioInsert(PS);
            BindRep();
            BindDropDown();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            PS.Pf_name = txtPortfoilio.Text;
            PS.CatId = Convert.ToInt32(ddlCategory.SelectedValue);
            fuImage.SaveAs(Server.MapPath("~/images/PImages/" + fuImage.FileName));
            PS.FilePath = fuImage.FileName;
            PS.Pf_id = Convert.ToInt32(hfID.Value);
            DS.PortfolioUpdate(PS);
            BindRep();
            BindDropDown();
            ClearControls();
            btnAdd.Text = "ADD";
        }
    }
    #endregion

    #region Cancel Button Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        ClearControls();
        BindDropDown();
        btnAdd.Text = "ADD";
    }
    #endregion

    #region Repeater Item Command Event
    protected void repPortfolio_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.Pf_id = Convert.ToInt32(e.CommandArgument);
            ds = DS.PortfolioSelectByID(PS);
            txtPortfoilio.Text = ds.Tables[0].Rows[0]["PFName"].ToString();
            ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CatID"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.Pf_id = Convert.ToInt32(e.CommandArgument);
            DS.PortfolioDelete(PS);
            BindRep();
        }
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        repPortfolio.DataSource = DS.PortfolioSelectAll();
        repPortfolio.DataBind();
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtPortfoilio.Text = "";
    }
    #endregion
}