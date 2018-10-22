using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientEditProfile : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            ds1 = DS.RegUserSelectByID(PS);
            txtFullName.Text = ds1.Tables[0].Rows[0]["UserName"].ToString();
            txtEmailID.Text = ds1.Tables[0].Rows[0]["EmailID"].ToString();
            txtAddress.Text = ds1.Tables[0].Rows[0]["Addr"].ToString();
            txtPhone.Text = ds1.Tables[0].Rows[0]["Phone"].ToString();
            txtDOB.Text = ds1.Tables[0].Rows[0]["DOBM"].ToString();

            string s = ds1.Tables[0].Rows[0]["Gender"].ToString();
            if (s == "M")
            {
                rdbM.Checked = true;
            }
            else
            {
                rdbF.Checked = true;
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditClientProfile.aspx");
    }

    protected void btnApply1_Click(object sender, EventArgs e)
    {
        PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
        ds1 = DS.RegUserSelectByID(PS);
        pass = ds1.Tables[0].Rows[0]["Password"].ToString();
        if (txtMasterPass.Text == pass)
        {
            if (fvPro.HasFile)
            {
                PS.UserName = txtFullName.Text;
                PS.EmailID = txtEmailID.Text;
                PS.Addr = txtAddress.Text;
                PS.Phone = Convert.ToDouble(txtPhone.Text);
                fvPro.SaveAs(Server.MapPath("images/UserImages/" + fvPro.FileName));
                PS.ProfilePic = fvPro.FileName;
                PS.DOB = Convert.ToDateTime(txtDOB.Text);
                if (rdbF.Checked)
                {
                    PS.Gender = "F";
                }
                else
                {
                    PS.Gender = "M";
                }
                PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
                DS.UserUpdate(PS);
            }
            else
            {
                Response.Write("<script>alert('Please Upload Profile Image.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Please Enter Correct Password.')</script>");
        }
    }
    protected void btnCancelpass_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientEditProfile.aspx");
    }
    protected void btnApplypass_Click(object sender, EventArgs e)
    {
        PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
        ds1 = DS.RegUserSelectByID(PS);
        pass = ds1.Tables[0].Rows[0]["Password"].ToString();

        if (txtCurrPass.Text != pass)
        {
            Response.Write("<script>alert('Current Password Wrong..!')</script>");
        }
        else if (txtCurrPass.Text == pass && txtNewPass.Text == txtReNewPass.Text)
        {
            PS.Password = txtNewPass.Text;
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            DS.UserUpdatePassword(PS);
        }
        else
        {
            Response.Write("<script>alert('Password Error..!')</script>");
        }
    }
}