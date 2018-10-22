using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddDiary : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDrop();
            BindRep();
        }
    }
    #endregion

    #region Bind Dropdown
    public void BindDrop()
    {
        ds1 = DS.CategorySelectAll();
        ddlCat.DataSource = ds1;
        ddlCat.DataTextField = "CatName";
        ddlCat.DataValueField = "CatID";
        ddlCat.DataBind();
        ddlCat.Items.Insert(0, "Select Category");
    }
    #endregion

    #region Clear
    public void Clear()
    {
        txtTitle.Text = "";
        txtDesc.Text = "";
        BindDrop();
    }
    #endregion

    #region Button Click Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.CatId = Convert.ToInt32(ddlCat.SelectedValue);
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            PS.BlogTitle = txtTitle.Text;
            fuImage.SaveAs(Server.MapPath("images/BlogImages/" + fuImage.FileName));
            PS.BlogImage = fuImage.FileName;
            PS.BlogDesc = txtDesc.Text;
            PS.CreateDate = Convert.ToDateTime(DateTime.Now);
            DS.BlogInsert(PS);
            BindDrop();
            BindRep();
            Clear();
        }
        if (btnAdd.Text == "UPDATE")
        {
            PS.BlogID = Convert.ToInt32(hfID.Value);
            PS.CatId = Convert.ToInt32(ddlCat.SelectedValue);
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            PS.BlogTitle = txtTitle.Text;
            fuImage.SaveAs(Server.MapPath("images/BlogImages/" + fuImage.FileName));
            PS.BlogImage = fuImage.FileName;
            PS.BlogDesc = txtDesc.Text;
            PS.CreateDate = Convert.ToDateTime(DateTime.Now);
            DS.BlogUpdate(PS);
            Response.Write("<script>alert('Your Dairy Is Update Succefully..! ');</script>");
            BindDrop();
            BindRep();
            Clear();
        }
    }
    #endregion

    #region Cancel Button Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindDrop();
        BindRep();
        Clear();
        btnAdd.Text = "ADD";
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        if (Session["UserID"] != null)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            repCategory.DataSource = DS.BlogSelectByUser(PS);
            repCategory.DataBind();
        }
        else
        {
            Response.Write("alter('Please Login..')");
            Response.Redirect("Login.aspx");
        }
    }
    #endregion

    #region Repeater Item Command Event
    protected void repCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.BlogID = Convert.ToInt32(e.CommandArgument);
            ds = DS.BlogSelectByID(PS);
            txtTitle.Text = ds.Tables[0].Rows[0]["BlogTitle"].ToString();
            txtDesc.Text = ds.Tables[0].Rows[0]["BlogDesc"].ToString();
            ddlCat.SelectedValue = ds.Tables[0].Rows[0]["CatID"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.BlogID = Convert.ToInt32(e.CommandArgument);
            DS.BlogDelete(PS);
            BindRep();         
        }
    }
    #endregion
    protected void repCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //getting username from particular row
        string BlogID = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "BlogID"));
        LinkButton lnkbtnresult = (LinkButton)e.Item.FindControl("lnbDelete");
        lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + BlogID + "')");
    }
}