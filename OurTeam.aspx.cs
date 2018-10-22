using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OurTeam : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds1 = DS.TeamSelectAll();
            rep1.DataSource = ds1;
            rep1.DataBind();

            rep2.DataSource = ds1;
            rep2.DataBind();
        }
    }
}