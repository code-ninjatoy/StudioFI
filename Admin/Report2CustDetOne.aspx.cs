using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Admin_Report2CustDetOne : System.Web.UI.Page
{
    DataService DS = new DataService();
    Pservice PS = new Pservice();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDrp();
        }
    }
    #region BindDRP
    public void BindDrp()
    {
        ds = DS.SelectRegisterUser();
        drpCust.DataSource = ds;
        drpCust.DataTextField = "UserName";
        drpCust.DataValueField = "UserID";
        drpCust.DataBind();
        drpCust.Items.Insert(0, "--- Select Category ---");
    }
    #endregion

    #region GetData
    private DataTable GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["FIDB"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }
    #endregion

    protected void btnRP_Click(object sender, EventArgs e)
    {
        DataRow dr = GetData("SELECT * FROM UserMaster where UserID = " + drpCust.SelectedItem.Value).Rows[0]; ;
        Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
        Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, Color.BLACK);
        using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
        {
            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
            Phrase phrase = null;
            PdfPCell cell = null;
            PdfPTable table = null;
            Color color = null;

            document.Open();

            //Header Table
            table = new PdfPTable(2);
            table.TotalWidth = 500f;
            table.LockedWidth = true;
            table.SetWidths(new float[] { 0.3f, 0.7f });

            //Company Logo
            cell = ImageCell("~/images/Logo/1.png", 30f, PdfPCell.ALIGN_CENTER);
            table.AddCell(cell);

            //Company Name and Address
            phrase = new Phrase();
            phrase.Add(new Chunk("FI Studio\n\n", FontFactory.GetFont("Calibri", 16, Font.BOLD, Color.BLUE)));
            phrase.Add(new Chunk("Ahmedabad", FontFactory.GetFont("Calibri", 8, Font.NORMAL, Color.BLACK)));
            //phrase.Add(new Chunk("Salt Lake Road,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
            //phrase.Add(new Chunk("Seattle, USA", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
            cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
            cell.VerticalAlignment = PdfCell.ALIGN_TOP;
            table.AddCell(cell);

            //Separater Line
            color = new Color(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
            DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
            DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
            document.Add(table);

            table = new PdfPTable(2);
            table.HorizontalAlignment = Element.ALIGN_LEFT;
            table.SetWidths(new float[] { 0.3f, 1f });
            table.SpacingBefore = 20f;

            //Employee Details
            cell = PhraseCell(new Phrase("Custmer Record", FontFactory.GetFont("Calibri", 12, Font.UNDERLINE, Color.BLACK)), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            table.AddCell(cell);
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 30f;
            table.AddCell(cell);

            //Photo
            cell = ImageCell(string.Format("~/images/UserImages/{0}.jpg", dr["UserID"]), 25f, PdfPCell.ALIGN_CENTER);
            table.AddCell(cell);

            //Name
            phrase = new Phrase();
            phrase.Add(new Chunk(dr["UserName"] + "\n", FontFactory.GetFont("Calibri", 10, Font.BOLD, Color.BLACK)));
           // phrase.Add(new Chunk("(" + dr["Title"].ToString() + ")", FontFactory.GetFont("Calibri", 8, Font.BOLD, Color.BLACK)));
            cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
            document.Add(table);

            DrawLine(writer, 160f, 80f, 160f, 690f, Color.BLACK);
            DrawLine(writer, 115f, document.Top - 200f, document.PageSize.Width - 100f, document.Top - 200f, Color.BLACK);

            table = new PdfPTable(2);
            table.SetWidths(new float[] { 0.5f, 2f });
            table.TotalWidth = 340f;
            table.LockedWidth = true;
            table.SpacingBefore = 20f;
            table.HorizontalAlignment = Element.ALIGN_RIGHT;

            ////Employee Id
            //table.AddCell(PhraseCell(new Phrase("Employee code:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            //table.AddCell(PhraseCell(new Phrase("000" + dr["EmployeeId"], FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            //cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            //cell.Colspan = 2;
            //cell.PaddingBottom = 10f;
            //table.AddCell(cell);


            //Address
            table.AddCell(PhraseCell(new Phrase("Address:", FontFactory.GetFont("Calibri", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            phrase = new Phrase(new Chunk(dr["Addr"] + "\n", FontFactory.GetFont("Calibri", 8, Font.NORMAL, Color.BLACK)));
            //phrase.Add(new Chunk(dr["City"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
            //phrase.Add(new Chunk(dr["Region"] + " " + dr["Country"] + " " + dr["PostalCode"], FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
            table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 10f;
            table.AddCell(cell);

            //Date of Birth
            table.AddCell(PhraseCell(new Phrase("Date of Birth:", FontFactory.GetFont("Calibri", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(Convert.ToDateTime(dr["DOB"]).ToString("dd MMMM, yyyy"), FontFactory.GetFont("Calibri", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 10f;
            table.AddCell(cell);

            //Phone
            table.AddCell(PhraseCell(new Phrase("Phone Number:", FontFactory.GetFont("Calibri", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(dr["Phone"] + "\n", FontFactory.GetFont("Calibri", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 10f;
            table.AddCell(cell);

            //Addtional Information
            table.AddCell(PhraseCell(new Phrase("Email ID:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(dr["EmailID"].ToString(), FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_JUSTIFIED));
            document.Add(table);
            document.Close();
            byte[] bytes = memoryStream.ToArray();
            memoryStream.Close();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=Customer.pdf");
            Response.ContentType = "application/pdf";
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
            Response.Close();
        }
    }
    private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, Color color)
    {
        PdfContentByte contentByte = writer.DirectContent;
        contentByte.SetColorStroke(color);
        contentByte.MoveTo(x1, y1);
        contentByte.LineTo(x2, y2);
        contentByte.Stroke();
    }
    private static PdfPCell PhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = Color.WHITE;
        cell.VerticalAlignment = PdfCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 2f;
        cell.PaddingTop = 0f;
        return cell;
    }
    private static PdfPCell ImageCell(string path, float scale, int align)
    {
        iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance((HttpContext.Current.Server.MapPath(path)));
        image.ScalePercent(scale);
        PdfPCell cell = new PdfPCell(image);
        cell.BorderColor = Color.WHITE;
        cell.VerticalAlignment = PdfCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 0f;
        cell.PaddingTop = 0f;
       
        return cell;
    }
}