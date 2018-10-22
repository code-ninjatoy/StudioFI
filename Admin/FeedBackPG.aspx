<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FeedBackPG.aspx.cs" Inherits="Admin_FeedBackPG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Feedback</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>FI Studio Query</h2>
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
                                    <th>Visitor Name</th>
                                    <th>Visitor EmailID</th>
                                    <th>Date</th>
                                    <th>Query</th>
                                  <%--  <th>Aciton</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <%--OnItemCommand="repCategory_ItemCommand"--%>
                                <asp:Repeater ID="FeedbackRep" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 101 %>' /></td>


                                            <td>
                                                <asp:Label ID="lbluname" runat="server" Text='<%#Eval("FUserName") %>' /></td>


                                            <td>
                                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("FEmailID") %>' /></td>

                                            <td>
                                                <asp:Label ID="lblDate" runat="server" Text='<%#Eval("FeedDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblfeedbback" runat="server" Text='<%#Eval("FeedBack") %>' /></td>

                                           <%-- <td>--%>
                                               <%-- <asp:LinkButton ID="lnbfeedaction" CommandArgument='<%#Eval("FBID") %>' CommandName="Block" runat="server" class="btn btn-danger btn-sm btn-icon"><i class="entypo-cancel"></i>Block</asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Visitor Name</th>
                                    <th>Visitor EmailID</th>
                                    <th>Date</th>
                                    <th>Query</th>
                                    <%--<th>Aciton</th>--%>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

