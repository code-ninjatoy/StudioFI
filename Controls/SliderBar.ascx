<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SliderBar.ascx.cs" Inherits="Controls_SliderBar" %>

<!-- Grid filter -->
<div class="fixed-filter">
    <%--<a href="#" class="select-filter">
        <i class="fa fa-filter"></i>Welcome Guest</a>--%>
    <asp:LinkButton ID="Button1" BackColor="#23241F" CssClass="fa fa-filter btn btn-black" BorderColor="#23241F" Style="z-index: 1; padding-right: 50px; position: relative;" ForeColor="White" runat="server" Text="&nbsp;LOGIN" OnClick="Button1_Click"></asp:LinkButton>
    <asp:LinkButton ID="Button2" BackColor="#23241F" CssClass="fa fa-filter btn btn-black" BorderColor="#23241F" Style="z-index: 1; padding-right: 50px; padding-bottom: 10px; position: relative;" ForeColor="White" runat="server" Text="&nbsp;REGISTRATION" OnClick="Button2_Click"></asp:LinkButton>
    <br />
    <%--<ul class="grid-filters">
        <li>

            <a href="Login.aspx">Login</a>
        </li>
        <li>
            
        </li>

    </ul>--%>
</div>
<!-- /Grid filter -->
<!--Page main wrapper -->
<div id="main-content" class="abs dark-template">
    <div class="kb-slider">
        <asp:Repeater ID="rep1" runat="server">
            <ItemTemplate>

                <%-- <div class="fixed-filter">
                    <a href="Login.aspx" class="btn btn-transparent btn-lg">Login</a>
                    <a href="Registration.aspx" class="btn btn-transparent btn-lg">Registration</a>
                </div>--%>
                <div class="item">
                    <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/CoverIMG/" + Eval("CoverImg")%>' />
   
                    <div class="caption" data-pos="bottom-left">
                        <span class="sub-title"><%#Eval("TeamName") %></span>
                        <br />
                        <span class="title"><%#Eval("CoverDesc") %></span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<!--/Page main wrapper -->
