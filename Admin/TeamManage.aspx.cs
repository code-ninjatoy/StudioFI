using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_TeamManage : System.Web.UI.Page
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
        }
    }
    #region Bind Repeater
    public void BindRep()
    {
        repTeam.DataSource = DS.TeamSelectAll();
        repTeam.DataBind();
    }
    #endregion
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "ADD")
        {
            PS.TeamName = txtteamnm.Text;
            PS.PersonWork = txtwork.Text;
            teamImage.SaveAs(Server.MapPath("~/images/TeamImg/" + teamImage.FileName));
            PS.PersonImg = teamImage.FileName;
            PS.PersonDesc = txtdesc.Text;
            DS.TeamInsert(PS);
            BindRep();
            ClearControls();
        }

        if (btnAdd.Text == "UPDATE")
        {
            PS.TeamName = txtteamnm.Text;
            PS.PersonWork = txtwork.Text;
            teamImage.SaveAs(Server.MapPath("~/images/TeamImg/" + teamImage.FileName));
            PS.PersonImg = teamImage.FileName;
            PS.PersonDesc = txtdesc.Text;
            PS.TeamID = Convert.ToInt32(hfID.Value);
            DS.TeamUpdate(PS);
            BindRep();
            ClearControls();
            btnAdd.Text = "ADD";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        BindRep();
        ClearControls();
        btnAdd.Text = "ADD";
    }
    protected void repTeam_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            hfID.Value = Convert.ToString(e.CommandArgument);
            PS.TeamID = Convert.ToInt32(e.CommandArgument);
            ds = DS.TeamSelectByID(PS);
            txtteamnm.Text = ds.Tables[0].Rows[0]["TeamName"].ToString();
            txtwork.Text = ds.Tables[0].Rows[0]["PersonWork"].ToString();
            txtdesc.Text = ds.Tables[0].Rows[0]["PersonDesc"].ToString();
            btnAdd.Text = "UPDATE";
        }

        if (e.CommandName == "Delete")
        {
            PS.TeamID = Convert.ToInt32(e.CommandArgument);
            DS.TeamDelete(PS);
            BindRep();
        }
    }
    public void ClearControls()
    {
        txtteamnm.Text = "";
        txtwork.Text = "";
        txtdesc.Text = "";
    }
}