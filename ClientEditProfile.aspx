<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="ClientEditProfile.aspx.cs" Inherits="ClientEditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3>Profile page <small>User profile page layout</small></h3>
        </div>
    </div>

    <!-- Page tabs -->
    <div class="tabbable page-tabs">
        <ul class="nav nav-pills nav-justified">

            <li class="active"><a href="#settings" data-toggle="tab"><i class="icon-cogs"></i>General Settings</a></li>
            <li><a href="#pass" data-toggle="tab"><i class="icon-stats2"></i>Password<i class="icon-spinner7 spin pull-right"></i></a></li>
        </ul>
        <div class="tab-content">
            <!-- First tab -->
            <div class="tab-pane active fade in" id="settings">
                <!-- Profile information -->
                <%--<form action="#" class="block" role="form">--%>
                <h6 class="heading-hr"><i class="icon-user"></i>General Setting:</h6>
                <div class="block-inner">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full name</label>
                                <asp:TextBox ID="txtFullName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmailID" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Phone</label>
                                <%--<input type="text" value="+99-99-9999-9999" data-mask="+99-99-9999-9999" class="form-control">--%>
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Profile Picture:</label>
                                <asp:FileUpload ID="fvPro" runat="server" class="styled form-control" />
                                <%--<input type="file" class="styled form-control" id="File1">--%>
                                <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                            </div>
                            <div class="col-md-6">
                                <label>BirthDate</label>
                                <asp:TextBox ID="txtDOB" runat="server" class="form-control datepicker"></asp:TextBox>
                                <%--<input type="date" class="form-control">--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Gender</label>
                                <div class="radio">
                                    <label>
                                        <asp:RadioButton ID="rdbM" runat="server" class="styled" GroupName="Gender" />
                                        <%--<input type="radio" name="visibility" class="styled" checked="checked">--%>
                                        Male
												
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <asp:RadioButton ID="rdbF" runat="server" class="styled" GroupName="Gender" />
                                        Female
												
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Master Password:</label>
                                <asp:TextBox ID="txtMasterPass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="text-center">
                            <asp:Button ID="btnCancel1" Text="Cancel" runat="server" class="btn btn-default" />
                            <asp:Button ID="btnApply1" Text="Apply" runat="server" class="btn btn-success" OnClick="btnApply1_Click" />
                            <%-- <input type="reset" value="Cancel" class="btn btn-default">
                            <input type="submit" value="Apply changes" class="btn btn-success">--%>
                        </div>
                    </div>
                </div>
                <%--</form>--%>
                <!-- /profile information -->
            </div>
            <!-- First tab -->

            <!-- Second tab -->
            <div class="tab-pane fade" id="pass">
                <!-- Profile information -->
                <%-- <form action="#" class="block" role="form">--%>
                <h6 class="heading-hr"><i class="icon-user"></i>Password Setting:</h6>
                <div class="block-inner">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Current Password</label>
                                <asp:TextBox ID="txtCurrPass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Enter New Password</label>
                                <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Re-Enter New Password</label>
                                <asp:TextBox ID="txtReNewPass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="text-left">
                        <asp:Button ID="btnCancelpass" Text="Cancel" OnClick="btnCancelpass_Click" runat="server" class="btn btn-default" />
                        <asp:Button ID="btnApplypass" Text="Apply" OnClick="btnApplypass_Click" runat="server" class="btn btn-success" />

                    </div>
                </div>
                <%--</form>--%>
                <!-- Second tab -->
            </div>
        </div>
        <!-- /page tabs -->
</asp:Content>

