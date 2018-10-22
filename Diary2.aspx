<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Diary2.aspx.cs" Inherits="Diary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dairy</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- page main wrapper -->
    <div id="main-content" class="blog-list">
        <!-- attention to the classname -->
        <div class="page-wrapper regular-page">
            <div class="container">

                <!-- page title -->
                <div class="row mb-medium">

                    <div class="col-md-2"></div>
                    <div class="col-md-8 section">
                        <h2 class="section-title double-title">Dairy
                        </h2>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <!--/ page title -->

                <asp:Repeater ID="repDiary" runat="server" OnItemDataBound="repDiary_ItemDataBound">
                    <ItemTemplate>
                        <div class="row mb-large">
                            <div class="col-md-2"></div>
                            <!-- main blog list content -->
                            <div class="col-md-8">
                                <!-- single post [with image] -->
                                <div class="post">

                                    <div class="post-thumb" align="center">
                                        <a href="DairyInfo.aspx?id=<%#Eval("BlogID") %>" target="_blank">
                                            <asp:HiddenField  ID="hf" runat="server" Value='<%#Eval("BlogID") %>' />
                                            <img src='<%# "images/BlogImages/" + Eval("BlogImage") %>' alt="img" class="img-responsive">
                                        </a>
                                    </div>

                                    <div class="post-content">
                                        <div class="post-content-wrapper">

                                            <h2 class="post-header lined">
                                                <a href="DairyInfo.aspx?id=<%#Eval("BlogID") %>" target="_blank"><%#Eval("BlogTitle") %></a>
                                            </h2>

                                            <div class="post-meta">
                                                <span class="date-span">
                                                    <i class="fa fa-lg fa-clock-o"></i>
                                                    <%# Convert.ToDateTime(Eval("CreateDate")).ToString("dd-MMM-yyyy") %>
                                                </span>
                                                <span class="comments-cat">
                                                    <i class="fa fa-lg fa-folder"></i>
                                                    <%# Eval("CatName") %>
                                                </span>
                                                <asp:Repeater ID="rpcom" runat="server">
                                                    <ItemTemplate>
                                                        <span class="comments-span">
                                                            <i class="fa fa-lg fa-comments"></i>
                                                            <%# Eval("co") %> comments
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="rpLike" runat="server">
                                                    <ItemTemplate>
                                                        <span class="comments-span">
                                                            <i class="fa fa-lg fa-thumbs-up"></i>
                                                            <%# Eval("cl") %> Likes
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="post-main-content">
                                                <p><%#Eval("BlogDesc") %></p>
                                                <div class="post-read-more">
                                                    <a href="DairyInfo.aspx?id=<%#Eval("BlogID") %>" target="_blank" class="btn btn-toranj">Read more</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <!--/ single post [with image] -->
                                <br />
                            </div>
                            <!-- /main blog list content -->

                            <div class="col-md-2"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="row">

                    <div class="col-md-2"></div>
                    <div class="col-md-8 section">

                        <!-- blog navigation -->
                        <hr />
                        <div id="post-nav">
                            <asp:Button ID="btnPrev" Text="Previous" runat="server" OnClick="btnPrev_Click" class="prev-post btn btn-lg btn-simple" />
                            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" class="prev-post btn btn-lg btn-simple pull-right" />
                        </div>
                        <!--/ blog navigation -->

                        <!-- back to top -->
                        <a class="back-to-top" href="#"></a>
                        <!-- back to top -->

                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page main wrapper -->
</asp:Content>
