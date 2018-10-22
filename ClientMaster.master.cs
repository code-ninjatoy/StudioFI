using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null && Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //else if (Session["UserID"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }
    }
}
