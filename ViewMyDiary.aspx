<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="ViewMyDiary.aspx.cs" Inherits="ViewMyDiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3>View My Diary History</h3>
        </div>
    </div>
    <!-- /page header -->

    <!-- Breadcrumbs line -->
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li></li>
        </ul>
    </div>
    <!-- /breadcrumbs line -->

    <!-- Datatable with tools menu -->
    <%--<div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title"><i class="icon-table"></i>Records</h6>
        </div>
        <div class="datatable-tools">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repCategory" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblID" runat="server" Text='<%#  Container.ItemIndex + 1 %>' /></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CatName")%>' /></td>
                                <td>
                                    <asp:Image ID="Label1" runat="server" ImageAlign="Middle" Height="50px"
                                        Width="50px" ImageUrl='<%#"Admin/Images/BlogImages/" + Eval("BlogImage") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("BlogTitle") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatPrice" runat="server" Text='<%#Eval("BlogDesc") %>' /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <th>No</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Description</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>--%>
    <!-- /datatable with tools menu -->

    <asp:Repeater ID="rpDairy" runat="server" OnItemCommand="rpDairy_ItemCommand">
        <ItemTemplate>
            <div class="block task task-high">
                <div class="row with-padding">
                    <div class="col-sm-9">
                        <div class="task-description">
                            <a href="#"><%# Eval("CatName") %></a>
                            <%--<i>NoName app</i>--%>
                            <span><%# Eval("BlogDesc") %></span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="task-info">
                            <asp:Image ID="img" ImageUrl='<%# "~/images/BlogImages/" + Eval("BlogImage") %>' Height="50px" Width="50px" runat="server" />
                            <%--<span>October 12, 2013</span>
                            <span>3 days | <span class="label label-danger">12%</span></span>--%>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="pull-left">
                        <span>
                            <asp:LinkButton ID="MoreCmt" runat="server" CommandName="Comment"
                                CommandArgument='<%# Eval("BlogID") %>'><i class="entypo-comment"></i>
                                Comments</asp:LinkButton></span>
                        <asp:HiddenField ID="hp" runat="server" />
                        <asp:Repeater ID="rpComment" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-9">
                                    <div class="task-description">
                                        <h6><%# Eval("UserName") %></h6>
                                        <span><%# Eval("CommnetDesc") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

