using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class AddBooking : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();
    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAdd.Text = "ADD";
            BindRep();
            BindCatDrp();
            ddlCat.Items.Insert(0, "--- Select Category ---");
            drpSubCate.Items.Insert(0, "--- Select Package ---");
        }
    }
    #endregion

    #region Bind Repeter
    public void BindRep()
    {
        if (Session["UserID"] != null)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"]);
            rpBooking.DataSource = DS.BookingByUser(PS);
            rpBooking.DataBind();
        }
        else
        {
            Response.Write("alter('Please Login..')");
            Response.Redirect("Login.aspx");
        }
    }
    #endregion

    #region AddBtn
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            PS.CatId = Convert.ToInt32((ddlCat.SelectedItem.Value));
            PS.SubCatID = Convert.ToInt32((drpSubCate.SelectedItem.Value));
            PS.BookDesc = txtDesc.Text;
            PS.BookDate =  Convert.ToDateTime(txtDate.Text);
           // PS.BookDate = Convert.ToDateTime(cal.SelectedDate.ToShortDateString());
            string dt = txtDate.Text;
            //string dt = cal.SelectedDate.ToShortDateString();
            DS.BookingInsert(PS);
            BindRep();
            ClearControls();

            string un = Session["UserName"].ToString();
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Greeting}", "Welcome Admin");
            body = body.Replace("{Title}", "Booking Notification");
            body = body.Replace("{Description}", un  + " is Booking a shoot on  : " + dt);

            string rs = DS.sendMail("charmimargi@gmail.com" , "Booking", body);
        }
        if (btnAdd.Text == "UPDATE")
        {
            PS.CatId = Convert.ToInt32(ddlCat.SelectedItem.Value);
            PS.SubCatID = Convert.ToInt32(drpSubCate.SelectedItem.Value);
            PS.BookDate = Convert.ToDateTime(txtDate.Text);
            PS.BookDesc = txtDesc.Text;
            PS.BookID = Convert.ToInt32(hfID.Value);
            DS.BookingUpdate(PS);
            BindRep();
            ClearControls();
            btnAdd.Text = "ADD";
        }
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtDesc.Text = "";
        txtDate.Text = "";
        ddlCat.SelectedIndex = 0;
        drpSubCate.SelectedIndex = 0;
    }
    #endregion

    #region Bind Dropdown
    public void BindCatDrp()
    {
        ds1 = DS.CategorySelectAll();
        ddlCat.DataSource = ds1;
        ddlCat.DataTextField = "CatName";
        ddlCat.DataValueField = "CatID";
        ddlCat.DataBind();

    }
    #endregion

    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpSubCate.DataSource = DS.BookingSelectByCatID(Convert.ToInt32(ddlCat.SelectedItem.Value));
        drpSubCate.DataTextField = "SubCatName";
        drpSubCate.DataValueField = "SubCatID";
        drpSubCate.DataBind();
    }

    protected void rpBooking_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DataSet ds = new DataSet();
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.BookID = Convert.ToInt32(e.CommandArgument);
            ds = DS.BookingSelectByID(PS);

            ddlCat.SelectedValue = ds.Tables[0].Rows[0]["CatID"].ToString();
            drpSubCate.DataSource = DS.BookingSelectByCatID(Convert.ToInt32(ddlCat.SelectedValue));
            drpSubCate.DataTextField = "SubCatName";
            drpSubCate.DataValueField = "SubCatID";
            drpSubCate.DataBind();
            drpSubCate.SelectedValue = ds.Tables[0].Rows[0]["SubCatID"].ToString();

            txtDesc.Text = ds.Tables[0].Rows[0]["BookDesc"].ToString();
            txtDate.Text = ds.Tables[0].Rows[0]["BookDate"].ToString();
           // cal.SelectedDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["BookDate"]);
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.BookID = Convert.ToInt32(e.CommandArgument);
            DS.BookingDelete(PS);
            BindRep();
        }
    }
}