<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageBlog.aspx.cs" Inherits="Admin_ManageBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Dairy</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Blog Records
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal">
                        <table class="table table-bordered datatable" id="table-1">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Image</th>
                                    <th>UserName</th>
                                    <th>Post</th>
                                    <th>Approve</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpBlog" runat="server" OnItemCommand="rpBlog_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("BlogTitle") %>' /></td>
                                                <%--<asp:HiddenField is="hp" runat="server" Value='<%# Eval("BlogID") %>' />--%>
                                            <td>
                                                <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                            <td>
                                                <asp:Image ID="img" runat="server" Height="50px" Width="50px" style="border-radius:20px;"  ImageUrl='<%# "~/images/BlogImages/" + Eval("BlogImage") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblUname" Text='<%#Eval("UserName") %>' runat="server"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="lblDesc" Text='<%#Eval("BlogDesc") %>' runat="server"></asp:Label></td>
                                            <%--<td>
                                                <asp:Label ID="lblDate" Text='<%#Eval("dt") %>' runat="server"></asp:Label></td>--%>
                                            <td>
                                                <asp:Label ID="lblStatus" Text='<%#Eval("IsApprove") %>' runat="server"></asp:Label>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("BlogID") %>' 
                                                    CommandName="approve" runat="server" class="btn btn-danger btn-sm btn-icon">
                                                    <i class="entypo-cancel"></i>Y/N</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Image</th>
                                    <th>UserName</th>
                                    <th>Post</th>
                                    <th>Approve</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>