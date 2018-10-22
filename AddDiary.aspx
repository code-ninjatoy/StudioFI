<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="AddDiary.aspx.cs" Inherits="AddDiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function ConfirmationBox(BlogID) {
            var result = confirm('Are you sure you want to delete ' + BlogID + ' Details');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page header -->
    <%-- <div class="page-header">
        <div class="page-title">
            <h3>Manage My Diary</h3>
        </div>
    </div>--%>
    <!-- /page header -->
    <div class="panel-body">
        <div class="bg-primary with-padding block-inner">
            <h4 style="text-align: center; font-weight: 100;">Add Dairy</h4>
        </div>
    </div>

    <%-- <!-- Breadcrumbs line -->
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li></li>
        </ul>
    </div>--%>
    <!-- /breadcrumbs line -->


    <%--    <!-- Callout -->
    <div class="callout callout-success fade in">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h5>Form components page</h5>
    </div>
    <!-- /callout -->--%>

    <!-- Form components -->
    <div class="form-horizontal" role="form">
        <!-- Basic inputs -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title"><i class="icon-bubble4"></i>Add New Diary</h6>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="col-sm-2 control-label">Choose Category : </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlCat" class="select-search" runat="server" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Title : </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtTitle" class="form-control" runat="server" placeholder="Enter Diary Title" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Description : </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="7" class="form-control" runat="server" placeholder="Enter Diary Description" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Image : </label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="fuImage" class="styled" runat="server" placeholder="Enter Diary Title" />
                    </div>
                </div>

                <div class="form-actions text-center">
                    <asp:Button ID="btnAdd" class="btn btn-primary pull-center" Text="ADD" runat="server" OnClick="btnAdd_Click" />
                    <asp:HiddenField ID="hfID" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                </div>
            </div>
        </div>
        <!-- /basic inputs -->
    </div>
    <!-- /form components -->

    <asp:Repeater ID="repCategory" runat="server" OnItemCommand="repCategory_ItemCommand" OnItemDataBound="repCategory_ItemDataBound">
        <ItemTemplate>
            <div class="block task task-high">
                <div class="row with-padding">
                    <div class="col-sm-9">
                        <div class="task-description">
                            <a href="#"><%#Eval("CatName") %></a>
                            <i><%#Eval("BlogTitle") %></i>
                            <span><%#Eval("BlogDesc") %></span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="task-info">
                            <span><%# Eval("CreateDate") %></span>
                            <span>
                                <asp:Image ID="Label1" runat="server" ImageAlign="Middle" Height="50px" Width="50px" ImageUrl='<%#"~/images/BlogImages/" + Eval("BlogImage") %>' />
                            </span>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <%--<div class="pull-left">
                        <span><i class="icon-clock"></i></span>
                        <span><i class="icon-clock"></i>4 hours</span>
                    </div>--%>
                    <div class="pull-right">
                        <ul class="footer-icons-group">
                            <li>
                                <asp:LinkButton ID="lnbEdit"
                                    CommandArgument='<%#Eval("BlogID") %>' CommandName="Edit"
                                    runat="server">
                                    <i class="icon-pencil"></i></asp:LinkButton>

                            </li>
                            <li>
                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("BlogID") %>'
                                    CommandName="Delete" runat="server" >
                                    <i class="icon-remove3"></i></asp:LinkButton>
                            </li>
                            <%--<li><a href="#"><i class="icon-pencil"></i></a></li>
                    <li><a href="#"><i class="icon-remove3"></i></a></li>--%>
                        </ul>
                    </div>
                </div>
                <%-- <!-- Datatable with tools menu -->
    <div class="panel panel-primary">
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
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repCategory" runat="server" OnItemCommand="repCategory_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                <td>
                                    <asp:Image ID="Label1" runat="server" ImageAlign="Middle" Height="50px" Width="50px" ImageUrl='<%#"Admin/Images/BlogImages/" + Eval("BlogImage") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("BlogTitle") %>' /></td>
                                <td>
                                    <asp:Label ID="lblCatPrice" runat="server" Text='<%#Eval("BlogDesc") %>' /></td>
                                <td>
                                    <asp:LinkButton ID="lnbEdit" CommandArgument='<%#Eval("BlogID") %>' CommandName="Edit" runat="server" class="btn btn-info"><i class="icon-pencil2"></i>Edit&nbsp;&nbsp;</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("BlogID") %>' CommandName="Delete" runat="server" class="btn btn-danger"><i class="icon-remove"></i>Delete&nbsp;&nbsp;</asp:LinkButton>
                                </td>
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
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>--%>
                <!-- /datatable with tools menu -->
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

