using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManageCoverImage : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAdd.Text = "ADD";
            BindRep();
            BindDropDown();
        }
    }

    #region Bind Dropdown
    public void BindDropDown()
    {
        ds = DS.TeamSelectAll();
        ddlteamname.DataSource = ds;
        ddlteamname.DataTextField = "TeamName";
        ddlteamname.DataValueField = "TeamID";
        ddlteamname.DataBind();
        ddlteamname.Items.Insert(0, "--- Select Photographer ---");
    }
    #endregion

    #region Bind Repeater
    public void BindRep()
    {
        repcoverimg.DataSource = DS.CoverSelectAll();
        repcoverimg.DataBind();
    }
    #endregion

    #region Clear Controls
    public void ClearControls()
    {
        txtdesc.Text = "";

    }
    #endregion

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            coverImage.SaveAs(Server.MapPath("~/images/CoverIMG/" + coverImage.FileName));
            PS.CoverImg = coverImage.FileName;
            PS.CoverDesc = txtdesc.Text;
            PS.TeamID = Convert.ToInt32(ddlteamname.SelectedValue);
            DS.CoverInsert(PS);
            BindRep();
            BindDropDown();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            coverImage.SaveAs(Server.MapPath("~/images/CoverIMG/" + coverImage.FileName));
            PS.CoverImg = coverImage.FileName;
            PS.CoverDesc = txtdesc.Text;
            PS.TeamID = Convert.ToInt32(ddlteamname.SelectedValue);
            PS.CoverID = Convert.ToInt32(hfID.Value);
            DS.CoverUpdate(PS);
            BindRep();
            BindDropDown();
            ClearControls();
            btnAdd.Text = "ADD";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        ClearControls();
        BindDropDown();
        btnAdd.Text = "ADD";
    }
    protected void repcoverimg_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.CoverID = Convert.ToInt32(e.CommandArgument);
            ds = DS.CoverSelectByID(PS);
            txtdesc.Text = ds.Tables[0].Rows[0]["CoverDesc"].ToString();
            ddlteamname.SelectedValue = ds.Tables[0].Rows[0]["TeamID"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.CoverID = Convert.ToInt32(e.CommandArgument);
            DS.CoverDelete(PS);
            BindRep();
        }
    }
}