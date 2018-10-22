using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Portfoilio : System.Web.UI.Page
{
    Pservice PS = new Pservice();
    DataService DS = new DataService();
    DataSet ds1 = new DataSet();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds1 = DS.TeamSelectAll();
            repPhotographer.DataSource = ds1;
            repPhotographer.DataBind();

            if (Request.QueryString["id"] == "PERSONAL")
            {
                PS.CatName = Request.QueryString["id"].ToString();
                ds1 = DS.PortfolioSelectByCategory(PS);
                repPortfolio.DataSource = ds1;
                repPortfolio.DataBind();
            }
            if (Request.QueryString["id"] == "CHILDREN")
            {
                PS.CatName = Request.QueryString["id"].ToString();
                ds1 = DS.PortfolioSelectByCategory(PS);
                repPortfolio.DataSource = ds1;
                repPortfolio.DataBind();
            }
            if (Request.QueryString["id"] == "WEDDING")
            {
                PS.CatName = Request.QueryString["id"].ToString();
                ds1 = DS.PortfolioSelectByCategory(PS);
                repPortfolio.DataSource = ds1;
                repPortfolio.DataBind();
            }
            if (Request.QueryString["id"] == "PRE-WEDDING")
            {
                PS.CatName = Request.QueryString["id"].ToString();
                ds1 = DS.PortfolioSelectByCategory(PS);
                repPortfolio.DataSource = ds1;
                repPortfolio.DataBind();
            }
            //if (Request.QueryString["id"] == "ANIMAL")
            //{
            //    PS.CatName = Request.QueryString["id"].ToString();
            //    ds1 = DS.PortfolioSelectByCategory(PS);
            //    repPortfolio.DataSource = ds1;
            //    repPortfolio.DataBind();
            //}
        }
    }
    #endregion
}