<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Admin_Controls_Menu" %>

<div class="sidebar-menu">
    <header class="logo-env">

        <!-- logo -->
        <div class="logo">
            <a href="Dashboard.aspx">
                <img src="assets/images/x1.png" width="120" alt="" />
            </a>
        </div>

        <!-- logo collapse icon -->

        <div class="sidebar-collapse">
            <a href="#" class="sidebar-collapse-icon with-animation">
                <!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
                <i class="entypo-menu"></i>
            </a>
        </div>



        <!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
        <div class="sidebar-mobile-menu visible-xs">
            <a href="#" class="with-animation">
                <!-- add class "with-animation" to support animation -->
                <i class="entypo-menu"></i>
            </a>
        </div>

    </header>
    <ul id="main-menu">
        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
        <!-- Search Bar -->

        <li class="active">
            <a href="Dashboard.aspx">
                <i class="entypo-gauge"></i>
                <span>DASHBOARD</span>
            </a>
        </li>
        <li>
            <a href="EditAdminProfile.aspx">
                <i class="entypo-user-add"></i>
                <span>EDIT PROFILE</span>
            </a>
        </li>
        <li>
            <a href="BookingEvent.aspx">
                <i class="entypo-tag"></i>
                <span>BOOKING EVENT</span>
            </a>
        </li>
        <li>
            <a href="ui-panels.html">
                <i class="glyphicon glyphicon-th-large"></i>
                <span>CATEGORIES</span>
            </a>
            <ul>
                <li>
                    <a href="Category.aspx">
                        <i class="fa fa-pencil"></i>
                        <span>MANAGE CATEGORY</span>
                    </a>
                </li>
                <li>
                    <a href="SubCategoryPG.aspx">
                        <i class="fa fa-pencil-square"></i>
                        <span>MANAGE SUB CATEGORY</span>
                    </a>
                </li>
                <li>
                    <a href="ManagePricing.aspx">
                        <i class="glyphicon glyphicon-usd"></i>
                        <span>MANAGE PRICING</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="ui-panels.html">
                <i class="fa fa-camera-retro"></i>
                <span>PORTFOLIO</span>
            </a>
            <ul>
                <li>
                    <a href="TeamManage.aspx">
                        <i class="entypo-camera"></i>
                        <span>MANAGE PHOTOGRAPHERS</span>
                    </a>
                </li>
                <li>
                    <a href="Portfolio.aspx">
                        <i class="entypo-picture"></i>
                        <span>MANAGE PORTFOLIO</span>
                    </a>
                </li>

                <li>
                    <a href="ManageCoverImage.aspx">
                        <i class="glyphicon glyphicon-picture"></i>
                        <span>MANAGE COVERIMAGE</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="mailbox.html">
                <i class="entypo-users"></i>
                <span>CUSTOMER</span>
                <%--<span class="badge badge-secondary">8</span>--%>
            </a>
            <ul>
                <li>
                    <a href="RegisterCustomer.aspx">
                        <i class="glyphicon glyphicon-check"></i>
                        <span>REGISTER CUSTOMER</span>
                    </a>
                </li>
                <li>
                    <a href="RefCustomer.aspx">
                        <i class="fa fa-users"></i>
                        <span>MANAGE REFERENCEES</span>
                    </a>
                </li>
                <li>
                    <a href="FeedBackPG.aspx">
                        <i class="fa fa-quote-left"></i>
                        <span>MANAGE QUERY</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="entypo-book"></i>
                <span>MANAGE DAIRY</span>
            </a>
            <ul>
                <li>
                    <a href="ManageBlog.aspx">
                        <i class="entypo-docs"></i>
                        <span>MANAGE POST</span>
                    </a>
                </li>
                <li>
                    <a href="ManageComment.aspx">
                        <i class="fa fa-comments"></i>
                        <span>MANAGE COMMENTS</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="ManageFAQ.aspx">
                <i class="entypo-help"></i>
                <span>MANAGE FAQ</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="entypo-credit-card"></i>
                <span>FI REPORTS</span>
            </a>
            <ul>
                <li>
                    <a href="Report1DateofOrderBook.aspx">
                        <i class="entypo-calendar"></i>
                        <span>MONTH WISE ORDER BOOKED</span>
                    </a>
                </li>
                <li>
                    <a href="Report2CustDetOne.aspx">
                        <i class="entypo-user"></i>
                        <span>GENERATE CUSTOMER REPORT</span>
                    </a>
                </li>
                <li>
                    <a href="Report3RefCount.aspx">
                        <i class="entypo-mail"></i>
                        <span>HIGHEST REFERENCE</span>
                    </a>
                </li>
               
                <li>
                    <a href="Report4PendingBook.aspx">
                        <i class="entypo-dot-3"></i>
                        <span>PENDING BOOKING</span>
                    </a>
                </li>
                <li>
                    <a href="Report5CustDet.aspx">
                        <i class="entypo-info-circled"></i>
                        <span>CUSTOMER DETAILS</span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div>
