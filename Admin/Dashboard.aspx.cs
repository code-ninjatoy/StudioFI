using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds1 = new DataSet();
    DataSet ds2 = new DataSet();
    DataSet ds3 = new DataSet();
    DataSet ds4 = new DataSet();
    DataSet ds5 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        ds1 = DS.CountAllUser();
        rpReg.DataSource = ds1;
        rpReg.DataBind();

        ds2 = DS.BookCountAll();
        rpBook.DataSource = ds2;
        rpBook.DataBind();

        ds3 = DS.CountRefAll();
        rpRef.DataSource = ds3;
        rpRef.DataBind();

        ds4 = DS.CountBlogAll();
        rpBlog.DataSource = ds4;
        rpBlog.DataBind();

    }
}