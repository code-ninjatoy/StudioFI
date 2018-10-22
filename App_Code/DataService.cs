using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;


/// <summary>
/// Summary description for DataService
/// </summary>
public class DataService
{

    public DataService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FIDB"].ConnectionString);
    SqlDataAdapter da;
    DataSet dt;
    SqlCommand cmd;

    #region Admin Methods
    public bool CheckAdminLogin(Pservice P)
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@Password", P.Password);
        cmd.Parameters.AddWithValue("@Mode", "Check");
        bool s;
        con.Open();
        s = Convert.ToBoolean(cmd.ExecuteScalar());
        con.Close();
        return s;
    }

    public DataSet AdminSelectAll()
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet AdminProfile(string UserName)
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", UserName);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void AdminUpdateAbout(Pservice P)
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@Fullname", P.Fullname);
        cmd.Parameters.AddWithValue("@EmailID", P.EmailID);
        cmd.Parameters.AddWithValue("@DOB", P.DOB);
        cmd.Parameters.AddWithValue("@Address", P.Address);
        cmd.Parameters.AddWithValue("@Phone", P.Phone);
        cmd.Parameters.AddWithValue("@Mode", "UpdateProfie");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void AdminUpdatePassword(Pservice P)
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Password", P.Password);
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@Mode", "UpdatePassword");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void AdminUpdateProfilePic(Pservice P)
    {
        cmd = new SqlCommand("AdminMange", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Image", P.Image);
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@Mode", "UpdateProfilePic");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    #endregion

    #region ManageTeam
    public DataSet TeamSelectAll()
    {
        cmd = new SqlCommand("ManageTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectTeam");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet TeamSelectByID(Pservice P)
    {
        cmd = new SqlCommand("ManageTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TeamID", P.TeamID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void TeamInsert(Pservice P)
    {
        cmd = new SqlCommand("ManageTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TeamName", P.TeamName);
        cmd.Parameters.AddWithValue("@PersonWork", P.PersonWork);
        cmd.Parameters.AddWithValue("@PersonImg", P.PersonImg);
        cmd.Parameters.AddWithValue("@PersonDesc", P.PersonDesc);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void TeamUpdate(Pservice P)
    {
        cmd = new SqlCommand("ManageTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TeamName", P.TeamName);
        cmd.Parameters.AddWithValue("@PersonWork", P.PersonWork);
        cmd.Parameters.AddWithValue("@PersonImg", P.PersonImg);
        cmd.Parameters.AddWithValue("@PersonDesc", P.PersonDesc);
        cmd.Parameters.AddWithValue("@TeamID", P.TeamID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void TeamDelete(Pservice P)
    {
        cmd = new SqlCommand("ManageTeam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@TeamID", P.TeamID);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    #endregion

    #region ManageCoverimg
    public DataSet CoverSelectAll()
    {
        cmd = new SqlCommand("ManageCoverimg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet CoverSelectByID(Pservice P)
    {
        cmd = new SqlCommand("ManageCoverimg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        cmd.Parameters.AddWithValue("@CoverID", P.CoverID);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void CoverInsert(Pservice P)
    {
        cmd = new SqlCommand("ManageCoverimg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CoverImg", P.CoverImg);
        cmd.Parameters.AddWithValue("@CoverDesc", P.CoverDesc);
        cmd.Parameters.AddWithValue("@TeamID", P.TeamID);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void CoverUpdate(Pservice P)
    {
        cmd = new SqlCommand("ManageCoverimg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CoverImg", P.CoverImg);
        cmd.Parameters.AddWithValue("@CoverDesc", P.CoverDesc);
        cmd.Parameters.AddWithValue("@TeamID", P.TeamID);
        cmd.Parameters.AddWithValue("@CoverID", P.CoverID);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void CoverDelete(Pservice P)
    {
        cmd = new SqlCommand("ManageCoverimg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CoverID", P.CoverID);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Category Methods
    public DataSet CategorySelectAll()
    {
        cmd = new SqlCommand("Category", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CategorySelectByID(Pservice P)
    {
        cmd = new SqlCommand("Category", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void CategoryInsert(Pservice P)
    {
        cmd = new SqlCommand("Category", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatName", P.CatName);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void CategoryUpdate(Pservice P)
    {
        cmd = new SqlCommand("Category", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatName", P.CatName);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void CategoryDelete(Pservice P)
    {
        cmd = new SqlCommand("Category", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Booking Methods
    public DataSet BookingSelectAll()
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookingSelectByID(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BookID", P.BookID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookingSelectByCatID(int CatID)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", CatID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByCatID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void BookingInsert(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@BookDesc", P.BookDesc);
        cmd.Parameters.AddWithValue("@BookDate", P.BookDate);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BookingUpdate(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@BookDesc", P.BookDesc);
        cmd.Parameters.AddWithValue("@BookDate", P.BookDate);
        cmd.Parameters.AddWithValue("@BookID", P.BookID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BookingDelete(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BookID", P.BookID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet BookCount(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "CountBooking");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookingByUser(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("UserID",P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "BookingByUser");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookingAllDet()
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "BookingAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookingAllDetBYID(int i)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BookID",i);
        cmd.Parameters.AddWithValue("@Mode", "BookingByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BookCountAll()
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountBookingA");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void BookingUpSt(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BookStatus", "F");
        cmd.Parameters.AddWithValue("@BookID", P.BookID);
        cmd.Parameters.AddWithValue("@Mode", "UpdateStatus");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BookingUpMail(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MailSent", "Y");
        cmd.Parameters.AddWithValue("@BookID", P.BookID);
        cmd.Parameters.AddWithValue("@Mode", "UpdateMail");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region SubCategory Methods
    public DataSet SubCategorySelectAll()
    {
        cmd = new SqlCommand("SubCategoryManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet SubCategorySelectByID(Pservice P)
    {
        cmd = new SqlCommand("SubCategoryManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void SubCategoryInsert(Pservice P)
    {
        cmd = new SqlCommand("SubCategoryManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SubCatName", P.SubCatName);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void SubCategoryUpdate(Pservice P)
    {
        cmd = new SqlCommand("SubCategoryManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SubCatName", P.SubCatName);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void SubCategoryDelete(Pservice P)
    {
        cmd = new SqlCommand("SubCategoryManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Portfolio Methods
    public DataSet PortfolioSelectAll()
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet PortfolioSelectByCategory(Pservice P)
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectByCategory");
        cmd.Parameters.AddWithValue("@CatName", P.CatName);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet PortfolioSelectByID(Pservice P)
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        cmd.Parameters.AddWithValue("@PFID", P.Pf_id);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void PortfolioInsert(Pservice P)
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PFName", P.Pf_name);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Image", P.FilePath);
        cmd.Parameters.AddWithValue("@UploadDate", P.Up_Date);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void PortfolioUpdate(Pservice P)
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PFName", P.Pf_name);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@Image", P.FilePath);
        cmd.Parameters.AddWithValue("@PFID", P.Pf_id);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void PortfolioDelete(Pservice P)
    {
        cmd = new SqlCommand("Portfolio", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PFID", P.Pf_id);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Register User
    public DataSet SelectRegisterUser()
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void UserInsert(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@EmailID", P.EmailID);
        cmd.Parameters.AddWithValue("@Addr", P.Addr);
        cmd.Parameters.AddWithValue("@Phone", P.Phone);
        cmd.Parameters.AddWithValue("@ProfilePic", P.Image);
        cmd.Parameters.AddWithValue("@Password", P.Password);
        cmd.Parameters.AddWithValue("@DOB", P.DOB);
        cmd.Parameters.AddWithValue("@Gender", P.Gender);
        cmd.Parameters.AddWithValue("@CreateDate", P.CreateDate);
        cmd.Parameters.AddWithValue("@VerCode", P.VerCode);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void UserUpdate(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        cmd.Parameters.AddWithValue("@EmailID", P.EmailID);
        cmd.Parameters.AddWithValue("@Addr", P.Addr);
        cmd.Parameters.AddWithValue("@Phone", P.Phone);
        cmd.Parameters.AddWithValue("@ProfilePic", P.ProfilePic);
        cmd.Parameters.AddWithValue("@DOB", P.DOB);
        cmd.Parameters.AddWithValue("@Gender", P.Gender);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void UserUpdatePassword(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Password", P.Password);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "UpdatePassword");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet LoginUser(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Login");
        cmd.Parameters.AddWithValue("@EmailID", P.EmailID);
        cmd.Parameters.AddWithValue("@Password", P.Password);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void UserVerify(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@VerCode", P.VerCode);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "Verification");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet ForgotPasswordUser(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectByEmailID");
        cmd.Parameters.AddWithValue("@EmailID", P.EmailID);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet RegUserSelectByID(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet UserInfo(string UserName)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", UserName);
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void DeactivateUser(Pservice P)
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Password", P.Password);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "Deactivate");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet CountAllUser()
    {
        cmd = new SqlCommand("RegisterUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountUserA");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    #endregion

    #region Refernce User
    public DataSet SelectRefUser()
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet SelectRefUserByID(Pservice P)
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "SelectByUser");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void ReferInsert(Pservice P)
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@RefName", P.RefName);
        cmd.Parameters.AddWithValue("@RefEmail", P.RefEmail);
        cmd.Parameters.AddWithValue("@RefDate", P.CreateDate);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet ReferSelectUser(Pservice P)
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectUser");
        cmd.Parameters.AddWithValue("@UserName", P.UserName);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CountRef(Pservice P)
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "CountRefer");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CountRefAll()
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountReferAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    #endregion

    #region Blog Methods
    public DataSet BlogSelectAll()
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet BlogSelectAllAdmin()
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAllAdmin");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    
    public DataSet BlogSelectByID(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@Mode", "SelectById");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BlogSelectByUser(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "UserBlog");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void BlogInsert(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@BlogTitle", P.BlogTitle);
        cmd.Parameters.AddWithValue("@BlogImage", P.BlogImage);
        cmd.Parameters.AddWithValue("@BlogDesc", P.BlogDesc);
        cmd.Parameters.AddWithValue("@CreateDate", P.CreateDate);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BlogUpdateApp(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@IsApprove", P.IsAppove);
        cmd.Parameters.AddWithValue("@Mode", "UpdateStatus");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BlogUpdate(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@BlogTitle", P.BlogTitle);
        cmd.Parameters.AddWithValue("@BlogImage", P.BlogImage);
        cmd.Parameters.AddWithValue("@BlogDesc", P.BlogDesc);
        cmd.Parameters.AddWithValue("@CreateDate", P.CreateDate);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BlogDelete(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet CountBlogByUser(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "CountBlog");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CountBlogAll()
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountBlogAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BlogSelectStatus(Pservice P)
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID",P.BlogID );
        cmd.Parameters.AddWithValue("@Mode", "selectstatus");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    #endregion

    #region Comment Methods
    public DataSet CommentSelectAll()
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CommentSelectByID(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@Mode", "SelectById");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void CommentInsert(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@CommenetDesc", P.CommenetDesc);
        cmd.Parameters.AddWithValue("@CreateDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet CommentCountByUser(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "CountComment");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    
    public DataSet CommentCountAll(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@Mode", "CountByID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CommentSelectAllAdmin()
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAllAdmin");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet CommentSelectStatus(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CommentID", P.CommentID);
        cmd.Parameters.AddWithValue("@Mode", "selectstatus");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void CommentUpdateApp(Pservice P)
    {
        cmd = new SqlCommand("CommentView", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CommentID", P.CommentID);
        cmd.Parameters.AddWithValue("@IsApprove", P.IsAppove);
        cmd.Parameters.AddWithValue("@Mode", "UpdateStatus");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Like Methods
    public DataSet LikeCountAll(Pservice P)
    {
        cmd = new SqlCommand("BlogLikes", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@Mode", "CountAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void LikeInsert(Pservice P)
    {
        cmd = new SqlCommand("BlogLikes", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@BlogID", P.BlogID);
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet LikeCount(Pservice P)
    {
        cmd = new SqlCommand("BlogLikes", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserID", P.UserID);
        cmd.Parameters.AddWithValue("@Mode", "LikeCount");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    #endregion

    #region Feedback User
    public DataSet SelectFeedbackUser()
    {
        cmd = new SqlCommand("FeedbackUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void FeedBackInsert(Pservice P)
    {
        cmd = new SqlCommand("FeedbackUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FUserName", P.UserName);
        cmd.Parameters.AddWithValue("@FEmailID", P.EmailID);
        cmd.Parameters.AddWithValue("@FeedbackDate", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@FeedBack", P.FeedBack);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Send Mail
    public string sendMail(string toid, string sub, string body)
    {
        string result = "";
        try
        {
            MailMessage msg = new MailMessage("charmimargi@gmail.com", toid, sub, body);
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            msg.IsBodyHtml = true;
            smtp.Credentials = new System.Net.NetworkCredential("charmimargi@gmail.com", "charumony@1911");
            smtp.Send(msg);
            result = "1";
        }
        catch (Exception)
        {
            result = "-1";
        }
        return result;
    }
    #endregion

    #region FAQ
    public DataSet FAQSelectAll()
    {
        cmd = new SqlCommand("ManageFAQ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "Select");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet FAQSelectByID(Pservice P)
    {
        cmd = new SqlCommand("ManageFAQ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FId", P.FId);
        cmd.Parameters.AddWithValue("@Mode", "SelectbyID");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public void FAQInsert(Pservice P)
    {
        cmd = new SqlCommand("ManageFAQ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Question", P.Question);
        cmd.Parameters.AddWithValue("@Answer", P.Answer);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void FAQUpdate(Pservice P)
    {
        cmd = new SqlCommand("ManageFAQ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Question", P.Question);
        cmd.Parameters.AddWithValue("@Answer", P.Answer);
        cmd.Parameters.AddWithValue("@FId", P.FId);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void FAQDelete(Pservice P)
    {
        cmd = new SqlCommand("ManageFAQ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@FId", P.FId);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Pricing Methods
    public DataSet PricingSelectAll()
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectAll");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet PricingSelectByCategory(int i)
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectbyCat");
        cmd.Parameters.AddWithValue("@CatID", i);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public DataSet PricingSelectByID(Pservice P)
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "SelectByID");
        cmd.Parameters.AddWithValue("@PID", P.PID);
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }
    public void PricingInsert(Pservice P)
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@DefImage", P.DefImage);
        cmd.Parameters.AddWithValue("@Price", P.Price);
        cmd.Parameters.AddWithValue("@LocationHour", P.LocationHour);
        cmd.Parameters.AddWithValue("@OutfitChange", P.OutfitChange);
        cmd.Parameters.AddWithValue("@ImagesCapt", P.ImagesCapt);
        cmd.Parameters.AddWithValue("@EditedImage", P.EditedImage);
        cmd.Parameters.AddWithValue("@Description", P.Description);
        cmd.Parameters.AddWithValue("@Mode", "Insert");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void PricingUpdate(Pservice P)
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CatID", P.CatId);
        cmd.Parameters.AddWithValue("@SubCatID", P.SubCatID);
        cmd.Parameters.AddWithValue("@DefImage", P.DefImage);
        cmd.Parameters.AddWithValue("@Price", P.Price);
        cmd.Parameters.AddWithValue("@LocationHour", P.LocationHour);
        cmd.Parameters.AddWithValue("@OutfitChange", P.OutfitChange);
        cmd.Parameters.AddWithValue("@ImagesCapt", P.ImagesCapt);
        cmd.Parameters.AddWithValue("@EditedImage", P.EditedImage);
        cmd.Parameters.AddWithValue("@Description", P.Description);
        cmd.Parameters.AddWithValue("@PID", P.PID);
        cmd.Parameters.AddWithValue("@Mode", "Update");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void PricingDelete(Pservice P)
    {
        cmd = new SqlCommand("ManagePricing", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@PID", P.PID);
        cmd.Parameters.AddWithValue("@Mode", "Delete");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    #endregion

    #region Report

    public DataSet BookingSelectByDate(Pservice P)
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StartDate", P.StartDate);
        cmd.Parameters.AddWithValue("@StopDate", P.StopDate);
        cmd.Parameters.AddWithValue("@Mode", "BookingByDate");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet BlogCountCat()
    {
        cmd = new SqlCommand("BlogManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountCat");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet RefUserCount()
    {
        cmd = new SqlCommand("RefUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "CountRefUser");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    public DataSet pendingevent()
    {
        cmd = new SqlCommand("BookingManage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Mode", "PendingBook");
        da = new SqlDataAdapter(cmd);
        dt = new DataSet();
        da.Fill(dt);
        return dt;
    }

    #endregion
}