using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Verification : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    #endregion

    #region Button Click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        PS.VerCode = txtVer.Text;
        PS.UserID = Convert.ToInt32(Request.QueryString["ID"]);
        DS.UserVerify(PS);
        Response.Redirect("Login.aspx");
    }
    #endregion
}