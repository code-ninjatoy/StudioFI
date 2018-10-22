using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Pservice
{
    public Pservice()
    {

    }

    #region Admin
    public int Ad_id { get; set; }
    public string Fullname { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string EmailID { get; set; }
    public DateTime DOB { get; set; }
    public string Address { get; set; }
    public double Phone { get; set; }
    public string Image { get; set; }
    #endregion

    #region Category
    public int CatId { get; set; }
    public string CatName { get; set; }
    public double CatPrice { get; set; }
    #endregion

    #region SubCategory
    public int SubCatID { get; set; }
    public string SubCatName { get; set; }
    #endregion

    #region Portfolio
    public int Pf_id { get; set; }
    public string Pf_name { get; set; }
    public string FilePath { get; set; }
    public DateTime Up_Date { get; set; }
    #endregion

    #region UserMaster
    public int UserID { get; set; }
    public string Addr { get; set; }
    public string ProfilePic { get; set; }
    //public string PassWord { get; set; }
    public string Gender { get; set; }
    public DateTime CreateDate { get; set; }
    public string VerCode { get; set; }
    public string Status { get; set; }
    #endregion

    #region Blog Manage
    public int BlogID { get; set; }
    public String BlogTitle { get; set; }
    public String BlogImage { get; set; }
    public String BlogDesc { get; set; }
    #endregion

    #region Comment
    public int CommentID { get; set; }
    public string CommenetDesc { get; set; }
    #endregion

    #region Feedback
    public int FID { get; set; }
    public string FeedBack { get; set; }
    #endregion

    #region TeamManage
    public int TeamID { get; set; }
    public string TeamName { get; set; }
    public string PersonWork { get; set; }
    public string PersonImg { get; set; }
    public string PersonDesc { get; set; }
    #endregion

    #region CoverImg
    public int CoverID { get; set; }
    public string CoverImg { get; set; }
    public string CoverDesc { get; set; }
    public string CaptureName { get; set; }
    #endregion

    #region Reference
    public int RefID { get; set; }
    public string RefName { get; set; }
    public string RefEmail { get; set; }
    #endregion

    #region Booking
    public int BookID { get; set; }
    public string BookDesc { get; set; }
    public DateTime BookDate { get; set; }
    public string BookStatus { get; set; }
    public string IsAppove { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime StopDate { get; set; }
    #endregion

    #region FAQ
    public int FId { get; set; }
    public string Question { get; set; }
    public string Answer { get; set; }
    #endregion

    #region Pricing
    public int PID { get; set; }
    public string DefImage { get; set; }
    public decimal Price { get; set; }
    public string LocationHour { get; set; }
    public string OutfitChange { get; set; }
    public string ImagesCapt { get; set; }
    public string EditedImage { get; set; }
    public string Description { get; set; }
    #endregion

}