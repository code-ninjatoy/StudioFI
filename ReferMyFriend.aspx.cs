using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReferMyFriend : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRep();
        }
    }
    #endregion

    #region Clear
    public void Clear()
    {
        txtEmail.Text = "";
        txtName.Text = "";
    }
    #endregion

    #region Button Click Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "REFER")
        {
            PS.EmailID = txtEmail.Text;
            if ((DS.ForgotPasswordUser(PS)).Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('Already Registerd!')</script>");
                Clear();
            }
            else
            {

                PS.UserName = Session["UserName"].ToString();
                ds1 = DS.ReferSelectUser(PS);
                PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
                PS.RefName = txtName.Text;
                PS.RefEmail = txtEmail.Text;
                PS.CreateDate = Convert.ToDateTime(DateTime.Now);

                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
                {
                    body = reader.ReadToEnd();
                }
                body = body.Replace("{Greeting}", "Welcome, " + txtName.Text);
                body = body.Replace("{Title}", "Reference Of FI Studio");
                body = body.Replace("{Description}", "Please Refer This Web Site For Your Photoshoot. This Mail Is Send By Your Friend " + ds1.Tables[0].Rows[0]["UserName"].ToString() + ". Thankyou");

                string rs = DS.sendMail(txtEmail.Text, "Reference Of FI Studio", body);

                if (rs == "1")
                {
                    DS.ReferInsert(PS);
                }
                BindRep();
                Clear();
                Response.Write("<script>alert('Reference Sent Succefully...!')</script>");
            }
        }
    }
    #endregion

    #region Cancel Button Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        Clear();
        btnAdd.Text = "REFER";
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
        repCategory.DataSource = DS.SelectRefUserByID(PS);
        repCategory.DataBind();
    }
    #endregion
}