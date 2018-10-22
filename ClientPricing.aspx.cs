using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientPricing : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDropDown();
            BindRep();
            drpcat.SelectedIndex = 0;
        }
    }
    #region FillDrp
    public void BindDropDown()
    {
        ds1 = DS.CategorySelectAll();
        drpcat.DataSource = ds1;
        drpcat.DataTextField = "CatName";
        drpcat.DataValueField = "CatID";
        drpcat.DataBind();
        //drpCat.Items.Insert(0, "--- SELECT CATEGORY ---");
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        int i = Convert.ToInt32(drpcat.SelectedValue);
        rpPrice.DataSource = DS.PricingSelectByCategory(i);
        rpPrice.DataBind();
    }
    #endregion
   
    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindRep();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddBooking.aspx");
    }
}