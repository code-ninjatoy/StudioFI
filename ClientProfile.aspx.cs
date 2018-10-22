using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientProfile : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    DataSet ds2 = new DataSet();
    DataSet ds3 = new DataSet();
    DataSet ds4 = new DataSet();
    DataSet ds5 = new DataSet();
    DataSet ds6 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] != null && Session["UserName"] != null)
            {
                PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
                ds1 = DS.RegUserSelectByID(PS);
                rep1.DataSource = ds1;
                rep1.DataBind();

                ds2 = DS.CountBlogByUser(PS);
                rpDairy.DataSource = ds2;
                rpDairy.DataBind();

                ds3 = DS.CommentCountByUser(PS);
                rpComm.DataSource = ds3;
                rpComm.DataBind();

                ds4 = DS.BookCount(PS);
                rpBook.DataSource = ds4;
                rpBook.DataBind();

                ds5 = DS.CountRef(PS);
                rpRefer.DataSource = ds5;
                rpRefer.DataBind();

                ds6 = DS.LikeCount(PS);
                rpLike.DataSource = ds6;
                rpLike.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}