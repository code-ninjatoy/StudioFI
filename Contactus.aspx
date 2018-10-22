<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Contact US</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page main wrapper-->
    <div id="main-content">
        <div class="page-wrapper regular-page">
            <div class="container">
                <!-- page title -->
                <h2 class="section-title double-title">
                    <span></span>Contact us
                </h2>
                <!--/ page title -->
                <%--<asp:Repeater ID="rpDetails" runat="server">
                    <ItemTemplate>
                        <!-- google map, the attribute id="gmap" is required -->
                        <div class="row mb-large">
                            <div class="col-md-12">
                                <div id="gmap" data-address='<%# Eval("Address") %>' ></div>
                            </div>
                        </div>
                        <div class="row mb-large">
                            <div class="col-md-4">
                                <h3 class="lined allcaps">adresses</h3>
                                <ul class="list-iconed">
                                    <li><i class="fa fa-user"></i>Name : <%# Eval("Fullname") %></li>
                                    <li><i class="fa fa-envelope"></i>Email ID : <%# Eval("EmailID") %></li>
                                    <li><i class="fa fa-phone"></i>Phone: <%# Eval("Phone") %></li>
                                    <li><i class="fa fa-map-marker"></i><%# Eval("Address") %></li>
                                </ul>
                            </div>
                            <div class="col-md-8">
                                <h3 class="lined allcaps">How to contact</h3>
                                <p>
                                    U have to register for book a shoot. Fill the details in registration form.
                            and then login in to your profile and book ur shoot.
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>--%>
                <asp:Repeater ID="rpDetails" runat="server">
                    <ItemTemplate>
                        <!-- google map, the attribute id="gmap" is required -->
                        <div class="row mb-large">
                            <div class="col-md-12">
                                <div id="gmap" data-address="<%# Eval("Address") %>"></div>
                            </div>
                        </div>
                        <div class="row mb-large">
                            <div class="col-md-4">
                                <%--<h3 class="lined allcaps">adresses</h3>--%>
                                <ul class="list-iconed">
                                    <li><i class="fa fa-user"></i>Name : <%# Eval("Fullname") %></li>
                                    <li><i class="fa fa-envelope"></i>Email ID : <%# Eval("EmailID") %></li>
                                    <li><i class="fa fa-phone"></i>Phone: <%# Eval("Phone") %></li>
                                    <li><i class="fa fa-map-marker"></i><%# Eval("Address") %></li>
                                </ul>
                            </div>
                            <div class="col-md-8">
                                <h3 class="lined allcaps">How to contact</h3>
                                <p>
                                    U have to register for book a shoot. Fill the details in registration form.
                            and then login in to your profile and book ur shoot.
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="row mb-large">

                    <div class="col-md-6">
                        <h3 class="lined allcaps">Contact form</h3>
                        <form action="http://owwwlab.com/toranj/demo-2/php/contact.php" method="post" id="contact-form">
                            <!-- do not change the id attribute -->


                            <%--<input class="form-control requiredField" type="text" name="author" id="author" value="" placeholder="Name" aria-required="true">--%>
                            <asp:TextBox ID="txtName" runat="server" class="form-control requiredField"
                                placeholder="Name" required></asp:TextBox>
                            <br />
                            <asp:TextBox ID="txtEmailID" runat="server" class="form-control requiredField"
                                placeholder="Email ID" required></asp:TextBox>
                            <br />
                            <%--<input class="form-control requiredField" type="text" name="email" id="email" value="" placeholder="Email" aria-required="true">
                            <br />
                            <input class="form-control requiredField" type="text" name="url" id="url" value="" placeholder="Website" aria-required="true">
                            <br />--%>
                            <asp:TextBox ID="txtFeedBack" runat="server" required TextMode="MultiLine" Rows="8"
                                class="form-control requiredField" placeholder="Your Feedback"></asp:TextBox>
                            <br />
                            <%--<textarea class="form-control requiredField" id="comment" name="comment" rows="8" placeholder="Comment" aria-required="true"></textarea>
                            <br />--%>
                            <%--<input class="btn btn-toranj pull-right" name="submit" type="submit" id="submit" value="Send">--%>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-toranj pull-right" />
                        </form>
                    </div>

                    <div class="col-md-6">
                        <h3 class="lined allcaps">FAQ</h3>
                        <div class="accordion">
                            <asp:Repeater ID="rpFAQ" runat="server">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="head">
                                            <a href="#"><%# Eval("Question") %></a>
                                        </div>
                                        <div class="body">
                                            <div class="contents">
                                                <%--<strong>Some Content</strong>--%>
                                                <%# Eval("Answer") %>
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="item">
                                <div class="head">
                                    <a href="#">How to apply for a job?</a>
                                </div>
                                <div class="body">
                                    <div class="contents">
                                        <strong>Some Content</strong>
                                        <br>
                                        There are dozens of us! Dozens! That's my son, you pothead! So Ann, the question is, do you want a man or a boy? I know how I would answer
									
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="head">
                                    <a href="#">Do we work abroud?</a>
                                </div>
                                <div class="body">
                                    <div class="contents">
                                        <strong>Some Content</strong>
                                        <br>
                                        There are dozens of us! Dozens! That's my son, you pothead! So Ann, the question is, do you want a man or a boy? I know how I would answer
									
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="head">
                                    <a href="#">How to get a quote?</a>
                                </div>
                                <div class="body">
                                    <div class="contents">
                                        <strong>Some Content</strong>
                                        <br>
                                        There are dozens of us! Dozens! That's my son, you pothead! So Ann, the question is, do you want a man or a boy? I know how I would answer
									
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="head">
                                    <a href="#">How to get a quote?</a>
                                </div>
                                <div class="body">
                                    <div class="contents">
                                        <strong>Some Content</strong>
                                        <br>
                                        There are dozens of us! Dozens! That's my son, you pothead! So Ann, the question is, do you want a man or a boy? I know how I would answer
									
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="head">
                                    <a href="#">How to get a quote?</a>
                                </div>
                                <div class="body">
                                    <div class="contents">
                                        <strong>Some Content</strong>
                                        <br>
                                        There are dozens of us! Dozens! That's my son, you pothead! So Ann, the question is, do you want a man or a boy? I know how I would answer
									
                                    </div>
                                </div>
                            </div>--%>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <hr />
                <a class="back-to-top" href="#"></a>
            </div>
        </div>
    </div>
    <!--/Page main wrapper-->
</asp:Content>

