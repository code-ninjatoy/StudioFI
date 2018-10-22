using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Admin_BookingEvent : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRep();
        }
    }
    protected void rpBooking_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Finish")
        {
            DataSet ds = new DataSet();
            //hfID.Value = Convert.ToString(e.CommandArgument);
            PS.BookID = Convert.ToInt32(e.CommandArgument);
            DS.BookingUpSt(PS);
            BindRep();
        }
        if (e.CommandName == "Mail")
        {
            DataSet ds = new DataSet();
            int i = Convert.ToInt32(e.CommandArgument);
            ds = DS.BookingAllDetBYID(i);
            txtUname.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            txtEmailID.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
            hfID.Value = e.CommandArgument.ToString();
        }
    }
    #region Bind
    public void BindRep()
    {
        ds1 = DS.BookingAllDet();
        rpBooking.DataSource = ds1;
        rpBooking.DataBind();
    }
    #endregion
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string un = txtUname.Text;
        string em = txtEmailID.Text;
        string desc = txtDesc.Text;
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Greeting}", "Welcome " + un);
        body = body.Replace("{Title}", "Booking Verification");
        body = body.Replace("{Description}", desc);

        string rs = DS.sendMail(em, "Booking", body);

        if (rs == "1")
        {
            PS.BookID = Convert.ToInt32(hfID.Value);
            DS.BookingUpMail(PS);
            BindRep();
            Response.Write("<script>alert('Mail Sent.')</script>");
            ClearControl();
        }
        else
        {
            Response.Write("<script>alert('Mail Cannot Sent.')</script>");
        }
    }
    public void ClearControl()
    {
        txtUname.Text = "";
        txtEmailID.Text = "";
        txtDesc.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearControl();
        BindRep();
    }
}