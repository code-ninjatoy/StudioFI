<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="OurTeam.aspx.cs" Inherits="OurTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>OurTeam</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <!--Page main wrapper-->
    <div id="main-content" class="abs dark-template">
        <div class="page-wrapper">
            <div class="vertical-carousel team-members">
                <!-- Contents Side-->
                <div class="left-side">
                    <!-- Contents Carousel Wrapper -->
                    <div class="left-side-wrapper">
                        <asp:Repeater ID="rep1" runat="server">
                            <ItemTemplate>
                                <!-- Content Item -->
                                <div class="item vcenter-wrapper">
                                    <div class="item-wrapper vcenter">

                                        <!-- Team Item Title-->
                                        <h5 class="team-title"><%#Eval("PersonWork") %><span><%#Eval("TeamName") %></span></h5>
                                        <!-- /Team Item Title-->

                                        <!-- Team Item Informartion-->
                                        <div class="info">
                                            <!-- Team Item Description-->
                                            <div class="description">
                                                <p><%#Eval("PersonDesc") %></p>
                                            </div>
                                            <!-- /Team Item Description-->
                                        </div>
                                        <!-- /Team Item Informartion-->
                                        <!-- Team Item Social Icons-->
                                        <ul class="social-icons">
                                            <li><a href="#"><i class="fa fa-flickr"></i></a></li>
                                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>
                                        <!-- /Team Item Social Icons-->

                                    </div>
                                </div>
                                <!-- /Content Item -->
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <!-- /Contents Carousel Wrapper -->

                    <!-- Carousel Counter -->
                    <div class="vcarousel-counter">
                        <span class="counter-current">1</span>
                        <span class="counter-divider">/</span>
                        <span class="counter-total"></span>
                    </div>
                    <!-- /Carousel Counter -->

                    <!-- Carousel Previous -->
                    <div class="vcarousel-prev">
                        <a href="#"><i class="fa fa-angle-up"></i></a>
                    </div>
                    <!-- /Carousel Previous -->

                    <!-- Carousel Next -->
                    <div class="vcarousel-next">
                        <a href="#"><i class="fa fa-angle-down"></i></a>
                    </div>
                    <!-- /Carousel Next -->
                </div>
                <!-- /Contents Side-->
                <!-- Image Side -->
                <div class="right-side" data-fill="auto-fill">
                    <!-- Image Carousel Wrapper -->
                    <div class="right-side-wrapper">
                        <asp:Repeater ID="rep2" runat="server">
                            <ItemTemplate>
                                <!-- Image Item -->
                                <div class="item">
                                    <img src='<%# "images/TeamImg/" + Eval("PersonImg") %>' alt="">
                                </div>
                                <!-- /Image Item -->

                                <%-- <!-- Image Item -->
                        <div class="item">
                            <img src="assets/img/team/team2.jpg" alt="">
                        </div>
                        <!-- /Image Item -->

                        <!-- Image Item -->
                        <div class="item">
                            <img src="assets/img/team/team3.jpg" alt="">
                        </div>
                        <!-- /Image Item -->

                        <!-- Image Item -->
                        <div class="item">
                            <img src="assets/img/team/team4.jpg" alt="">
                        </div>--%>
                                <!-- /Image Item -->
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- Image Carousel Wrapper -->
                </div>
                <!-- /Image Side -->
            </div>
        </div>
    </div>
    <!--/Page main wrapper-->
</asp:Content>

