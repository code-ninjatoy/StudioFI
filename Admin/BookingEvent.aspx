<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="BookingEvent.aspx.cs" Inherits="Admin_BookingEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Booking Event</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-dark" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Send Mail
                    </div>
                </div>

                <div class="panel-body">
                    <div role="form" class="form-horizontal ">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">UserName</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtUname" runat="server" class="form-control" required placeholder="Enter Category Name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">EmailID</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtEmailID" runat="server" class="form-control" required placeholder="Enter Category Price" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-2" class="col-sm-3 control-label">Description</label>

                            <div class="col-sm-5">
                                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="6" class="form-control" required placeholder="Enter Category Price" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-3">
                                <asp:Button ID="btnSend" runat="server" Text="SEND" OnClick="btnSend_Click" class="btn btn-success btn-lg col-md-5"></asp:Button>
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
                        Booking Records
                    </div>
                </div>
                <div class="panel-body">
                    <div role="form" class="form-horizontal">
                        <table class="table table-bordered datatable" id="table-1">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Package</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>MailSent</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpBooking" runat="server" OnItemCommand="rpBooking_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%#Container.ItemIndex + 1 %>' /></td>
                                            <td>
                                                <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("UserName") %>' /></td>
                                            <td>
                                                <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/UserImages/" + Eval("ProfilePic") %>' Height="50px" Width="50px" /></td>
                                            <td>
                                                <asp:Label ID="lblcat" runat="server" Text='<%#Eval("CatName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblSubCat" runat="server" Text='<%#Eval("SubCatName") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("BookDesc") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblDate" runat="server" Text='<%#Eval("bd") %>' /></td>
                                            <td>
                                                <asp:Label ID="lblMail" runat="server" Text='<%#Eval("MailSent") %>' />
                                                <asp:LinkButton ID="lnkMail" CommandArgument='<%#Eval("BookID") %>' CommandName="Mail" runat="server" class="btn-success btn"><i class="entypo-mail"></i>&nbsp;&nbsp;Mail</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("BookStatus") %>' />
                                                <asp:LinkButton ID="lnbFinish" CommandArgument='<%#Eval("BookID") %>' CommandName="Finish" runat="server" class="btn-success btn"><i class="entypo-cancel"></i>&nbsp;&nbsp;Finish</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>NO</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Package</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>P/F</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
