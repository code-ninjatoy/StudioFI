<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="TeamManage.aspx.cs" Inherits="Admin_TeamManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Manage Team</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Manage Photographers</h2>
    <br />
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Add Photographer
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal ">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Photographer Name</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtteamnm" runat="server" class="form-control" required placeholder="Enter Photographer Name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Job Work</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtwork" runat="server" class="form-control" required placeholder="Enter Photographer Work" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Photographer Profile</label>

                            <div class="col-sm-5">
                                <asp:FileUpload ID="teamImage" runat="server" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Descripation</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtdesc" TextMode="MultiLine" runat="server" class="form-control" required placeholder="Enter Descripation" />
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
                                    <th>Photographer Name</th>
                                    <th>Job Work</th>
                                    <th>Image</th>
                                    <th>Description</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repTeam" runat="server" OnItemCommand="repTeam_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblteamName" runat="server" Text='<%#Eval("TeamName") %>' /></td>
                                            <td>    
                                                <asp:Label ID="lblWork" runat="server" Text='<%#Eval("PersonWork") %>' /></td>
                                            <td>
                                                <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/TeamImg/" + Eval("PersonImg") %>' Height="50" Width="50" /></td>
                                            <td>
                                                <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("PersonDesc") %>' /></td>
                                            <td>
                                                <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("TeamID") %>' CommandName="Edit" runat="server" class="btn btn-info btn-sm btn-icon"><i class="entypo-pencil"></i>Edit</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("TeamID") %>' CommandName="Delete" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Delete</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Photographer Name</th>
                                    <th>Job Work</th>
                                    <th>Image</th>
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

 