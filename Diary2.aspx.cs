using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Diary : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    public void BindData()
    {
        ds1 = DS.BlogSelectAll();
        int cnt = ds1.Tables[0].Rows.Count;
        //set page data setting
        PagedDataSource pg = new PagedDataSource();
        pg.DataSource = ds1.Tables[0].DefaultView;
        pg.AllowPaging = true;
        pg.PageSize = 4;
        pg.CurrentPageIndex = pgNM;

        int vcnt = cnt / pg.PageSize;
        if (pgNM < 1)
            btnPrev.Visible = false;
        else if (pgNM > 0)
            btnPrev.Visible = true;

        if (pgNM == vcnt)
            btnNext.Visible = false;
        else if (pgNM < vcnt)
            btnNext.Visible = true;

        repDiary.DataSource = pg;
        repDiary.DataBind();
    }
    protected void repDiary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rc = (Repeater)e.Item.FindControl("rpcom");
        Repeater rl = (Repeater)e.Item.FindControl("rpLike");
        HiddenField h = (HiddenField)e.Item.FindControl("hf");
        PS.BlogID = Convert.ToInt32(h.Value);
        rc.DataSource = DS.CommentCountAll(PS);
        rc.DataBind();
        rl.DataSource = DS.LikeCountAll(PS);
        rl.DataBind();
    }
    public int pgNM
    {
        get 
        {
            if (ViewState["pgNM"] != null)
                return Convert.ToInt32(ViewState["pgNM"]);
            else
                return 0;
        }
        set
        {
            ViewState["pgNM"] = value;
        }
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        pgNM -= 1;
        BindData();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        pgNM += 1;
        BindData();
    }
}