<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="ClientProfile.aspx.cs" Inherits="ClientProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3>Profile page <small>User profile Dashboard Page</small></h3>
        </div>
        <%--<div id="reportrange" class="range">
            <div class="visible-xs header-element-toggle">
                <a class="btn btn-primary btn-icon"><i class="icon-calendar"></i></a>
            </div>
            <div class="date-range"></div>
            <span class="label label-danger">9</span>
        </div>--%>
    </div>
    <!-- /page header -->
    <div class="row">
        <div class="col-lg-2">
            <asp:Repeater ID="rep1" runat="server">
                <ItemTemplate>
                    <!-- Profile links -->
                    <div class="block">
                        <div class="block">
                            <div class="thumbnail">
                                <div class="thumb">
                                    <img alt="" src='<%# "images/UserImages/" + Eval("ProfilePic") %>'>
                                </div>
                                <div class="caption text-center">
                                    <h6><%#Eval("UserName") %></h6>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /profile links -->
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Info blocks -->
        <ul class="info-blocks">
            <asp:Repeater ID="rpDairy" runat="server">
                <ItemTemplate>
                    <li class="bg-primary">
                        <div class="top-info">
                            <a href="AddDiary.aspx">Diary</a>
                            <small>Add New Diary</small>
                        </div>
                        <a href="AddDiary.aspx"><i class="icon-pencil"></i></a>
                        <span class="bottom-info bg-danger">Your <%# Eval("co") %> posts in Dairy.</span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rpComm" runat="server">
                <ItemTemplate>
                    <li class="bg-info">
                        <div class="top-info">
                            <a href="Diary.aspx">Comment</a>
                            <small>Your Comment on Diary</small>
                        </div>
                        <a href="Diary.aspx"><i class="icon-bubbles3"></i></a>
                        <span class="bottom-info bg-primary">You Comment <%# Eval("co") %> on Diary.</span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rpBook" runat="server">
                <ItemTemplate>
                    <li class="bg-warning">
                        <div class="top-info">
                            <a href="AddBooking.aspx">Book Shoot</a>
                            <small>Your Bookig History</small>
                        </div>
                        <a href="AddBooking.aspx"><i class="icon-calendar4"></i></a>
                        <span class="bottom-info bg-primary">You Book <%#Eval("co") %> Shoot.</span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rpRefer" runat="server">
                <ItemTemplate>
                    <li class="bg-success">
                        <div class="top-info">
                            <a href="ReferMyFriend.aspx">Reference</a>
                            <small>Your Refer Friend.</small>
                        </div>
                        <a href="ReferMyFriend.aspx"><i class="icon-star3"></i></a>
                        <span class="bottom-info bg-primary">You Refer <%#Eval("co") %> Friends.</span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rpLike" runat="server">
                <ItemTemplate>
                    <li class="bg-danger">
                        <div class="top-info">
                            <a href="#">Like</a>
                            <small>Your Likes.</small>
                        </div>
                        <a href="#"><i class="icon-thumbs-up3"></i></a>
                        <span class="bottom-info bg-primary">Your Like <%#Eval("co") %> on posts.</span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <!-- /info blocks -->

    </div>
    <!-- /profile grid -->
    <br />
    <br />
    <div style="border-top: double">
        <h6 style="font-weight: 400;">Click
            <asp:LinkButton ID="lnkDeact" Text="Deactivate" runat="server" PostBackUrl="~/DeactivateAcc.aspx"></asp:LinkButton>
            for disconnect with FiStudio.
        </h6>
    </div>
    <br />
    <br />
</asp:Content>
