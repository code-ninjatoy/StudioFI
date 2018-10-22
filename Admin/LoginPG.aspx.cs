using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_LoginPG : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        PS.UserName = username.Text;
        PS.Password = password.Text;
        if (DS.CheckAdminLogin(PS))
        {
            Session["Uname"] = username.Text;
            Response.Redirect("~/Admin/Dashboard.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Username or Password')</script>");
        }
    }
}