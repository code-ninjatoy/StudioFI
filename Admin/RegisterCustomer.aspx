<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="RegisterCustomer.aspx.cs" Inherits="Admin_RegisterCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Registerd Customers</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Registered Users</h2>
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Records
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal">
                        <table class="table table-bordered datatable" id="table-1">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>UserName</th>
                                    <th>Email</th>
                                    <th>Profile</th>
                                    <th>DOB</th>
                                    <th>Gender</th>
                                    <th>Created Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repRegUser" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lbluname" runat="server" Text='<%#Eval("UserName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("EmailID") %>' /></td>
                                            <td>
                                                <asp:Image ID="impProPic" runat="server" Height="50px" Width="50px" ImageUrl='<%# "~/images/UserImages/" + Eval("ProfilePic") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("UserDOBDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCreateDate" runat="server" Text='<%#Eval("CreateDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status") %>' /></td>
                                            <%--<td>
                                                    <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("CatID") %>' CommandName="Edit" runat="server" class="btn btn-info btn-sm btn-icon"><i class="entypo-pencil"></i>Edit</asp:LinkButton>
                                                </td>--%>
                                            <td>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("UserID") %>' CommandName="Block" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Block</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                 <tr>
                                    <th>NO</th>
                                    <th>UserName</th>
                                    <th>Email</th>
                                    <th>Profile</th>
                                    <th>DOB</th>
                                    <th>Gender</th>
                                    <th>Created Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

