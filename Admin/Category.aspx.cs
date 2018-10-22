using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Category : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAdd.Text = "ADD";
            BindRep();
        }
    }
    #endregion

    #region Button Click Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.CatName = txtCatName.Text;
            DS.CategoryInsert(PS);
            BindRep();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            PS.CatName = txtCatName.Text;
            PS.CatId = Convert.ToInt32(hfID.Value);
            DS.CategoryUpdate(PS);
            BindRep();
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
        btnAdd.Text = "ADD";
    }
    #endregion

    #region Repeater Item Command Event
    protected void repCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.CatId = Convert.ToInt32(e.CommandArgument);
            ds = DS.CategorySelectByID(PS);
            txtCatName.Text = ds.Tables[0].Rows[0]["CatName"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.CatId = Convert.ToInt32(e.CommandArgument);
            DS.CategoryDelete(PS);
            BindRep();
        }
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        repCategory.DataSource = DS.CategorySelectAll();
        repCategory.DataBind();
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtCatName.Text = "";
    }
    #endregion
}