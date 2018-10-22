<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="SubCategoryPG.aspx.cs" Inherits="Admin_SubCategoryPG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sub Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Manage Sub Category</h2>
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Add Sub Category
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal ">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Sub Category Name</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtSubCatName" runat="server" class="form-control" required placeholder="Enter Category Name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Select Category</label>

                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddlsubcat" runat="server" class="form-control select2" data-allow-clear="true" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-3">
                                <asp:Button ID="btnAdd" runat="server" Text="ADD" OnClick="btnAdd_Click" class="btn btn-success btn-lg col-md-5"></asp:Button>
                                <asp:HiddenField ID="hfID" runat="server" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>

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
                                    <th>Sub Category</th>
                                    <th>Category</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repSubCategory" runat="server" OnItemCommand="repSubCategory_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblsubCatName" runat="server" Text='<%#Eval("SubCatName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCatid" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                            <td>
                                                <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("SubCatID") %>' CommandName="Edit" runat="server" class="btn btn-info btn-sm btn-icon"><i class="entypo-pencil"></i>Edit</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("SubCatID") %>' CommandName="Delete" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Delete</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Sub Category</th>
                                    <th>Category</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

