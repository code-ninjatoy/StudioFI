<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Dashboard</h2>
    <br />
    <div class="row">
        <asp:Repeater ID="rpReg" runat="server">
            <ItemTemplate>
                <div class="col-sm-3">
                    <div class="tile-stats tile-red">
                        <div class="icon"><i class="entypo-users"></i></div>
                        <div class="num"><%# Eval("co") %></div>
                        <h3>Registered Users</h3>
                        <p>All Registered User in Website.</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="rpBook" runat="server">
            <ItemTemplate>
                <div class="col-sm-3">
                    <div class="tile-stats tile-green">
                        <div class="icon"><i class="entypo-tag"></i></div>
                        <div class="num"><%# Eval("co") %></div>
                        <h3>Book Shoot</h3>
                        <p>It Display Total Booking Events.</p>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="rpRef" runat="server">
            <ItemTemplate>
                <div class="col-sm-3">
                    <div class="tile-stats tile-aqua">
                        <div class="icon"><i class="entypo-mail"></i></div>
                        <div class="num"><%# Eval("co") %></div>
                        <h3>Reference</h3>
                        <p>Refered User by Register User.</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="rpBlog" runat="server">
            <ItemTemplate>
                <div class="col-sm-3">
                    <div class="tile-stats tile-blue">
                        <div class="icon"><i class="entypo-book"></i></div>
                        <div class="num"><%# Eval("co") %></div>
                        <h3>Dairy</h3>
                        <p>Post Written by user.</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>

