using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeactivateAcc : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnDeactivate_Click(object sender, EventArgs e)
    {
        PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
        ds1 = DS.RegUserSelectByID(PS);
        pass = ds1.Tables[0].Rows[0]["Password"].ToString();
        if (txtpass.Text == pass)
        {
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            PS.Password = pass;
            DS.DeactivateUser(PS);
            Response.Write("<script>alert('Deativation Succesfull...!')</script>");
            Response.Redirect("Login.aspx");
            txtpass.Text = "";
        }
        else
        {
            Response.Write("<script>alert('Deativation Failed...!')</script>");
        }
    }
}