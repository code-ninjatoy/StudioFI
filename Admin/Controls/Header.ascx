<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Admin_Controls_Header" %>

<div class="row">

    <!-- Profile Info and Notifications -->

    <div class="col-md-6 col-sm-8 clearfix">

        <ul class="user-info pull-left pull-none-xsm">

            <!-- Profile Info -->
            <li class="profile-info dropdown">
                <!-- add class "pull-right" if you want to place this from right -->
                 <asp:Repeater ID="repImage" runat="server">
                    <ItemTemplate>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/images/AdminIMG/" + Eval("Image") %>' alt="" class="img-circle" Width="50"/>
				    <%# Eval("Fullname") %>
				</a>
                </ItemTemplate>
                </asp:Repeater>
                <%--<ul class="dropdown-menu">

                    <!-- Reverse Caret -->
                    <li class="caret"></li>

                    <!-- Profile sub-links -->
                    <li>
                        <a href="extra-timeline.html">
                            <i class="entypo-user"></i>
                            Edit Profile
						</a>
                    </li>

                    <li>
                        <a href="mailbox.html">
                            <i class="entypo-mail"></i>
                            Inbox
						</a>
                    </li>

                    <li>
                        <a href="extra-calendar.html">
                            <i class="entypo-calendar"></i>
                            Calendar
						</a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="entypo-clipboard"></i>
                            Tasks
						</a>
                    </li>
                </ul>--%>
            </li>

        </ul>

    </div>
    <div class="col-md-6 col-sm-4 clearfix hidden-xs">

        <ul class="list-inline links-list pull-right">
            <li class="sep"></li>
            <li>

                <asp:LinkButton ID="lnklogout" runat="server" ForeColor="Black" OnClick="lnklogout_Click">
                   Logout <i class="entypo-logout right"></i>
                </asp:LinkButton>
                <%--<a href="LogoutPG.aspx">Log Out <i class="entypo-logout right"></i></a>--%>
            </li>
        </ul>

    </div>


    <!-- Raw Links -->


</div>
