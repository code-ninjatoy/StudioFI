<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManagePricing.aspx.cs" Inherits="Admin_ManagePricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Pricing</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Manage Pricing</h2>
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Add Pricing Details
                    </div>
                </div>
                <div class="panel-body">
                    <div role="form" class="form-horizontal ">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Select Category</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddlCategory" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged1" class="form-control select2" data-allow-clear="true" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Select Sub Category</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddlSubCat" AutoPostBack="true" runat="server" class="form-control select2" data-allow-clear="true" required />
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Cover Image</label>
                            <div class="col-sm-5">
                                <asp:FileUpload ID="coverImage" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Enter Price $ : </label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" required placeholder="Enter Price" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Location Hour</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtLoc" runat="server" class="form-control" required placeholder="Enter Location Hour" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Outfit Changes</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtOutfit" runat="server" class="form-control" required placeholder="Enter Outfit Changes" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Images Capture</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtImages" runat="server" class="form-control" required placeholder="Enter Images Capture" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Edited Images</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtEdited" runat="server" class="form-control" required placeholder="Enter Edited Images" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtDesc" runat="server" class="form-control" required placeholder="Enter Description" />
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
                                    <th>Category</th>
                                    <th>Sub Cat</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Loc Hour</th>
                                    <th>Outfit</th>
                                    <th>Capture</th>
                                    <th>Edited</th>
                                    <th>Description</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpPackage" runat="server" OnItemCommand="rpPackage_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblSubCat" runat="server" Text='<%#Eval("SubCatName") %>' /></td>
                                            <td>
                                                <asp:Image ID="lblDefImg" Height="50px" Width="50px" runat="server" ImageUrl='<%# "~/images/PricingImage/" + Eval("DefImage") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblHour" runat="server" Text='<%#Eval("LocationHour") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblOutfit" runat="server" Text='<%#Eval("OutfitChange") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblcap" runat="server" Text='<%#Eval("ImagesCapt") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblEdited" runat="server" Text='<%#Eval("EditedImage") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' /></td>
                                            <td>
                                                <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("PID") %>' CommandName="Edit" runat="server" class="btn btn-info btn-sm btn-icon"><i class="entypo-pencil"></i>Edit</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("PID") %>' CommandName="Delete" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Delete</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Category</th>
                                    <th>Sub Cat</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Loc Hour</th>
                                    <th>Outfit</th>
                                    <th>Capture</th>
                                    <th>Edited</th>
                                    <th>Description</th>
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

