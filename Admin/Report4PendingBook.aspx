<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Report4PendingBook.aspx.cs" Inherits="Admin_Report2HighestBlogCat" %>

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
            <h2><strong>PENDING BOOKING SHOOT</strong></h2>
            <br />
        </p>
    </blockquote>

    <div class="col-md-7">
        <div class="col-md-3">
            <asp:Button ID="btnExport" Text="Export in Excel" OnClick="btnExport_Click" runat="server" class="btn btn-success btn-lg" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnRP" OnClick="btnRP_Click" runat="server" Text="GENERATE PRINT" class="btn btn-success btn-lg" />
        </div>
    </div>
    <br />
    <br />
    <br />
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
                        <asp:Panel ID="panel1" runat="server">
                            <table class="table table-bordered datatable" id="table-1">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>Name</th>
                                        <th>EmailID</th>
                                        <th>Phone No</th>
                                        <th>Book Date</th>
                                        <th>Category</th>
                                        <th>Package</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                                <td>
                                                    <asp:Label ID="lblCust" runat="server" Text='<%#Eval("UserName") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("EmailID") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Phone") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("bd") %>' /></td>
                                                <td>
                                                    <asp:Label ID="lblCount" Text='<%#Eval("CatName") %>' runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label4" Text='<%#Eval("SubCatName") %>' runat="server"></asp:Label></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>NO</th>
                                        <th>Name</th>
                                        <th>EmailID</th>
                                        <th>Phone No</th>
                                        <th>Book Date</th>
                                        <th>Category</th>
                                        <th>Package</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

