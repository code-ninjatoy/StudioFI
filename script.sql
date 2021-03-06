USE [FIDB]
GO
/****** Object:  StoredProcedure [dbo].[AdminMange]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdminMange]
	@AdminID int = null,
	@Fullname varchar(50) = null,
	@UserName varchar(50)= null,
	@EmailID varchar(50)= null,
	@DOB date= null,
	@Address varchar(max)= null,
	@Phone numeric(18,0)= null,
	@Image varchar(max)= null,
	@Password varchar(50)= null,
	@Mode varchar(50) = null
AS
BEGIN

	IF @Mode = 'Check'
	BEGIN
		select count(*) from AdminMaster where UserName=@UserName and Password=@Password
	END

	IF @Mode = 'SelectAll'
	BEGIN
		select * from AdminMaster
	END
   
	IF @Mode = 'SelectByID'
	BEGIN
		Select *, Convert(varchar(15),D.DOB,105) as AdminDate from AdminMaster as D
		Where UserName=@UserName
	END

	IF @Mode = 'UpdateProfie'
	BEGIN
		update AdminMaster set Fullname=@Fullname,UserName=@UserName,EmailID=@EmailID,DOB=@DOB,Address=@Address,Phone=@Phone where UserName=@UserName
	END

	IF @Mode = 'UpdatePassword'
	BEGIN
		update AdminMaster set Password=@Password where  UserName=@UserName
	END

	IF @Mode = 'UpdateProfilePic'
	BEGIN
		update AdminMaster set Image=@Image  where  UserName=@UserName
	END
END




GO
/****** Object:  StoredProcedure [dbo].[BlogLikes]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BlogLikes]
	@LikeID int = null,
	@BlogID int = null,
	@UserID int = null,
	@Mode varchar(20) = null
AS
begin

	if @Mode = 'CountAll'
	begin
		select COUNT(*) as cl from BlogLike as c where c.BlogID=@BlogID
	end
	
	if @Mode = 'Insert'
	begin
		insert into BlogLike values (@BlogID,@UserID)
	end

	if @Mode='LikeCount'
	begin
		select COUNT(*) as co from BlogLike as b
		inner join UserMaster as u on u.UserID=b.UserID
		where b.UserID=@UserID
	end

end

GO
/****** Object:  StoredProcedure [dbo].[BlogManage]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BlogManage]
	@BlogID int = null,
	@UserID int = null,
	@CatID int = null,
	@BlogTitle varchar(50) = null,
	@BlogImage varchar(MAX) = null,
	@BlogDesc varchar(MAX) = null,
	@CreateDate datetime = null,
	@IsApprove varchar(1) = null,
	@Mode varchar(50) = null

AS
BEGIN
	
	if @Mode = 'SelectAll'
	Begin
		Select *, Convert(varchar(15), b.CreateDate,105) as dt from Blog as b
		inner join UserMaster as um on b.UserID = um.UserID
		inner join CategoryMaster as c on c.CatID = b.CatID
		where IsApprove = 'Y'
		order by BlogID desc
	End

	if @Mode = 'selectstatus'
	begin
		select b.IsApprove from Blog as b
		where b.BlogID=@BlogID
	end

	if @Mode = 'SelectById'
	Begin
		Select *, Convert(varchar(15), b.CreateDate,105) as dt from Blog as b
		inner join UserMaster as um
		on b.UserID = um.UserID
		inner join CategoryMaster as cm
		on b.CatID = cm.CatID
		where b.BlogID = @BlogID AND IsApprove = 'Y'
	End

	if @Mode = 'Insert'
	Begin
		Insert into Blog(CatID,UserID,BlogTitle,BlogImage,BlogDesc,CreateDate,IsApprove)
		values(@CatID,@UserID,@BlogTitle,@BlogImage,@BlogDesc,@CreateDate,'Y')
	End

	if @Mode = 'Update'
	Begin
		Update Blog set CatID = @CatID, UserID = @UserID, BlogTitle = @BlogTitle, BlogImage = @BlogImage, BlogDesc = @BlogDesc
		Where BlogID = @BlogID
	End

	if @Mode = 'UpdateStatus'
	Begin
		Update Blog set IsApprove=@IsApprove
		Where BlogID = @BlogID
	End

	if @Mode = 'Delete'
	Begin
		Delete from Blog Where BlogID = @BlogID
	End

	if @Mode = 'UserBlog'
	Begin
		Select * from Blog as b
		inner join UserMaster as um
		on b.UserID = um.UserID
		inner join CategoryMaster as cm
		on b.CatID = cm.CatID
		Where b.UserID = @UserID AND IsApprove = 'Y'
	End

	if @Mode='CountBlogAll'
	begin
		select COUNT(*) as co from Blog
	end

	if @Mode='CountBlog'
	begin
		select COUNT(*) as co from Blog as b
		inner join UserMaster as u on u.UserID=b.UserID
		where b.UserID=@UserID
	end
	
	if @Mode = 'SelectAllAdmin'
	Begin
		Select *, Convert(varchar(15), b.CreateDate,105) as dt from Blog as b
		inner join UserMaster as um on b.UserID = um.UserID
		inner join CategoryMaster as c on c.CatID = b.CatID
		order by BlogID desc
	End

	if @Mode = 'CountCat'
	Begin
		SELECT COUNT(Blog.BlogID) AS co, CategoryMaster.CatName FROM Blog INNER JOIN
        CategoryMaster ON Blog.CatID = CategoryMaster.CatID GROUP BY CategoryMaster.CatName
	End

END



GO
/****** Object:  StoredProcedure [dbo].[BookingManage]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookingManage]
	@BookID int = null,
	@UserID int = null,
	@CatID int = null,
	@SubCatID int = null,
	@BookDesc varchar(MAX) = null,
	@BookDate date = null,
	@BookStatus varchar(1) = null,
	@MailSent varchar(10) = null,
	@Mode varchar(20) = null,
	@StartDate date = null,
	@StopDate date = null
AS
BEGIN
	IF @Mode = 'Select'
	BEGIN
		Select * from Booking
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select * from Booking Where BookID = @BookID
	END

	IF @Mode = 'SelectByCatID'
	BEGIN
		select * from SubCategory where CatID=@CatID
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into Booking values (@UserID,@CatID,@SubCatID,@BookDesc,@BookDate,'P','N')
	END

	IF @Mode = 'Update'
	BEGIN
		Update Booking set CatID=@CatID,SubCatID=@SubCatID,BookDesc=@BookDesc,
		BookDate=@BookDate Where BookID = @BookID
	END 

	if @Mode = 'UpdateStatus'
	begin
		update Booking set BookStatus=@BookStatus where BookID=@BookID
	end

	if @Mode = 'UpdateMail'
	begin
		update Booking set MailSent=@MailSent where BookID=@BookID
	end

	if @Mode='BookingAll'
	begin
		select *, Convert(varchar(15),b.BookDate,105) as bd from Booking as b 
		inner join CategoryMaster as c on c.CatID = b.CatID
		inner join SubCategory as c1 on c1.SubCatID = b.SubCatID
		inner join UserMaster as u on u.UserID = b.UserID
	end

	if @Mode='BookingByID'
	begin
		select *, Convert(varchar(15),b.BookDate,105) as bd from Booking as b 
		inner join CategoryMaster as c on c.CatID = b.CatID
		inner join SubCategory as c1 on c1.SubCatID = b.SubCatID
		inner join UserMaster as u on u.UserID = b.UserID
		where b.BookID=@BookID
	end

	if @Mode='BookingByDate'
	begin
		select *, Convert(varchar(15),b.BookDate,105) as bd from Booking as b 
		inner join CategoryMaster as c on c.CatID = b.CatID
		inner join SubCategory as c1 on c1.SubCatID = b.SubCatID
		inner join UserMaster as u on u.UserID = b.UserID
		where b.BookDate >= @StartDate AND b.BookDate <= @StopDate
	end

	if @Mode='BookingByUser'
	begin
		select *, Convert(varchar(15),b.BookDate,105) as bd from Booking as b 
		inner join CategoryMaster as c on c.CatID = b.CatID
		inner join SubCategory as c1 on c1.SubCatID = b.SubCatID
		inner join UserMaster as u on u.UserID = b.UserID
		where u.UserID = @UserID
	end

	IF @Mode = 'CountBookingA'
	Begin
		select COUNT(*) as co from Booking
	End

	if @Mode='CountBooking'
	begin
		select COUNT(*) as co from Booking as b
		inner join UserMaster as u on u.UserID=b.UserID
		where b.UserID=@UserID
	end

	if @Mode='PendingBook'
	begin
		select *, Convert(varchar(15),b.BookDate,105) as bd from Booking as b
		inner join UserMaster as u on u.UserID=b.UserID
		inner join SubCategory as s on s.SubCatID= b.SubCatID
		inner  join CategoryMaster as c on c.CatID = b.CatID
		where b.BookStatus = 'P'
	end

END

GO
/****** Object:  StoredProcedure [dbo].[Category]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category]
	@CatName varchar(50) = null,
	@CatID int = null,
	@Mode varchar(50) = null
AS
BEGIN
	
	IF @Mode = 'Select'
	BEGIN
		Select * from CategoryMaster
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select * from CategoryMaster Where CatID = @CatID
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into CategoryMaster(CatName)
		values (@CatName)
	END

	IF @Mode = 'Update'
	BEGIN
		Update CategoryMaster set CatName = @CatName Where CatID = @CatID
	END

	IF @Mode = 'Delete'
	BEGIN
		delete from CategoryMaster Where CatID = @CatID
	END

END





GO
/****** Object:  StoredProcedure [dbo].[CommentView]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CommentView]
	@CommentID int = null,
	@BlogID int = null,
	@UserID int = null,
	@CommenetDesc varchar(MAX) = null,
	@CreateDate date = null,
	@IsApprove varchar(1) = null,
	@Mode varchar(50) = null
AS
BEGIN
	
	if @Mode = 'SelectAll'
	Begin
		select *, Convert(varchar(15), BlogComment.CreateDate,105) as dt FROM BlogComment
		INNER JOIN
        UserMaster ON UserMaster.UserID = BlogComment.UserID
		INNER JOIN
        Blog ON Blog.BlogID = BlogComment.BlogID
		AND BlogComment.IsApprove = 'Y'
	End

	if @Mode = 'SelectAllAdmin'
	Begin
		select *, Convert(varchar(15), BlogComment.CreateDate,105) as dt FROM BlogComment
		INNER JOIN
        UserMaster ON UserMaster.UserID = BlogComment.UserID
		INNER JOIN
        Blog ON Blog.BlogID = BlogComment.BlogID
	End

	if @Mode = 'SelectById'
	Begin
		select *, Convert(varchar(15), BlogComment.CreateDate,105) as dt
		 FROM BlogComment   INNER JOIN
                      UserMaster ON UserMaster.UserID = BlogComment.UserID
					  INNER JOIN
                      Blog ON Blog.BlogID = BlogComment.BlogID
					  where Blog.BlogID = @BlogID
					  AND BlogComment.IsApprove = 'Y'
	End

	if @Mode = 'Insert'
	Begin
		Insert into BlogComment(BlogID,UserID,CommnetDesc,CreateDate,IsApprove)
		values(@BlogID,@UserID,@CommenetDesc,@CreateDate,'Y')
	End

	if @Mode = 'CountByID'
	begin
		select COUNT(*) as co from BlogComment as c where c.BlogID=@BlogID
	end

	if @Mode='CountComment'
	begin
		select COUNT(*) as co from BlogComment as b
		inner join UserMaster as u on u.UserID=b.UserID
		where b.UserID=@UserID
	end

	if @Mode = 'selectstatus'
	begin
		select b.IsApprove from BlogComment as b
		where b.CommnetID=@CommentID
	end

	if @Mode = 'UpdateStatus'
	Begin
		Update BlogComment set IsApprove=@IsApprove
		Where CommnetID=@CommentID
	End

END



GO
/****** Object:  StoredProcedure [dbo].[FeedbackUser]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FeedbackUser]
	@FBID int = null,
	@FUserName varchar(50) = null,
	@FEmailID varchar(50) = null,
	@FeedbackDate date = null,
	@FeedBack varchar(max) = null,
	@Mode varchar(20) = null

	
AS
BEGIN
	IF @Mode = 'Select'
	BEGIN
		Select *,Convert(varchar(15),fbt.FeedbackDate,105) as FeedDate from FeedBack as fbt  
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into FeedBack values(@FUserName,@FEmailID,@FeedbackDate,@FeedBack)
	END

END





GO
/****** Object:  StoredProcedure [dbo].[ManageCoverimg]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManageCoverimg]
	@CoverID int =null,
	@CoverImg varchar(max) = null,
	@CoverDesc varchar(50) = null,
	@TeamID int = null,
	@TeamName varchar(50) = null,
	@Mode varchar(50) = null
	
AS
BEGIN
	IF @Mode = 'Select'
	BEGIN
		Select * from CoverImage  as ci
		inner join OurTeam as ot
		on ci.TeamID = ot.TeamID
	END

	
	IF @Mode = 'SelectByID'
	BEGIN
		select * from CoverImage where CoverID=@CoverID
	END

	IF @Mode = 'Insert'
	BEGIN
	insert into CoverImage values(@CoverImg,@CoverDesc,@TeamID)
	END

	IF @Mode = 'Update'
	BEGIN
		update CoverImage set CoverImg=@CoverImg,CoverDesc=@CoverDesc,TeamID=@TeamID where CoverID=@CoverID
	END

	IF @Mode = 'Delete'
	BEGIN
		delete from CoverImage Where CoverID=@CoverID
	END

END





GO
/****** Object:  StoredProcedure [dbo].[ManageFAQ]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManageFAQ]
	@FId int = null,
	@Question varchar(MAX) = null,
	@Answer varchar(MAX) = null,
	@Mode varchar(20) = null
AS
begin
	if @Mode='Select'
	begin
		select * from FAQ
	end

	if @Mode = 'SelectbyID'
	begin
		select * from FAQ where FId=@FId
	end

	if @Mode = 'Insert'
	begin
		insert into FAQ values (@Question,@Answer)
	end

	if @Mode = 'Update'
	begin
		update FAQ set Question=@Question, Answer=@Answer where FId=@FId
	end

	if @Mode = 'Delete'
	begin
		delete from FAQ where FId=@FId
	end
End



GO
/****** Object:  StoredProcedure [dbo].[ManagePricing]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManagePricing]
	@PID int = null,
	@CatID int = null,
	@SubCatID int = null,
	@DefImage varchar(MAX) = null,
	@Price numeric(18) = null,
	@LocationHour VARCHAR(50) = null,
	@OutfitChange VARCHAR(50) = null,
	@ImagesCapt VARCHAR(50) = null,
	@EditedImage VARCHAR(50) = null,
	@Description varchar(MAX) = null,
	@Mode varchar(20) = null

AS
begin

	if @Mode = 'SelectbyCat'
	begin
		select * from Pricing as p
		inner join CategoryMaster as c on c.CatID = p.CatID
		inner join SubCategory as s on s.SubCatID= p.SubCatID
		where p.CatID=@CatID
	end

	if @Mode = 'SelectbyID'
	begin
		select * from Pricing as p
		inner join CategoryMaster as c on c.CatID = p.CatID
		inner join SubCategory as s on s.SubCatID= p.SubCatID
		where p.PID=@PID
	end

	if @Mode = 'SelectAll'
	begin
		select * from Pricing as p
		inner join CategoryMaster as c on c.CatID = p.CatID
		inner join SubCategory as s on s.SubCatID= p.SubCatID
	end

	if @Mode = 'Insert'
	begin
		insert into Pricing values (@CatID,@SubCatID,@DefImage,@Price,@LocationHour,
		@OutfitChange,@ImagesCapt,@EditedImage,@Description)
	end

	if @Mode = 'Delete'
	begin
		delete from Pricing where PID=@PID
	end

	if @Mode = 'Update'
	begin
		update Pricing set CatID=@CatID, SubCatID=@SubCatID, DefImage=@DefImage,Price=@Price,
		LocationHour=@LocationHour, OutfitChange=@OutfitChange,ImagesCapt=@ImagesCapt,
		EditedImage=@EditedImage, Description=@Description where PID=@PID
	end

end


GO
/****** Object:  StoredProcedure [dbo].[ManageTeam]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManageTeam]
	-- Add the parameters for the stored procedure here
	@TeamID int = null,
	@TeamName varchar(50) = null,
	@PersonWork varchar(50) = null,
	@PersonImg varchar(max) = null,
	@PersonDesc varchar(max) = null,
	@Mode varchar(50) = null
AS
BEGIN
	IF @Mode = 'SelectTeam'
	BEGIN
		select * from  OurTeam
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select * from OurTeam Where TeamID=@TeamID
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into OurTeam values(@TeamName,@PersonWork,@PersonImg,@PersonDesc)
	END

	IF @Mode = 'Update'
	BEGIN
		Update OurTeam set TeamName=@TeamName , PersonWork=@PersonWork,PersonImg=@PersonImg,PersonDesc=@PersonDesc where TeamID=@TeamID
	END

	IF @Mode = 'Delete'
	BEGIN
		delete from OurTeam Where TeamID=@TeamID
	END

END




GO
/****** Object:  StoredProcedure [dbo].[Portfolio]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Portfolio]
	@PFName varchar(50) = null,
	@Image varchar(MAX) = null,
	@PFID int = null,
	@CatID int = null,
	@UploadDate datetime = null,
	@CatName varchar(50) = null,
	@Mode varchar(50) = null
AS
BEGIN
	
	IF @Mode = 'Select'
	BEGIN
		Select *,Convert(varchar(15),pu.UploadDate,105) as PFUploadDate from PFUpload as pu
		inner join CategoryMaster as cm
		on pu.CatID = cm.CatID
	END

	IF @Mode = 'SelectByCategory'
	BEGIN
		Select *,Convert(varchar(15),pu.UploadDate,105) as PFUploadDate from PFUpload as pu
		inner join CategoryMaster as cm
		on pu.CatID = cm.CatID
		Where cm.CatName = @CatName
		order by pu.UploadDate desc
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select * from PFUpload Where PFID = @PFID
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into PFUpload(PFName,CatID,Image,UploadDate)
		values (@PFName,@CatID,@Image,@UploadDate)
	END

	IF @Mode = 'Update'
	BEGIN
		Update PFUpload set PFName = @PFName,CatID = @CatID,[Image] = @Image Where PFID = @PFID
	END

	IF @Mode = 'Delete'
	BEGIN
		delete from PFUpload Where PFID = @PFID
	END

END





GO
/****** Object:  StoredProcedure [dbo].[RefUser]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RefUser]
	@RefID int = null,
	@UserID int = null,
	@UserName varchar(50) = null,
	@RefName varchar(50) = null,
	@RefEmail varchar(50) = null,
	@RefDate varchar(50) = null,
	@Mode varchar(50) = null
AS
BEGIN
	
	IF @Mode = 'Select'
	BEGIN
		Select *,Convert(varchar(15),pu.RefDate,105) as RefDate from Reference as pu  
		inner join UserMaster as um
		on pu.UserID = um.UserID
	END

	IF @Mode = 'SelectByUser'
	BEGIN
		Select *,Convert(varchar(15),pu.RefDate,105) as RefDate from Reference as pu  
		inner join UserMaster as um
		on pu.UserID = um.UserID
		Where pu.UserID = @UserID
	END

	if @Mode = 'Insert'
	Begin
		Insert into Reference values(@UserID,@RefName,@RefEmail,@RefDate)
	End

	if @Mode = 'SelectUser'
	Begin
		Select * from UserMaster Where UserName = @UserName
	End

	if @Mode='CountReferAll'
	begin
		select COUNT(*)  as co from Reference
	end

	if @Mode='CountRefer'
	begin
		select COUNT(*) as co from Reference as b
		inner join UserMaster as u on u.UserID=b.UserID
		where b.UserID=@UserID
	end

	if @Mode='CountRefUser'
	begin
		SELECT TOP (10) COUNT(Reference.RefID) AS co, UserMaster.UserName
		FROM UserMaster INNER JOIN
		Reference ON UserMaster.UserID = Reference.UserID
		GROUP BY UserMaster.UserName
		ORDER BY co DESC
	end
END



GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegisterUser]
	@UserID int = null,
	@UserName varchar(50) = null,
	@EmailID varchar(50) = null,
	@Addr varchar(max) = null,
	@Phone numeric(15,0) = null,
	@ProfilePic varchar(50) = null,
	@Password varchar(50) = null,
	@DOB date = null,
	@Gender varchar(1) = null,
	@CreateDate datetime = null,
	@VerCode varchar(50) = null,
	@Status varchar(1) = null,
	@Mode varchar(20) = null
AS
BEGIN
	
	IF @Mode = 'Select'
	BEGIN
		Select *,Convert(varchar(15),pu.DOB,105) as UserDOBDate from UserMaster as pu  
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select *,Convert(varchar(15),pu.DOB,105) as DOBM from UserMaster as pu  Where UserID = @UserID
	END

	IF @Mode = 'SelectByEmailID'
	BEGIN
		Select * from UserMaster Where EmailID=@EmailID
	END

	IF @Mode = 'Login'
	BEGIN
		Select * from UserMaster Where EmailID = @EmailID and Password = @Password
	END

	IF @Mode = 'Verification'
	BEGIN
		Update UserMaster Set Status = 'A' Where VerCode = @VerCode and UserID = @UserID
	END

	IF @Mode = 'Insert'
	BEGIN
		Insert into UserMaster values(@UserName,@EmailID,@Addr,@Phone,@ProfilePic,@Password,@DOB,@Gender,@CreateDate,@VerCode,'D')
	END

	IF @Mode = 'Update'
	BEGIN
		update UserMaster set UserName=@UserName,EmailID=@EmailID, Addr=@Addr, Phone= @Phone,ProfilePic=@ProfilePic,DOB= @DOB,Gender = @Gender
		 where UserID=@UserID
	END

	IF @Mode = 'UpdatePassword'
	BEGIN
		update UserMaster set Password=@Password
		 where UserID=@UserID
	END

	IF @Mode = 'Deactivate'
	BEGIN
		Update UserMaster Set Status = 'D' Where UserID=@UserID and Password=@Password
	END

	IF @Mode = 'CountUserA'
	BEGIN
		select COUNT(*)  as co from UserMaster
	END

END



GO
/****** Object:  StoredProcedure [dbo].[SubCategoryManage]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SubCategoryManage]
 @SubCatID int = null,
 @SubCatName varchar(50) = null,
 @CatID int = null,
 @Mode varchar(20) = null
	
AS
BEGIN

IF @Mode = 'Select'
	BEGIN
		Select * from  SubCategory as sc
		inner join CategoryMaster as cm
		on sc.CatID = cm.CatID
	END

	IF @Mode = 'SelectByID'
	BEGIN
		Select * from SubCategory Where SubCatID=@SubCatID
	END

	IF @Mode = 'Insert'
	BEGIN
		insert into SubCategory values (@SubCatName,@CatID)
	END

	IF @Mode = 'Update'
	BEGIN
		Update SubCategory set SubCatName=@SubCatName, CatID=@CatID  Where SubCatID=@SubCatID
	END

	IF @Mode = 'Delete'
	BEGIN
		delete from SubCategory Where SubCatID=@SubCatID
	END
	
END





GO
/****** Object:  Table [dbo].[AdminMaster]    Script Date: 28/04/2015 19:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminMaster](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Address] [varchar](max) NULL,
	[Phone] [numeric](18, 0) NULL,
	[Image] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
 CONSTRAINT [PK_AdminMaster] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CatID] [int] NULL,
	[BlogTitle] [varchar](50) NULL,
	[BlogImage] [varchar](max) NULL,
	[BlogDesc] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[IsApprove] [varchar](1) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogComment]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogComment](
	[CommnetID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NULL,
	[UserID] [int] NULL,
	[CommnetDesc] [varchar](max) NULL,
	[CreateDate] [date] NULL,
	[IsApprove] [varchar](1) NULL,
 CONSTRAINT [PK_BlogComment] PRIMARY KEY CLUSTERED 
(
	[CommnetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogLike]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogLike](
	[LikeID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_BlogLike] PRIMARY KEY CLUSTERED 
(
	[LikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CatID] [int] NULL,
	[SubCatID] [int] NULL,
	[BookDesc] [varchar](max) NULL,
	[BookDate] [datetime] NULL,
	[BookStatus] [varchar](1) NULL,
	[MailSent] [varchar](1) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [varchar](50) NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoverImage]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoverImage](
	[CoverID] [int] IDENTITY(1,1) NOT NULL,
	[CoverImg] [varchar](max) NULL,
	[CoverDesc] [varchar](max) NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_CoverImage] PRIMARY KEY CLUSTERED 
(
	[CoverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAQ](
	[FId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NOT NULL,
	[Answer] [varchar](max) NOT NULL,
 CONSTRAINT [PK__FAQ__C1BEAA42EB7D592F] PRIMARY KEY CLUSTERED 
(
	[FId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FBID] [int] IDENTITY(1,1) NOT NULL,
	[FUserName] [varchar](50) NULL,
	[FEmailID] [varchar](50) NULL,
	[FeedbackDate] [date] NULL,
	[FeedBack] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OurTeam]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OurTeam](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](50) NULL,
	[PersonWork] [varchar](50) NULL,
	[PersonImg] [varchar](max) NULL,
	[PersonDesc] [varchar](max) NULL,
 CONSTRAINT [PK_OurTeam] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PFUpload]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PFUpload](
	[PFID] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NULL,
	[PFName] [varchar](50) NULL,
	[Image] [varchar](max) NULL,
	[UploadDate] [datetime] NULL,
 CONSTRAINT [PK_PFUpload_1] PRIMARY KEY CLUSTERED 
(
	[PFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pricing]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pricing](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[DefImage] [varchar](max) NULL,
	[Price] [numeric](18, 0) NULL,
	[LocationHour] [varchar](50) NULL,
	[OutfitChange] [varchar](50) NULL,
	[ImagesCapt] [varchar](50) NULL,
	[EditedImage] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reference]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reference](
	[RefID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RefName] [varchar](50) NULL,
	[RefEmail] [varchar](50) NULL,
	[RefDate] [datetime] NULL,
 CONSTRAINT [PK_Reference] PRIMARY KEY CLUSTERED 
(
	[RefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCatID] [int] IDENTITY(1,1) NOT NULL,
	[SubCatName] [varchar](50) NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 28/04/2015 19:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[Addr] [varchar](max) NULL,
	[Phone] [numeric](15, 0) NULL,
	[ProfilePic] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Gender] [varchar](1) NULL,
	[CreateDate] [datetime] NULL,
	[VerCode] [varchar](50) NULL,
	[Status] [varchar](1) NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminMaster] ON 

INSERT [dbo].[AdminMaster] ([AdminID], [Fullname], [UserName], [EmailID], [DOB], [Address], [Phone], [Image], [Password]) VALUES (1, N'Charmi Margi', N'Admin', N'charmimargi@gmail.com', CAST(0x021C0B00 AS Date), N'Maninagar,
Ahemdabad 380050', CAST(9876543211 AS Numeric(18, 0)), N'charmimargi.jpg', N'1110')
SET IDENTITY_INSERT [dbo].[AdminMaster] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (1, 2, 1, N'Amazing Animated Photography', N'professional-photography-cameras-tumblr.jpg', N'ErAn Croitoru has been working on his Animated-Photography.com for about two years. His project is about silent objects in our daily lives, the things we use and mostly leave in the background. It’s very creative art and his work is …One evening, as I photographed Tel-Aviv city from above, I noticed something interesting. The people, who are usually the main subject in our daily photos, suddenly became irrelevant. As I watched, the city became something like a stage, but instead of people playing parts, the buildings themselves were the stars of the show, but they were stiff and lifeless.
That was the moment I realized I could use my skills as an animator to bring them to life. Using an animation software I helped them bend and touch each other. This is how I imagine buildings would hug if they could. It made me think about all the silent objects in all of our lives, the things we use and leave in the background.', CAST(0x0000A48301622DAC AS DateTime), N'Y')
INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (2, 2, 2, N'Bringing Photos Back to Life	', N'16.png', N'ickstarter is an awesome crowd sourcing site to find new inventions, gear and inspiring work by other photographers. Another pick this month is RetroPacks, for avid users of Instagram.  Founder is Lewis Pratt, a keen, self taught web developer and …Each picture has its own complications. Although I know I can use editing software to fix and change it during post, I prefer doing everything I can during the photographing stage. In my opinion it gives the image a much more real feeling than recomposing elements during post.I never begin a project without having the picture already in mind, preferably as a sketch. I’ll start by preparing the scene. I stabilize the objects using simple materials such as cardboard and superglue. “Flying” objects such as the strawberry in “Food Fight” will generally be held by hand using a toothpick, for example.
', CAST(0x0000A48301626371 AS DateTime), N'Y')
INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (4, 1, 6, N'Location Guide App for Photography', N'say_cheese_camera_smile_photography_canon_hd-wallpaper-1618462.jpg', N'We want to share a guest post by Timothy Poulton, founder of OneOfAKind app. OneOfAKind is a photography location guide app. It’s a game changer for  photographers on how to plan, find and just view locations to shoot. The best …We want to share a guest post by Timothy Poulton, founder of OneOfAKind app. OneOfAKind is a photography location guide app. It’s a game changer for  photographers on how to plan, find and just view locations to shoot. The best part about it, the information is being built upon by  photographers from around the world. Locals know best is their belief.', CAST(0x0000A4830162F3F9 AS DateTime), N'Y')
INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (5, 4, 1, N'Exposing the Beauty in the World Through Photograp', N'professional_photography_apps_hero.jpg', N'For as long as I can remember I have been taking photographs but it has only been in the last two years where it has really taken off for me. I owe a lot of that to Instagram. I joined …Dennis (22) and Patrick Weinert (20) are journalists, filmmakers and photographers from Germany with a background in advertising. After deciding to crowdfund and self-publish their first documentary photography book called “A World in Distress”, they now focus full-time on telling visual stories from around the globe that deal with poverty, human rights, conflict and culture. Their work has been featured on German national television and radio and appeared in numerous print and web publications.', CAST(0x0000A483016393BB AS DateTime), N'Y')
INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (6, 5, 2, N'Valentin Astier: Photographer of Moods, Atmosphere', N'19.jpg', N'We want to share a guest post by a 24 year old French photographer, Valentin Astier. Valentin works as a matte-painter in special effects allows him to give a cinematic sensibility to his photos. He defines himself as a photographer …We all have our favorite places to go and practice the magic, to combine our visions with what lies before us. This is what our heart beats for; the discovery of new places. Locations near and far; a Pandora’s Box of potential… Finally, an app has arrived that brings together the invaluable information and inspiration from the worlds’ best landscape photographers, we are One Of A Kind Photography Adventures and we are proud to announce our new Location Guide App for iPhone.', CAST(0x0000A4830163DA22 AS DateTime), N'Y')
INSERT [dbo].[Blog] ([BlogID], [UserID], [CatID], [BlogTitle], [BlogImage], [BlogDesc], [CreateDate], [IsApprove]) VALUES (20, 8, 3, N'The Ultimate Wedding', N'31.jpg', N'Macy’s has a new “Weddings’ Best Man” and his name is Clinton Kelly.  Yes, that Clinton Kelly; the lifestyle whiz who is about to take your big day to the next level with tips and tricks on everything from bridal showers to honeymoon must-haves to curating the perfect registry.  From your walk down the aisle to newlywed life and beyond, it’s a Macy’s + Clinton Kelly party… and you’re all invited.
', CAST(0x0000A486012D6073 AS DateTime), N'Y')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[BlogComment] ON 

INSERT [dbo].[BlogComment] ([CommnetID], [BlogID], [UserID], [CommnetDesc], [CreateDate], [IsApprove]) VALUES (1, 1, 5, N'Nice One... ', CAST(0xDE390B00 AS Date), N'Y')
INSERT [dbo].[BlogComment] ([CommnetID], [BlogID], [UserID], [CommnetDesc], [CreateDate], [IsApprove]) VALUES (2, 7, 1, N'Nice Photgraphy Dear...! :) ', CAST(0xDE390B00 AS Date), N'Y')
INSERT [dbo].[BlogComment] ([CommnetID], [BlogID], [UserID], [CommnetDesc], [CreateDate], [IsApprove]) VALUES (4, 20, 1, N'Congratulations....!', CAST(0xE1390B00 AS Date), N'Y')
SET IDENTITY_INSERT [dbo].[BlogComment] OFF
SET IDENTITY_INSERT [dbo].[BlogLike] ON 

INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (1, 1, 5)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (2, 7, 1)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (3, 7, 1)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (4, 7, 1)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (5, 18, 1)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (6, 20, 8)
INSERT [dbo].[BlogLike] ([LikeID], [BlogID], [UserID]) VALUES (7, 20, 1)
SET IDENTITY_INSERT [dbo].[BlogLike] OFF
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (1, 1, 1, 5, N'Please Book My Shoot on This day.. ', CAST(0x0000A48600000000 AS DateTime), N'P', N'Y')
INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (2, 1, 3, 12, N'Book Shoot', CAST(0x0000A52100000000 AS DateTime), N'P', N'Y')
INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (3, 2, 4, 15, N'', CAST(0x0000A51700000000 AS DateTime), N'P', N'N')
INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (4, 1, 1, 6, N'Please Request u sir.. Book my shoot Tommorrow. ', CAST(0x0000A48400000000 AS DateTime), N'P', N'N')
INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (6, 8, 3, 11, N'', CAST(0x0000A48900000000 AS DateTime), N'P', N'N')
INSERT [dbo].[Booking] ([BookID], [UserID], [CatID], [SubCatID], [BookDesc], [BookDate], [BookStatus], [MailSent]) VALUES (7, 8, 2, 8, N'', CAST(0x0000A48A00000000 AS DateTime), N'P', N'N')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON 

INSERT [dbo].[CategoryMaster] ([CatID], [CatName]) VALUES (1, N'PERSONAL')
INSERT [dbo].[CategoryMaster] ([CatID], [CatName]) VALUES (2, N'CHILDREN')
INSERT [dbo].[CategoryMaster] ([CatID], [CatName]) VALUES (3, N'WEDDING')
INSERT [dbo].[CategoryMaster] ([CatID], [CatName]) VALUES (4, N'PRE-WEDDING')
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[CoverImage] ON 

INSERT [dbo].[CoverImage] ([CoverID], [CoverImg], [CoverDesc], [TeamID]) VALUES (1, N'423010.jpg', N'Happiness Comes From Heart...', 1)
INSERT [dbo].[CoverImage] ([CoverID], [CoverImg], [CoverDesc], [TeamID]) VALUES (3, N'In-Smiling-Facial-Expression-and-Looking-Attentively-at-the-Screen-the-Girl-is-Both-Pure-and-Beautiful-HD-Attractive-Girls-Wallpaper.jpg', N'What U Wear.. Matters.. ', 2)
INSERT [dbo].[CoverImage] ([CoverID], [CoverImg], [CoverDesc], [TeamID]) VALUES (4, N'professional_photography_apps_hero.jpg', N'Camera Is My Life... ', 3)
INSERT [dbo].[CoverImage] ([CoverID], [CoverImg], [CoverDesc], [TeamID]) VALUES (5, N'Happy-valentines-girls-love-hd-wallpaper.jpg', N'Friendship is First Step of Love... ', 5)
INSERT [dbo].[CoverImage] ([CoverID], [CoverImg], [CoverDesc], [TeamID]) VALUES (6, N'DPR-indian-wedding-11.jpg', N'Wedding Moment.. ', 5)
SET IDENTITY_INSERT [dbo].[CoverImage] OFF
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (3, N'I m Confuse about where i book my Shoot?', N'Select a Beautiful place like garden if you want a family pictures. and if you want personal images like fashion then come to my studio i have enough material for your portfolio.')
INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (4, N'How can i modify my Blog?', N'If you want to modify your blog. then login into your profile and go into blog section. in this blog section you can see all your blog and click on edit button to modify your blog.')
INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (5, N'Is it require to create profile for shoot a book?', N'Yes, It is require to create profile for shoot book. after registration you can book a shoot. you can book your shoot many times after registration.')
INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (6, N'Howmuch you give discount after give reference another customer?', N'It''s depend upon your referenced customer. if they also book a shoot, you can definetly get a valid discount.')
INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (7, N'I am deactivate my account before some time ago, now how can i re-activate my account?', N'If you want to re-activate your account, kindly login on your email ID, after that you get a verification code and enter that code and you can enter into your profile.')
INSERT [dbo].[FAQ] ([FId], [Question], [Answer]) VALUES (8, N'I m forgot my password, How can i recover it?', N'When you go for the login, there is link of forget password. click on that link, and enter your EmailID. after that you get mail on your mail ID of your password.')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FBID], [FUserName], [FEmailID], [FeedbackDate], [FeedBack]) VALUES (1, N'Mona Patel', N'monym1912@gmail.com', CAST(0xDE390B00 AS Date), N'I m Confuse about where i book my Shoot?')
INSERT [dbo].[FeedBack] ([FBID], [FUserName], [FEmailID], [FeedbackDate], [FeedBack]) VALUES (2, N'Margi Patel', N'patel_margi19@yahoo.com', CAST(0xDE390B00 AS Date), N'Is it require to create profile for shoot a book?')
INSERT [dbo].[FeedBack] ([FBID], [FUserName], [FEmailID], [FeedbackDate], [FeedBack]) VALUES (3, N'Charmi Patel', N'patelcharmi48@yahoo.com', CAST(0xDE390B00 AS Date), N'Howmuch you give discount after give reference another customer?')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[OurTeam] ON 

INSERT [dbo].[OurTeam] ([TeamID], [TeamName], [PersonWork], [PersonImg], [PersonDesc]) VALUES (1, N'Bunny Patel', N'Fashion Photographer', N'39712-ranbir-kapoor.jpg', N'In the world of photography, Fashion Photography is one of the most sought after careers since it is one of the most highly paid jobs. Fashion photographers are sought out to create portfolios for budding and experienced models. Fashion Photographers are like the gateway to the glamour world')
INSERT [dbo].[OurTeam] ([TeamID], [TeamName], [PersonWork], [PersonImg], [PersonDesc]) VALUES (2, N'Charmi Patel', N'Event Photographer', N'IMG-20150201-WA0009.jpg', N'Event Photography is similar to portrait photography as the photographer brings out the real beauty of his models through his talent. The best beauty photography happens when there is a right combination of trust, lighting and imaginative skills from both the model and the photographer.')
INSERT [dbo].[OurTeam] ([TeamID], [TeamName], [PersonWork], [PersonImg], [PersonDesc]) VALUES (3, N'Margi Patel', N'Macro Photographer', N'DSC_0323.JPG', N'Those who show us how truly ugly the flies are. Even in dew drops. That’s even more horrible. Brrrr.')
INSERT [dbo].[OurTeam] ([TeamID], [TeamName], [PersonWork], [PersonImg], [PersonDesc]) VALUES (5, N'Jay Patel', N'Weeding Photographer', N'24.jpg', N'In the world of photography, Fashion Photography is one of the most sought after careers since it is one of the most highly paid jobs. Fashion photographers are sought out to create portfolios for budding and experienced models. Fashion Photographers are like the gateway to the glamour world')
SET IDENTITY_INSERT [dbo].[OurTeam] OFF
SET IDENTITY_INSERT [dbo].[PFUpload] ON 

INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (1, 1, N'P1', N'1.jpg', CAST(0x0000A46E0034F05D AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (2, 1, N'P2', N'2.jpg', CAST(0x0000A46E0034FD1B AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (3, 1, N'P3', N'3.jpg', CAST(0x0000A46E00351145 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (4, 1, N'P4', N'4.jpg', CAST(0x0000A46E00352261 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (5, 1, N'P5', N'5.jpg', CAST(0x0000A46E00352EE0 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (6, 1, N'P6', N'6.png', CAST(0x0000A46E00353D22 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (7, 1, N'P7', N'7.png', CAST(0x0000A46E0035479B AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (8, 1, N'P8', N'8.jpg', CAST(0x0000A46E00357389 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (9, 1, N'P9', N'9.jpg', CAST(0x0000A46E003581F3 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (10, 1, N'P10', N'10.jpg', CAST(0x0000A46E00358C14 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (11, 1, N'P11', N'11.jpg', CAST(0x0000A46E00359799 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (12, 1, N'P12', N'12.jpg', CAST(0x0000A46E0035A42A AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (25, 2, N'C1', N'13.jpg', CAST(0x0000A46E0038E22B AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (26, 2, N'C2', N'14.png', CAST(0x0000A46E0038EB13 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (27, 2, N'C3', N'15.jpg', CAST(0x0000A46E0038F501 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (28, 2, N'C4', N'16.png', CAST(0x0000A46E0038FD83 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (29, 2, N'C5', N'17.jpg', CAST(0x0000A46E00390762 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (30, 2, N'C6', N'18.jpg', CAST(0x0000A46E003916CF AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (31, 2, N'C7', N'19.jpg', CAST(0x0000A46E00392672 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (32, 2, N'C8', N'20.jpg', CAST(0x0000A46E00392F57 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (33, 2, N'C9', N'21.png', CAST(0x0000A46E00395833 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (34, 2, N'C10', N'22.jpg', CAST(0x0000A46E003963A3 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (35, 2, N'C11', N'23.jpg', CAST(0x0000A46E00396E08 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (36, 2, N'C12', N'23.png', CAST(0x0000A46E003977C7 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (37, 3, N'W1', N'24.jpg', CAST(0x0000A46E00398A21 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (38, 3, N'W2', N'25.jpg', CAST(0x0000A46E003992AF AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (39, 3, N'W3', N'26.jpg', CAST(0x0000A46E00399B26 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (40, 3, N'W4', N'27.jpg', CAST(0x0000A46E0039A44E AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (41, 3, N'W5', N'28.jpg', CAST(0x0000A46E0039AE9B AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (42, 3, N'W6', N'29.jpg', CAST(0x0000A46E0039BB5A AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (43, 3, N'W7', N'30.jpg', CAST(0x0000A46E0039C738 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (44, 3, N'W8', N'31.jpg', CAST(0x0000A46E0039D2A5 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (45, 3, N'W9', N'32.jpg', CAST(0x0000A46E0039DDDA AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (46, 3, N'W10', N'33.jpg', CAST(0x0000A46E0039E6F4 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (47, 3, N'W11', N'34.jpg', CAST(0x0000A46E0039F1EF AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (48, 3, N'W12', N'35.jpeg', CAST(0x0000A46E0039FA10 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (49, 4, N'R1', N'36.jpg', CAST(0x0000A46E003A2D8E AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (50, 4, N'R2', N'37.jpg', CAST(0x0000A46E003A3877 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (51, 4, N'R3', N'38.png', CAST(0x0000A46E003A43E1 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (52, 4, N'R4', N'39.jpg', CAST(0x0000A46E003A4E11 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (53, 4, N'R5', N'40.jpg', CAST(0x0000A46E003A62C5 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (54, 4, N'R6', N'41.jpg', CAST(0x0000A46E003A6EA9 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (55, 4, N'R7', N'42.png', CAST(0x0000A46E003A851D AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (56, 4, N'R8', N'43.png', CAST(0x0000A46E003A9146 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (57, 4, N'R9', N'44.jpg', CAST(0x0000A46E003A9D27 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (58, 4, N'R10', N'45.jpg', CAST(0x0000A46E003AA8B6 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (59, 4, N'R11', N'46.png', CAST(0x0000A46E003AB4CE AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (60, 4, N'R12', N'47.jpg', CAST(0x0000A46E003ABE32 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (61, 6, N'A1', N'49.png', CAST(0x0000A46E003ADAA8 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (62, 6, N'A2', N'50.png', CAST(0x0000A46E003AE5B3 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (63, 6, N'A3', N'51.png', CAST(0x0000A46E003AEE5F AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (64, 6, N'A4', N'52.JPG', CAST(0x0000A46E003AF624 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (65, 6, N'A5', N'53.jpg', CAST(0x0000A46E003AFF30 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (66, 6, N'A6', N'54.jpg', CAST(0x0000A46E003B084A AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (67, 6, N'A7', N'55.png', CAST(0x0000A46E003B1530 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (68, 6, N'A8', N'56.jpg', CAST(0x0000A46E003C320D AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (69, 6, N'A9', N'57.jpg', CAST(0x0000A46E003C3EF1 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (70, 6, N'A10', N'60.png', CAST(0x0000A46E003C6C11 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (71, 6, N'A11', N'51.png', CAST(0x0000A46E003CEB33 AS DateTime))
INSERT [dbo].[PFUpload] ([PFID], [CatID], [PFName], [Image], [UploadDate]) VALUES (72, 6, N'A12', N'53.jpg', CAST(0x0000A46E003CF42C AS DateTime))
SET IDENTITY_INSERT [dbo].[PFUpload] OFF
SET IDENTITY_INSERT [dbo].[Pricing] ON 

INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (2, 3, 10, N'W1.jpg', CAST(500 AS Numeric(18, 0)), N'1-2 Hours on Location', N'No Outfit Chages', N'100 Images', N'25 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (4, 3, 11, N'W2.jpg', CAST(1000 AS Numeric(18, 0)), N'2-4 Hours on Location', N'2 Outfit Chages', N'100 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (5, 3, 12, N'W3.jpg', CAST(2500 AS Numeric(18, 0)), N'Full Day on Location', N'Unlimitdd Outfit Chages', N'300 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (6, 1, 4, N'P3.jpg', CAST(500 AS Numeric(18, 0)), N'1-2 Hours on Location', N'No Outfit Chages', N'100 Images', N'25 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (7, 1, 5, N'P1.jpg', CAST(1000 AS Numeric(18, 0)), N'2-4 Hours on Location', N'2 Outfit Chages', N'100 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (8, 1, 6, N'P2.jpg', CAST(2500 AS Numeric(18, 0)), N'Full Day on Location', N'Unlimitdd Outfit Chages', N'300 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (9, 2, 7, N'B1.jpg', CAST(500 AS Numeric(18, 0)), N'1-2 Hours on Location', N'No Outfit Chages', N'100 Images', N'25 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (10, 2, 8, N'B2.jpg', CAST(1000 AS Numeric(18, 0)), N'2-4 Hours on Location', N'2 Outfit Chages', N'100 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (11, 2, 9, N'B3.jpg', CAST(2500 AS Numeric(18, 0)), N'Full Day on Location', N'Unlimitdd Outfit Chages', N'300 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (12, 4, 13, N'PR1.jpg', CAST(500 AS Numeric(18, 0)), N'1-2 Hours on Location', N'No Outfit Chages', N'100 Images', N'25 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (13, 4, 14, N'PR2.jpg', CAST(1000 AS Numeric(18, 0)), N'2-4 Hours on Location', N'2 Outfit Chages', N'100 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
INSERT [dbo].[Pricing] ([PID], [CatID], [SubCatID], [DefImage], [Price], [LocationHour], [OutfitChange], [ImagesCapt], [EditedImage], [Description]) VALUES (14, 4, 15, N'PR3.jpg', CAST(2500 AS Numeric(18, 0)), N'Full Day on Location', N'Unlimitdd Outfit Chages', N'300 Images', N'50 Edited Images', N'Lo-Res Images on Facebook')
SET IDENTITY_INSERT [dbo].[Pricing] OFF
SET IDENTITY_INSERT [dbo].[Reference] ON 

INSERT [dbo].[Reference] ([RefID], [UserID], [RefName], [RefEmail], [RefDate]) VALUES (1, 5, N'Rohan Patil', N'patil8704@gmail.com', CAST(0x0000A4830166FA70 AS DateTime))
INSERT [dbo].[Reference] ([RefID], [UserID], [RefName], [RefEmail], [RefDate]) VALUES (2, 2, N'Khushi Patel', N'khushiptel323@gmail.com', CAST(0x0000A4830166FA70 AS DateTime))
INSERT [dbo].[Reference] ([RefID], [UserID], [RefName], [RefEmail], [RefDate]) VALUES (3, 1, N'GirishBhai Patel', N'girishpatel019@gmail.com', CAST(0x0000A483016740C0 AS DateTime))
INSERT [dbo].[Reference] ([RefID], [UserID], [RefName], [RefEmail], [RefDate]) VALUES (4, 1, N'Urvish Jain', N'jainurvish01@yahoo.com', CAST(0x0000A48301709760 AS DateTime))
SET IDENTITY_INSERT [dbo].[Reference] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (4, N'Basic', 1)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (5, N'Advance', 1)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (6, N'Delux', 1)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (7, N'Basic', 2)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (8, N'Advance', 2)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (9, N'Delux', 2)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (10, N'Basic', 3)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (11, N'Advance', 3)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (12, N'Delux', 3)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (13, N'Basic', 4)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (14, N'Advance', 4)
INSERT [dbo].[SubCategory] ([SubCatID], [SubCatName], [CatID]) VALUES (15, N'Delux', 4)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (1, N'Charmi Patel', N'patelcharmi48@gmail.com', N'Ghodasar, 
Ahemdabad 380050', CAST(9924132798 AS Numeric(15, 0)), N'0000.jpg', N'charu1112', CAST(0xD01C0B00 AS Date), N'F', CAST(0x0000A48301254316 AS DateTime), N'46714', N'A')
INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (2, N'Margi Patel', N'patel_margi19@yahoo.com', N'Ghodasar,
Ahemdabad 380050', CAST(9558306560 AS Numeric(15, 0)), N'IMG-20140609-WA0008.jpg', N'mony1912', CAST(0x021C0B00 AS Date), N'F', CAST(0x0000A48301287E6E AS DateTime), N'876o5', N'A')
INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (4, N'Honesty', N'bunny.patel20@yahoo.com', N'C.G Road,
Ahemdabad 380050', CAST(9879876745 AS Numeric(15, 0)), N'39712-ranbir-kapoor.jpg', N'bunny@123', CAST(0x931C0B00 AS Date), N'M', CAST(0x0000A483012A931B AS DateTime), N'747T6', N'A')
INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (5, N'Destiny', N'monym1912@gmail.com', N'Maninagar,
Ahemdabad', CAST(9876554534 AS Numeric(15, 0)), N'2.jpg', N'destiny@123', CAST(0x941C0B00 AS Date), N'M', CAST(0x0000A483012B9EE8 AS DateTime), N'100D0', N'A')
INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (6, N'Deep Vaghela', N'deepvaghela1000@gmail.com', N'B-94 Vandevi Banglows ,
Ghodasar
Ahemdabad 380050', CAST(8488051553 AS Numeric(15, 0)), N'32598_172280999611234_242819851_n (1).jpg', N'deep@123', CAST(0x42220B00 AS Date), N'M', CAST(0x0000A48600F0A633 AS DateTime), N'B7749', N'A')
INSERT [dbo].[UserMaster] ([UserID], [UserName], [EmailID], [Addr], [Phone], [ProfilePic], [Password], [DOB], [Gender], [CreateDate], [VerCode], [Status]) VALUES (8, N'Mony Patel', N'patelmargi19@gmail.com', N'Ghodasar
Ahemdabad 380050', CAST(9876543210 AS Numeric(15, 0)), N'IMG-20140609-WA0012.jpg', N'mony@123', CAST(0x021C0B00 AS Date), N'F', CAST(0x0000A486012A670E AS DateTime), N'96954', N'D')
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_CategoryMaster] FOREIGN KEY([CatID])
REFERENCES [dbo].[CategoryMaster] ([CatID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_CategoryMaster]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_SubCategory] FOREIGN KEY([SubCatID])
REFERENCES [dbo].[SubCategory] ([SubCatID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_SubCategory]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_UserMaster]
GO
ALTER TABLE [dbo].[CoverImage]  WITH CHECK ADD  CONSTRAINT [FK_CoverImage_OurTeam] FOREIGN KEY([TeamID])
REFERENCES [dbo].[OurTeam] ([TeamID])
GO
ALTER TABLE [dbo].[CoverImage] CHECK CONSTRAINT [FK_CoverImage_OurTeam]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_ToTable] FOREIGN KEY([CatID])
REFERENCES [dbo].[CategoryMaster] ([CatID])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_ToTable]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_ToTable_1] FOREIGN KEY([SubCatID])
REFERENCES [dbo].[SubCategory] ([SubCatID])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_ToTable_1]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_CategoryMaster1] FOREIGN KEY([CatID])
REFERENCES [dbo].[CategoryMaster] ([CatID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_CategoryMaster1]
GO
