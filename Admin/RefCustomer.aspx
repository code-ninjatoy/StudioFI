<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="RefCustomer.aspx.cs" Inherits="Admin_RefCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Reference</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Reference Customer</h2>
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
                                    <th>Our Customer</th>
                                    <th>To Ref EmailID</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--OnItemCommand="repCategory_ItemCommand"--%>
                                <asp:Repeater ID="repRefUser" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 101 %>' /></td>


                                            <td>
                                                <asp:Label ID="lbluname" runat="server" Text='<%#Eval("UserName") %>' /></td>


                                            <td>
                                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("RefEmail") %>' /></td>

                                            <td>
                                                <asp:Label ID="lblDate" runat="server" Text='<%#Eval("RefDate") %>' /></td>
                                            <%--<td>
                                                    <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("CatID") %>' CommandName="Edit" runat="server" class="btn btn-info btn-sm btn-icon"><i class="entypo-pencil"></i>Edit</asp:LinkButton>
                                                </td>
                                            <td>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("UserID") %>' CommandName="Delete" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Action</asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Reg Name</th>
                                    <th>Reference EmailID</th>
                                    <th>Date</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

