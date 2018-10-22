<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Report1DateofOrderBook.aspx.cs" Inherits="Admin_Report1DateofOrderBook" %>

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
            <h2><strong>MONTH WISE ORDERED BOOK</strong></h2>
            <br />
        </p>
    </blockquote>

    <div class="col-sm-5">
        <asp:DropDownList ID="ddlMonth" runat="server" class="form-control select2" AutoPostBack="true"
            data-allow-clear="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
            <asp:ListItem>Select Month</asp:ListItem>
            <asp:ListItem>January</asp:ListItem>
            <asp:ListItem>February</asp:ListItem>
            <asp:ListItem>March</asp:ListItem>
            <asp:ListItem>April</asp:ListItem>
            <asp:ListItem>May</asp:ListItem>
            <asp:ListItem>Jun</asp:ListItem>
            <asp:ListItem>July</asp:ListItem>
            <asp:ListItem>August</asp:ListItem>
            <asp:ListItem>September</asp:ListItem>
            <asp:ListItem>Octomber</asp:ListItem>
            <asp:ListItem>November</asp:ListItem>
            <asp:ListItem>December</asp:ListItem>
        </asp:DropDownList>
    </div>
     <div class="col-md-5">
                <asp:Button ID="btnRP" OnClick="btnRP_Click" runat="server" Text="GENERATE PRINT" class="btn btn-success btn-lg" />
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
                         <asp:Panel ID="Panel1" runat="server">
                        <table class="table table-bordered datatable" id="table-1">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Customer Name</th>
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
                                                <asp:Label ID="lblCatName" runat="server" Text='<%#Eval("UserName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblCat" Text='<%#Eval("CatName") %>' runat="server"></asp:Label>
                                                <td>
                                                    <asp:Label ID="lblSubCat" Text='<%#Eval("SubCatName") %>' runat="server"></asp:Label>
                                                </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Customer Name</th>
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

