<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Report2HighestBlogCat.aspx.cs" Inherits="Admin_Report2HighestBlogCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>FI Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <blockquote>
        <p>
            <h2><strong>CATEGORY WISE BLOG</strong></h2>
            <br />
        </p>
    </blockquote>

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
                                    <th>Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCount" Text='<%#Eval("co") %>' runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Category</th>
                                    <th>Count</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

