<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="AddBooking.aspx.cs" Inherits="AddBooking" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="panel-body">
        <div class="bg-primary with-padding block-inner">
            <h4 style="text-align: center; font-weight: 100;">Shoot Your Book Now...!</h4>
        </div>
    </div>
    <!-- Right labels -->

    <div class="form-horizontal" role="form">
        <!-- Basic inputs -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title"><i class="icon-bubble4"></i>Add Your Book Shoot</h6>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Choose Category : </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlCat" class="select-search" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Choose Package : </label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="drpSubCate" class="select-search" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Booking Discription</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtDesc" Rows="5" class="form-control" TextMode="MultiLine" runat="server"
                            placeholder="Booking Description [Optional]" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Select Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtDate" class="form-control datepicker" runat="server" placeholder="Select Date" />
                        <%--<asp:Calendar ID="cal" runat="server" class="datepicker"></asp:Calendar>--%>
                    </div>
                </div>
                <div class="form-actions text-center">
                    <asp:Button ID="btnAdd" class="btn btn-primary pull-center btn-lg" OnClick="btnAdd_Click" Text="ADD" runat="server" />
                    <asp:HiddenField ID="hfID" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" class="btn btn-warning btn-lg"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <!-- /right labels -->

    <asp:Repeater ID="rpBooking" runat="server" OnItemCommand="rpBooking_ItemCommand">
        <ItemTemplate>
            <div class="block task task-high">

                <div class="row with-padding">
                    <div class="col-sm-9">
                        <div class="task-description">
                            <a href="#"><%#Eval("CatName") %></a>
                            <i><%#Eval("SubCatName") %></i>
                            <span><%#Eval("BookDesc") %></span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="task-info">
                            <span><%# Eval("bd") %></span>
                            <span>
                                <%# Eval("BookStatus") %>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <ul class="footer-icons-group">
                            <li>
                                <asp:LinkButton ID="lnbEdit"
                                    CommandArgument='<%#Eval("BookID") %>' CommandName="Edit"
                                    runat="server">
                                    <i class="icon-pencil"></i></asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="lnbDelete" CommandArgument='<%#Eval("BookID") %>'
                                    CommandName="Delete" runat="server">
                                    <i class="icon-remove3"></i></asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>

