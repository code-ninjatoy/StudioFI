using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Button Click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        PS.EmailID = txtEmail.Text;
        PS.Password = txtPassword.Text;
        ds1 = DS.LoginUser(PS);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            String Status = ds1.Tables[0].Rows[0]["Status"].ToString();
            if (Status == "A")
            {
                Session["UserID"] = ds1.Tables[0].Rows[0]["UserID"].ToString();
                Session["UserName"] = ds1.Tables[0].Rows[0]["UserName"].ToString();
                Response.Redirect("ClientProfile.aspx");
            }
            else
            {
                Response.Redirect("Verification.aspx?ID=" + ds1.Tables[0].Rows[0]["UserID"].ToString());
            }
        }
        else
        {
            Response.Write("<script>alert('Invalid Username and Password.');window.location.href='login.aspx'</script>");
            //Response.Redirect("Login.aspx");
        }
    }
    #endregion

    #region Forgot Password
    protected void btnForgot_Click(object sender, EventArgs e)
    {
        PS.EmailID = txtEmail.Text;
        ds1 = DS.ForgotPasswordUser(PS);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Greeting}", "Welcome, " + ds1.Tables[0].Rows[0]["UserName"]);
            body = body.Replace("{Title}", "Forgot Password");
            body = body.Replace("{Description}", "Your Password Is : " + ds1.Tables[0].Rows[0]["Password"]);

            String rs = DS.sendMail(txtEmail.Text, "Forgot Password", body);

            if (rs == "1")
            {
                Response.Write("<script>alert('Mail Send Successfully On Your Email ID.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Email ID Is Not Valid.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Email ID Is Not Valid.')</script>");
        }
    }
    #endregion

    #region Resend Verification
    protected void btnResendVer_Click(object sender, EventArgs e)
    {
        PS.EmailID = txtEmail.Text;
        ds1 = DS.ForgotPasswordUser(PS);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Greeting}", "Welcome, " + ds1.Tables[0].Rows[0]["UserName"]);
            body = body.Replace("{Title}", "Verification Code");
            body = body.Replace("{Description}", "Your Verification Code Is : " + ds1.Tables[0].Rows[0]["VerCode"]);

            String rs = DS.sendMail(txtEmail.Text, "Verification Code", body);

            if (rs == "1")
            {
                Response.Write("<script>alert('Mail Send Successfully On Your Email ID.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Email ID Is Not Valid.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Email ID Is Not Valid.')</script>");
        }
    }
    #endregion
}