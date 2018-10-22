using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Button Click
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        PS.UserName = txtUname.Text;
        PS.EmailID = txtEmailID.Text;
        PS.Addr = txtadd.Text;
        PS.Phone = Convert.ToDouble(txtphone.Text);
        PS.Password = txtPassword.Text;
        PS.DOB = Convert.ToDateTime(txtDOB.Text);
        if (rdbGender.SelectedIndex == 0)
        {
            PS.Gender = "M";
        }
        else
        {
            PS.Gender = "F";
        }

        fuProfile.SaveAs(Server.MapPath("~/images/UserImages/" + fuProfile.FileName));
        PS.Image = fuProfile.FileName;
        PS.CreateDate = Convert.ToDateTime(DateTime.Now);

        const string alphabet = "abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random((DateTime.Now.Millisecond));
        string result = rnd.Next(10000, 99999).ToString();
        string alphaChar = alphabet.Substring(rnd.Next(0, alphabet.Length - 1), 1);
        // random position to put the alpha character
        int replacementIndex = rnd.Next(0, (result.Length - 1));
        String Code = result.Remove(replacementIndex, 1).Insert(replacementIndex, alphaChar);

        PS.VerCode = Code.ToString();

        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Greeting}", "Welcome, " + txtUname.Text);
        body = body.Replace("{Title}", "Registration");
        body = body.Replace("{Description}", "Your Verification Code Is : " + Code.ToString());

        string rs = DS.sendMail(txtEmailID.Text, "Registration", body);

        if (rs == "1")
        {
            DS.UserInsert(PS);
        }

        Response.Redirect("Login.aspx");
    }
    #endregion
}