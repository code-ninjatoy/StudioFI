<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Portfoilio.aspx.cs" Inherits="Portfoilio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Portfolio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page main wrapper -->
    <div id="main-content" class="dark-template">
        <div class="page-wrapper">
            <!-- Page sidebar -->
            <div class="page-side ">
                <div class="inner-wrapper vcenter-wrapper">
                    <div class="side-content vcenter">

                        <!-- Page Title -->
                        <h1 class="title">
                            <span class="second-part">The Dream's</span>
                            <span>Portfolio</span>
                        </h1>
                        <!-- /Page Title -->

                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua.
                            <br />
                        </p>

                        <div class="row">
                            <asp:Repeater ID="repPhotographer" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-12 col-sm-6">
                                        <div class="supervisor">
                                            <div class="sv-avatar">
                                                <asp:Image ID="img" runat="server" src='<%# "images/TeamImg/" + Eval("PersonImg") %>' alt="staff image" />
                                            </div>
                                            <div class="sv-detail">
                                                <h3 class="sv-name"><%#Eval("TeamName") %></h3>
                                                <div><%#Eval("PersonWork") %></div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page sidebar -->

            <!-- Page main content -->
            <div class="page-main">

                <!-- Gallery wrapper -->
                <div class="grid-portfolio tj-lightbox-gallery">
                    <asp:Repeater ID="repPortfolio" runat="server">
                        <ItemTemplate>
                            <!-- Gallery Item -->
                            <div class="gp-item tj-hover-5">
                                <a href='<%# "images/PImage/" + Eval("Image") %>' class="lightbox-gallery-item">
                                    <img src='<%# "images/PImage/" + Eval("Image") %>' alt="alt" class="img-responsive">
                                    <!-- Item Overlay -->
                                    <div class="tj-overlay"></div>
                                    <!-- /Item Overlay -->
                                </a>
                            </div>
                            <!-- /Gallery Item -->
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!-- /Gallery wrapper -->

            </div>
            <!-- /Page main content -->

        </div>
    </div>
    <!-- /Page main wrapper -->
</asp:Content>