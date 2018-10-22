﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideMenu.ascx.cs" Inherits="Controls_SlideMenu" %>

<a href="#" id="menu-toggle-wrapper">
    <div id="menu-toggle"></div>
</a>

<!-- inner bar wrapper -->
<a href="#" id="inner-bar">
    <!-- Small logo -->
    <div class="logo-alt">
        <img src="../images/Logo/Logo2.png" alt="logo-mini">
    </div>
    <!-- /Small logo -->
</a>
<!-- /inner bar wrapper -->

<div id="side-bar">
    <div class="inner-wrapper">
        <div id="side-inner">
            <div id="logo-wrapper">
                <a href="default.aspx">
                    <img src="../images/Logo/Logo1.png" alt="logo"></a>
            </div>
            <div id="side-contents">
                <ul id="navigation">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="menu-item-has-children"><a href="#">WORK</a>
                        <ul class="sub-menu">
                            <li class="nav-prev"><a href="#"><i class="fa fa-angle-left"></i>Portfolio Categories</a></li>
                            <li><a href="Portfoilio.aspx?id=PERSONAL">PERSONAL</a></li>
                            <li><a href="Portfoilio.aspx?id=CHILDREN">CHILDREN</a></li>
                            <li><a href="Portfoilio.aspx?id=WEDDING">WEDDING</a></li>
                            <li><a href="Portfoilio.aspx?id=PRE-WEDDING">PRE-WEDDING</a></li>
                           <%-- <li><a href="Portfoilio.aspx?id=ANIMAL">ANIMAL</a></li>--%>
                        </ul>
                    </li>
                    <li><a href="Pricing.aspx">Pricing</a></li>
                    <li><a href="Diary2.aspx">Diary</a></li>
                    <li><a href="ClientProfile.aspx">My Profile</a></li>
                    <li class="menu-item-has-children"><a href="#">ABOUT US</a>
                        <ul class="sub-menu">
                            <li class="nav-prev"><a href="#"><i class="fa fa-angle-left"></i>ABOUT FI STUDIO</a></li>
                            <li><a href="OurTeam.aspx">Photographers</a></li>
                            <li><a href="Contactus.aspx">Contact</a></li>
                        </ul>
                    </li>


                </ul>

            </div>

            <!-- Sidebar footer -->
            <div id="side-footer">
                <!-- Social icons -->
                <ul class="social-icons">
                    <li><a href="https://www.facebook.com/NPStudio1?ref=br_rs"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-flickr"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul>
                <!-- /Social icons -->
                <div id="copyright">
                    @FIStudio
               
                </div>
            </div>
            <!-- /Sidebar footer -->

        </div>
    </div>
</div>
