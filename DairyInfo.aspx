<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="DairyInfo.aspx.cs" Inherits="DairyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dairy Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page main wrapper -->
    <div id="main-content">
        <div class="page-wrapper">
            <div id="blog-single">
                <asp:Repeater ID="repImage" runat="server">
                    <ItemTemplate>
                        <!-- Post header -->
                        <div id="post-header" class="parallax-parent">
                            <!-- Header image -->
                            <div class="header-cover set-bg">
                                <img src='<%# "images/BlogImages/" + Eval("BlogImage") %>' alt="">
                            </div>
                            <!-- /Header image -->

                            <%--<!-- Header content -->
                    <div class="header-content tj-parallax" data-ratio="1">
                        <div class="container">
                            <h1 class="post-title">Do you think water moves fast? you should see the ice
								</h1>
                        </div>
                    </div>
                    <!-- /Header content -->--%>
                        </div>
                        <!-- /Post header -->
                    </ItemTemplate>
                </asp:Repeater>

                <div class="container">
                    <!-- Post body -->
                    <div id="post-body">
                        <div class="row">
                            <!-- Post sidebar -->
                            <div id="post-side" class="col-md-2">
                                <asp:Repeater ID="repUser" runat="server">
                                    <ItemTemplate>
                                        <!-- Post meta -->
                                        <div class="post-meta">
                                            <div class="post-author-image">
                                                <img src='<%# "images/UserImages/" + Eval("ProfilePic") %>' height="120px" width="120px" alt="">
                                            </div>
                                            <div class="post-meta-inner">
                                                <div class="post-author-name"><i class="fa fa-pencil-square-o list-icon"></i><%#Eval("UserName") %></div>
                                                <div class="post-date"><i class="fa fa-calendar-o list-icon"></i><%# Convert.ToDateTime(Eval("CreateDate")).ToString("dd-MMM-yyyy") %></div>
                                            </div>
                                        </div>
                                        <!-- /Post meta -->
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <!-- /Post sidebar -->

                            <!-- Post main area -->
                            <div class="col-md-10">
                                <asp:Repeater ID="repBlog" runat="server">
                                    <ItemTemplate>
                                        <!-- Post Content -->
                                        <div id="post-content">

                                            <h1><%#Eval("BlogTitle") %></h1>
                                            <p>
                                                <%#Eval("BlogDesc") %>
                                            </p>
                                        </div>
                                        <!-- /Post Content -->
                                    </ItemTemplate>
                                </asp:Repeater>

                                <!-- Post Navigation -->
                                 <div id="post-nav">
                                     <asp:LinkButton ID="btnLike" Visible="false" runat="server" OnClick="btnLike_Click" class="btn btn-simple">
                                         <i class="fa fa-thumbs-up">&nbsp;&nbsp;Like</i>
                                     </asp:LinkButton>
                                    <%--<a class="prev-post btn btn-lg btn-simple" href="#">Prev</a>--%>
                                    <%--<a class="prev-post btn btn-lg btn-simple pull-right" href="#">Next</a>--%>
                                </div>
                                <!-- /Post Navigation -->

                                <!-- Post Comments -->
                                <div id="post-comments">
                                    <h2 class="lined">Comments</h2>
                                    <asp:Repeater ID="rpCmnt" runat="server">
                                        <ItemTemplate>
                                            <ul id="comment-list">
                                                <li>
                                                    <div class="author-image">
                                                        <asp:Image ID="img1" runat="server" ImageUrl='<%# "images/UserImages/" + Eval("ProfilePic") %>' />
                                                        <%--<img src="assets/img/blog/04.jpg" alt="">--%>
                                                    </div>
                                                    <div class="comment-body">
                                                        <div class="comment-meta">
                                                            <ul>
                                                                <li class="author-name">
                                                                    <%# Eval("UserName") %>
                                                                    <span>-</span></li>
                                                                <li>
                                                                    <%# Eval("CreateDate") %>
                                                                    <span>-</span></li>
                                                                <%--<li><a href="#">Reply</a></li>--%>
                                                            </ul>
                                                        </div>
                                                        <div class="comment-content">
                                                            <p>
                                                                <%# Eval("CommnetDesc") %>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <%--<li>
                                            <div class="author-image">
                                                <img src="assets/img/blog/02.jpg" alt="">
                                            </div>
                                            <div class="comment-body">
                                                <div class="comment-meta">
                                                    <ul>
                                                        <li class="author-name">Admin<span>-</span></li>
                                                        <li>12 May 2014<span>-</span></li>
                                                        <li><a href="#">Reply</a></li>
                                                    </ul>
                                                </div>
                                                <div class="comment-content">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
													
                                                    </p>
                                                </div>
                                            </div>
                                        </li>--%>
                                                <%--<li>
                                            <div class="author-image">
                                                <img src="assets/img/blog/01.jpg" alt="">
                                            </div>
                                            <div class="comment-body">
                                                <div class="comment-meta">
                                                    <ul>
                                                        <li class="author-name">Admin<span>-</span></li>
                                                        <li>12 May 2014<span>-</span></li>
                                                        <li><a href="#">Reply</a></li>
                                                    </ul>
                                                </div>
                                                <div class="comment-content">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
													
                                                    </p>
                                                </div>
                                            </div>
                                        </li>--%>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <div id="comment-form">
                                        <asp:Panel ID="pnlComment" runat="server" Visible="false">
                                            <h2 class="lined">Leave a Comment</h2>
                                            <form action="#" method="post" id="commentform" class="comment-form">
                                                <%--<div class="row row-inputs">
                                                <div class="col-md-10 col-sm-6">
                                                    <input class="form-control" type="text" name="author" id="author" value="" placeholder="Name" aria-required="true">
                                                    <asp:TextBox ID="txtEmailID" required runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                                </div>

                                                <div class="col-md-4 col-sm-6">
                                                    <input class="form-control" type="text" name="email" id="email" value="" placeholder="Email" aria-required="true">
                                                </div>

                                                <div class="col-md-4 col-sm-12">
                                                    <input class="form-control" type="text" name="url" id="url" value="" placeholder="Website" aria-required="true">
                                                </div>
                                          </div>--%>
                                                <div class="row row-inputs">
                                                    <div class="col-md-10">
                                                        <%--<textarea class="form-control" id="comment" name="comment" rows="8" placeholder="Comment" aria-required="true"></textarea>--%>
                                                        <asp:TextBox ID="txtComment" Height="100px" runat="server" class="form-control" required TextMode="MultiLine" placeholder="Comment"></asp:TextBox>
                                                        <br />
                                                        <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" runat="server" class="btn btn-toranj btn-lg pull-right" />
                                                    </div>
                                                </div>
                                            </form>
                                        </asp:Panel>

                                        <%--<input class="btn btn-toranj btn-lg pull-right" name="submit" type="submit" id="submit" value="Post">--%>
                                    </div>

                                </div>
                                <!-- /Post Comments -->

                            </div>
                            <!-- /Post main area -->

                        </div>
                    </div>
                    <!-- /Post body -->
                </div>
            </div>
        </div>
    </div>
    <!-- /Page main wrapper -->
</asp:Content>

