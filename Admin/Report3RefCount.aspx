<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Report3RefCount.aspx.cs" Inherits="Admin_Report2HighestBlogCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>FI Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>

    <div class="row">
        <div class="col-sm-12">
            <div class="tile-title tile-primary">
                <div class="icon">
                    <asp:Image ID="img" runat="server" ImageUrl="~/images/Logo/Logo1.png" />
                    <%--<i class="glyphicon glyphicon-leaf"></i>--%>
                </div>

                <div class="title">
                    <h3>FIRST IMPRESSION STUDIO</h3>
                   <%-- <p>so far in our blog, and our website.</p>--%>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <blockquote>
        <p>
            <h2><strong>COUNT REFERENCE WISE CUSTOMER</strong></h2>
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
                                <asp:Repeater ID="rpData" runat="server" >
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCust" runat="server" Text='<%#Eval("UserName") %>' /></td>
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

