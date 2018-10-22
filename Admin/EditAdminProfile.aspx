<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EditAdminProfile.aspx.cs" Inherits="Admin_EditAdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%-- <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <h2>Manage Profile</h2>
    <br />--%>
    <div class="profile-env">
        <header class="row">
            <asp:Repeater ID="repImage" runat="server">
                <ItemTemplate>
                    <div class="col-sm-2">
                        <a href="#" class="profile-picture">
                            <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/images/AdminIMG/" + Eval("Image") %>' alt="" Height="150" class="img-responsive img-circle" />
                        </a>

                    </div>
                    <div class="col-sm-7">
                        <ul class="profile-info-sections">
                            <li>
                                <div class="profile-name">
                                    <strong>
                                        <a href="#"><%# Eval("Fullname") %></a>
                                    </strong>
                                    <span><a href="#">Photographer</a></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </header>
        <section class="profile-info-tabs">
            <div class="row">
                <div class="col-sm-offset-2 col-sm-10">

                    <!-- tabs for the profile links -->

                    <%--<ul class="nav nav-tabs bordered">
                        <li class="active"><a href="#About" data-toggle="tab">About</a></li>
                        <li><a href="#profile" data-toggle="tab">Change Profile</a></li>
                        <li><a href="#password" data-toggle="tab">Change Password</a></li>
                    </ul>--%>


                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-tabs bordered">
                                <!-- available classes "bordered", "right-aligned" -->
                                <li class="active">
                                    <a href="#home" data-toggle="tab">
                                        <span class="visible-xs"><i class="entypo-home"></i></span>
                                        <span class="hidden-xs">About</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#profile" data-toggle="tab">
                                        <span class="visible-xs"><i class="entypo-user"></i></span>
                                        <span class="hidden-xs">Profile Pic</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#messages" data-toggle="tab">
                                        <span class="visible-xs"><i class="entypo-mail"></i></span>
                                        <span class="hidden-xs">Change Password</span>
                                    </a>
                                </li>
                            </ul>
                            <br />
                            <br />
                            <div class="tab-content">
                                <div class="tab-pane active" id="home">
                                    <div role="form" class="form-horizontal ">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">User Name</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true" class="form-control" required placeholder="Enter Category Name" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Full Name</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtfullname" runat="server" class="form-control" required placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Email ID</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtEmailID" runat="server" class="form-control" required placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Address</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control" required placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Birth Date</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtDOB" runat="server" class="form-control " required placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Mobile</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" required placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-3">
                                                <asp:Button ID="btnAdd" runat="server" Text="UPDATE" OnClick="btnUpdate_Click" class="btn btn-success btn-lg col-md-5"></asp:Button>
                                                 
                                                     &nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" OnClick="btnCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="profile">
                                    <div role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Image Upload</label>
                                            <div class="col-sm-5">
                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                                        <asp:Image ID="imgPro" runat="server" ImageUrl="<%--Images/Admin_Default.png--%>" alt="..." />
                                                    </div>
                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                                    <div>
                                                        <span class="btn btn-white btn-file">
                                                            <span class="fileinput-new">Select image</span>
                                                            <span class="fileinput-exists">Change</span>
                                                            <%--<input type="file" name="..." accept="image/*">--%>
                                                            <asp:FileUpload ID="fuImage" runat="server" />
                                                        </span>
                                                        <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-3">
                                                <asp:Button ID="btnProUpdate" runat="server" Text="UPDATE" OnClick="btnProUpdate_Click" class="btn btn-success btn-lg col-md-5"></asp:Button>
                                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnProCancel" runat="server" Text="CANCEL" OnClick="btnProCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="messages">
                                    <div role="form" class="form-horizontal ">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Old Password</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtOld" runat="server" TextMode="Password" class="form-control" placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">New Password</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtNew" runat="server" TextMode="Password" class="form-control" placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Confirm Password</label>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" class="form-control" placeholder="Enter Category Name" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-3">
                                                <asp:Button ID="btnUpPass" runat="server" Text="UPDATE" OnClick="btnUpPass_Click" class="btn btn-success btn-lg col-md-5"></asp:Button>
                                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpCancel" runat="server" Text="CANCEL" OnClick="btnUpCancel_Click" class="btn btn-warning btn-lg"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>



    <%--<script>
        //<![CDATA[
        var theForm = document.forms['form1'];
        if (!theForm) {
            theForm = document.form1;
        }
        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
        //]]>
    </script>--%>
</asp:Content>

