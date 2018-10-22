using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DairyInfo : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    DataSet ds2 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null && Session["UserName"] != null && Session["UserID"] != null)
            {
                PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
                ds1 = DS.BlogSelectByID(PS);
                repImage.DataSource = ds1;
                repImage.DataBind();
                repUser.DataSource = ds1;
                repUser.DataBind();
                repBlog.DataSource = ds1;
                repBlog.DataBind();

                pnlComment.Visible = true;
                btnLike.Visible = true;
                BindComment();
                //PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
                //ds2 = DS.CommentSelectByID(PS);
                //rpCmnt.DataSource = ds2;
                //rpCmnt.DataBind();
            }
            else
            {
                PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
                ds1 = DS.BlogSelectByID(PS);
                repImage.DataSource = ds1;
                repImage.DataBind();
                repUser.DataSource = ds1;
                repUser.DataBind();
                repBlog.DataSource = ds1;
                repBlog.DataBind();
                pnlComment.Visible = false;
                btnLike.Visible = false;
                BindComment();
                //Response.Redirect("Default.aspx");
            }
        }
    }
    public void BindComment()
    {
        PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
        ds2 = DS.CommentSelectByID(PS);
        rpCmnt.DataSource = ds2;
        rpCmnt.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            PS.CommenetDesc = txtComment.Text;
            DS.CommentInsert(PS);
            txtComment.Text = "";
            BindComment();
        }
        else
        {
            Response.Write("<script>alert('Please Login then Comment...');window.location.href='login.aspx'</script>");
           // Response.Redirect("Login.aspx");
            //pnlComment.Visible = false;
            //btnLike.Visible = false;
            txtComment.Text = "";
        }
    }
    protected void btnLike_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            PS.BlogID = Convert.ToInt32(Request.QueryString["id"]);
            PS.UserID = Convert.ToInt32(Session["UserID"].ToString());
            DS.LikeInsert(PS);
        }
        else
        {
            Response.Write("<script>alert('Please Login then Like...');window.location.href='login.aspx'</script>");
            //Response.Redirect("Login.aspx");
            //pnlComment.Visible = false;
            //btnLike.Visible = false;
        }
    }
}