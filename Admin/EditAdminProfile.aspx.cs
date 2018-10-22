using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_EditAdminProfile : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Uname"] == null)
            {
                Response.Redirect("~/Admin/LoginPG.aspx");
            }
            ds1 = DS.AdminSelectAll();
            repImage.DataSource = ds1;
            repImage.DataBind();

            txtUsername.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["UserName"].ToString();
            txtfullname.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["Fullname"].ToString();
            txtEmailID.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["EmailID"].ToString();
            txtDOB.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["AdminDate"].ToString();
            txtAddress.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["Address"].ToString();
            txtMobile.Text = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["Phone"].ToString();
            imgPro.ImageUrl = "~/images/AdminIMG/" + DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["Image"].ToString();
        }
    }
    #endregion

    #region UpdateAbout

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        PS.Fullname = txtfullname.Text;
        PS.UserName = txtUsername.Text;
        PS.EmailID = txtEmailID.Text;
        PS.DOB = Convert.ToDateTime(txtDOB.Text);
        PS.Address = txtAddress.Text;
        PS.Phone = Convert.ToDouble(txtMobile.Text);
        DS.AdminUpdateAbout(PS);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditAdminProfile.aspx");
    }
    #endregion

    #region Update Password
    protected void btnUpPass_Click(object sender, EventArgs e)
    {
        PS.Password = txtNew.Text;
        PS.UserName = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["UserName"].ToString();
        DS.AdminUpdatePassword(PS);
        Response.Write("<script>alert('Successfully Password Change..')</script>");
    }
    protected void btnUpCancel_Click(object sender, EventArgs e)
    {
        txtOld.Text = "";
        txtNew.Text = "";
        txtConfirm.Text = "";
    }
    #endregion

    #region Update Profile Pic
    protected void btnProUpdate_Click(object sender, EventArgs e)
    {
        fuImage.SaveAs(Server.MapPath("~/images/AdminIMG/" + fuImage.FileName));
        PS.Image = fuImage.FileName;
        PS.UserName = DS.AdminProfile(Session["Uname"].ToString()).Tables[0].Rows[0]["UserName"].ToString();
        DS.AdminUpdateProfilePic(PS);
    }
    protected void btnProCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditAdminProfile.aspx");
    }
    #endregion
}