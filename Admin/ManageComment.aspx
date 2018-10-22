<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageComment.aspx.cs" Inherits="Admin_ManageComment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Dairy Comments</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Comment Records
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal">
                        <table class="table table-bordered datatable" id="table-1">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Blog Title</th>
                                    <th>UserName</th>
                                    <th>Comment</th>
                                    <th>Approve</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpComment" runat="server" OnItemCommand="rpComment_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblBlog" runat="server" Text='<%# Eval("BlogTitle") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblUname" Text='<%#Eval("UserName") %>' runat="server"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="lblDesc" Text='<%#Eval("CommnetDesc") %>' runat="server"></asp:Label></td>
                                            <td>
                                                <asp:Label ID="lblStatus" Text='<%#Eval("IsApprove") %>' runat="server"></asp:Label>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("CommnetID") %>' 
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
                                    <th>BlogName</th>
                                    <th>UserName</th>
                                    <th>Comment</th>
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

