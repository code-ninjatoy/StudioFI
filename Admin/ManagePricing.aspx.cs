using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManagePricing : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCatDrp();
            BindRep();
            ddlCategory.Items.Insert(0, "--- Select Category ---");
            ddlSubCat.Items.Insert(0, "--- Select Package ---");
            btnAdd.Text = "ADD";
        }
    }

    #region Bind Dropdown
    public void BindCatDrp()
    {
        ds1 = DS.CategorySelectAll();
        ddlCategory.DataSource = ds1;
        ddlCategory.DataTextField = "CatName";
        ddlCategory.DataValueField = "CatID";
        ddlCategory.DataBind();

    }

    protected void ddlCategory_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ddlSubCat.DataSource = DS.BookingSelectByCatID(Convert.ToInt32(ddlCategory.SelectedItem.Value));
        ddlSubCat.DataTextField = "SubCatName";
        ddlSubCat.DataValueField = "SubCatID";
        ddlSubCat.DataBind();
    }

    #endregion

  
    #region Bind Repeater
    public void BindRep()
    {
        rpPackage.DataSource = DS.PricingSelectAll();
        rpPackage.DataBind();
    }
    #endregion

    #region ClearControl
    public void ClearControl()
    {
        txtPrice.Text = "";
        txtOutfit.Text = "";
        txtEdited.Text = "";
        txtDesc.Text = "";
        txtImages.Text = "";
        txtLoc.Text = "";
        ddlCategory.SelectedIndex = 0;
        ddlSubCat.SelectedIndex = 0;
    }
    #endregion

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.CatId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            PS.SubCatID = Convert.ToInt32(ddlSubCat.SelectedItem.Value);
            coverImage.SaveAs(Server.MapPath("~/images/PricingImage/" + coverImage.FileName));
            PS.Price = Convert.ToDecimal(txtPrice.Text);
            PS.DefImage = coverImage.FileName;
            PS.LocationHour = txtLoc.Text;
            PS.OutfitChange = txtOutfit.Text;
            PS.ImagesCapt = txtImages.Text;
            PS.EditedImage = txtEdited.Text;
            PS.Description = txtDesc.Text;
            DS.PricingInsert(PS);
            btnAdd.Text = "Update";
            ClearControl();
            BindRep();
        }
        if (btnAdd.Text == "UPDATE")
        {
            PS.CatId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            PS.SubCatID = Convert.ToInt32(ddlSubCat.SelectedItem.Value);
            coverImage.SaveAs(Server.MapPath("~/images/PricingImage/" + coverImage.FileName));
            PS.Price = Convert.ToDecimal(txtPrice.Text);
            PS.DefImage = coverImage.FileName;
            PS.LocationHour = txtLoc.Text;
            PS.OutfitChange = txtOutfit.Text;
            PS.ImagesCapt = txtImages.Text;
            PS.EditedImage = txtEdited.Text;
            PS.Description = txtDesc.Text;
            PS.PID = Convert.ToInt32(hfID.Value);
            DS.PricingUpdate(PS);
            BindRep();
            ClearControl();
            btnAdd.Text = "ADD";
        }
    }
    protected void rpPackage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.PID = Convert.ToInt32(e.CommandArgument);
            ds = DS.PricingSelectByID(PS);

            
            ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CatID"].ToString();
            ddlSubCat.DataSource = DS.BookingSelectByCatID(Convert.ToInt32(ddlCategory.SelectedValue));
            ddlSubCat.DataTextField = "SubCatName";
            ddlSubCat.DataValueField = "SubCatID";
            ddlSubCat.DataBind();
            ddlSubCat.SelectedValue = ds.Tables[0].Rows[0]["SubCatID"].ToString();

            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtLoc.Text = ds.Tables[0].Rows[0]["LocationHour"].ToString();
            txtOutfit.Text = ds.Tables[0].Rows[0]["OutfitChange"].ToString();
            txtImages.Text = ds.Tables[0].Rows[0]["ImagesCapt"].ToString();
            txtEdited.Text = ds.Tables[0].Rows[0]["EditedImage"].ToString();
            txtDesc.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.PID = Convert.ToInt32(e.CommandArgument);
            DS.PricingDelete(PS);
            BindRep();
        }
    }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearControl();
        BindRep();
        btnAdd.Text = "ADD";

    }
}