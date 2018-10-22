using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SubCategoryPG : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();

    #region LoadEvent
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


    #region Bind Repeater
    public void BindRep()
    {
        repSubCategory.DataSource = DS.SubCategorySelectAll();
        repSubCategory.DataBind();
    }
    #endregion

    #region Bind Dropdown
    public void BindDropDown()
    {
        ds1 = DS.CategorySelectAll();
        ddlsubcat.DataSource = ds1;
        ddlsubcat.DataTextField = "CatName";
        ddlsubcat.DataValueField = "CatID";
        ddlsubcat.DataBind();
        ddlsubcat.Items.Insert(0, "--- Select Category ---");
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtSubCatName.Text = "";
        ddlsubcat.SelectedIndex = 0;
    }
    #endregion

    #region ItemCommand
    protected void repSubCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.SubCatID = Convert.ToInt32(e.CommandArgument);
            ds = DS.SubCategorySelectByID(PS);
            txtSubCatName.Text = ds.Tables[0].Rows[0]["SubCatName"].ToString();
            ddlsubcat.SelectedValue = ds.Tables[0].Rows[0]["CatID"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.SubCatID = Convert.ToInt32(e.CommandArgument);
            DS.SubCategoryDelete(PS);
            BindRep();
        }

    }
    #endregion

    #region AddBtn
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.SubCatName = txtSubCatName.Text;
            PS.CatId = Convert.ToInt32(ddlsubcat.SelectedValue);
            DS.SubCategoryInsert(PS);
            BindRep();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            PS.SubCatName = txtSubCatName.Text;
            PS.CatId = Convert.ToInt32(ddlsubcat.SelectedValue);
            PS.SubCatID = Convert.ToInt32(hfID.Value);
            DS.SubCategoryUpdate(PS);
            BindRep();
            ClearControls();
            btnAdd.Text = "ADD";
        }

    }
    #endregion

    #region Cancelbtn
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        ClearControls();
        btnAdd.Text = "ADD";
    }
    #endregion

}