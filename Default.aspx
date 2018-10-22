<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Controls/SlideMenu.ascx" TagPrefix="cu" TagName="Menu" %>
<%@ Register Src="~/Controls/SliderBar.ascx" TagPrefix="cu" TagName="Slider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/styles/dark-sidebar.css">
</head>
<body class="dark-sidebar">
    <form id="form1" runat="server">
        <div>
            <cu:Menu ID="m1" runat="server" />
            <cu:Slider ID="s1" runat="server" />
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
