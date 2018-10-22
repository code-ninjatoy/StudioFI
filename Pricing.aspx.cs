using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pricing : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDropDown();
            drpCat.SelectedIndex = 0;
            BindRep();
        }
    }
    #region FillDrp
    public void BindDropDown()
    {
        ds1 = DS.CategorySelectAll();
        drpCat.DataSource = ds1;
        drpCat.DataTextField = "CatName";
        drpCat.DataValueField = "CatID";
        drpCat.DataBind();
        //drpCat.Items.Insert(0, "--- SELECT CATEGORY ---");
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        int i = Convert.ToInt32(drpCat.SelectedValue);
        rpPrice.DataSource = DS.PricingSelectByCategory(i);
        rpPrice.DataBind();
    }
    #endregion

    protected void drpCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindRep();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration.aspx");
    }
}