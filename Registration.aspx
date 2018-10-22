<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register Src="~/Controls/SlideMenu.ascx" TagPrefix="cu" TagName="Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/styles/dark-sidebar.css">
</head>
<body class="dark-sidebar">
    <form id="form1" runat="server">

        <div>
            <cu:Menu ID="m1" runat="server" />
            <!--Page main wrapper-->
            <div id="main-content">
                <div class="page-wrapper regular-page">
                    <div class="container">
                        <!-- page title -->
                        <h2 class="section-title double-title">
                            <span></span>Register Here...</h2>
                        <!--/ page title -->
                        <div class="row mb-large">
                            <div class="col-md-offset-3 col-md-6">
                                <%--<h3 class="lined allcaps">Login</h3>--%>
                                <div role="form" id="contact-form">
                                    <!-- do not change the id attribute -->
                                    <asp:TextBox ID="txtUname" runat="server" placeholder="User Name" class="form-control requiredField" required></asp:TextBox>
                                    <%--<input class="form-control requiredField" type="text" name="author" id="author" value="" placeholder="Name" aria-required="true">--%>
                                    <br />
                                    <asp:TextBox ID="txtEmailID" runat="server" placeholder="Email ID" class="form-control requiredField" required></asp:TextBox>
                                    <br />
                                     <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" placeholder="Address" class="form-control requiredField" required></asp:TextBox>
                                    <br />
                                     <asp:TextBox ID="txtphone" runat="server" placeholder="Phone Number" class="form-control requiredField" required></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" class="form-control requiredField" required></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtDOB" runat="server" placeholder="Birth Date {mm/dd/yyyy}" TextMode="Date" class="form-control" required></asp:TextBox>
                                 
                                    <br />
                                    <asp:RadioButtonList ID="rdbGender"  CssClass="radio-inline" required  runat="server">
                                        <asp:ListItem Text="Male" Value="M" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                    <asp:FileUpload ID="fuProfile"  runat="server" CssClass="form-control" />
                                    <br />
                                    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" class="btn btn-toranj btn-block" />
                                    <%--<input class="btn btn-toranj btn-block" name="submit" type="submit" id="submit" value="Send">--%>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <a class="back-to-top" href="#"></a>
                    </div>
                </div>
            </div>
            <!--/Page main wrapper-->
        </div>
    </form>
    <!-- jquery core -->
    <script type="text/javascript" src="assets/js/vendors/jquery-1.11.0.min.js"></script>

    <!-- imagesLoaded jquery plugin -->
    <script type="text/javascript" src="assets/js/vendors/imagesloaded.pkgd.min.js"></script>

    <!-- jquery isotop plugin -->
    <script type="text/javascript" src="assets/js/vendors/isotope.pkgd.min.js"></script>

    <!-- jquery history neede for ajax pages -->
    <script type="text/javascript" src="assets/js/vendors/jquery.history.js"></script>

    <!-- owwwlab jquery kenburn slider plugin -->
    <script type="text/javascript" src="assets/js/jquery.owwwlab-kenburns.js"></script>

    <!-- owwwlab jquery double carousel plugin -->
    <script type="text/javascript" src="assets/js/jquery.owwwlab-DoubleCarousel.js"></script>

    <!-- owwwwlab jquery video background plugin -->
    <script type="text/javascript" src="assets/js/jquery.owwwlab-video.js"></script>

    <!-- tweenmax animation framework -->
    <script type="text/javascript" src="assets/js/vendors/TweenMax.min.js"></script>

    <!-- jquery nice scroll plugin needed for vertical portfolio page -->
    <script type="text/javascript" src="assets/js/vendors/jquery.nicescroll.min.js"></script>

    <!-- jquery magnific popup needed for ligh-boxes -->
    <script type="text/javascript" src="assets/js/vendors/jquery.magnific-popup.js"></script>

    <!-- html5 media player -->
    <script type="text/javascript" src="assets/js/vendors/mediaelement-and-player.min.js"></script>

    <!-- jquery inview plugin -->
    <script type="text/javascript" src="assets/js/vendors/jquery.inview.min.js"></script>

    <!-- smooth scroll -->
    <script type="text/javascript" src="assets/js/vendors/smoothscroll.js"></script>


    <!-- Master Slider -->
    <script src="assets/masterslider/jquery.easing.min.js"></script>
    <script src="assets/masterslider/masterslider.min.js"></script>

    <!-- theme custom scripts -->
    <script type="text/javascript" src="assets/js/custom.js"></script>
</body>
</html>
