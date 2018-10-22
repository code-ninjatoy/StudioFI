<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="ReferMyFriend.aspx.cs" Inherits="ReferMyFriend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3>Add My Refer Friend</h3>
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

    <!-- Form components -->
    <div class="form-horizontal" role="form">
        <!-- Basic inputs -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title"><i class="icon-bubble4"></i>Add My Friend Through Reference</h6>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="col-sm-2 control-label">Friend Name : </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtName" class="form-control" runat="server" placeholder="Enter Friend Name" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Friend Email : </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" placeholder="Enter Friend Email ID" />
                    </div>
                </div>

                <div class="form-actions text-center">
                    <asp:Button ID="btnAdd" class="btn btn-primary pull-center" Text="REFER" runat="server" OnClick="btnAdd_Click" />
                    <asp:HiddenField ID="hfID" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                </div>
            </div>
        </div>
        <!-- /basic inputs -->
    </div>
    <!-- /form components -->

    <!-- Datatable with tools menu -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title"><i class="icon-table"></i>Records</h6>
        </div>
        <div class="datatable-tools">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Friend Name</th>
                        <th>Friend Email</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repCategory" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("RefName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("RefEmail") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatPrice" runat="server" Text='<%#Eval("RefDate") %>' /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <th>No</th>
                        <th>Friend Name</th>
                        <th>Friend Email</th>
                        <th>Date</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <!-- /datatable with tools menu -->
</asp:Content>

