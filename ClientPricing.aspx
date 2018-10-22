<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="ClientPricing.aspx.cs" Inherits="ClientPricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel-body">
        <div class="bg-primary with-padding block-inner">
            <h4 style="text-align: center; font-weight: 100;">View All Pricing</h4>
        </div>
    </div>

   

    <div class="form-group">
        <label class="col-sm-2 control-label">Choose Category : </label>
        <div class="col-sm-10">
            <asp:DropDownList ID="drpcat" class="select-search" AutoPostBack="true"
                OnSelectedIndexChanged="drpcat_SelectedIndexChanged" runat="server" />
        </div>
    </div>
       
    <br />
    <br />
    <br />
    <br />

    <div class="row block-inner">
        <asp:Repeater ID="rpPrice" runat="server">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="well">
                        <div class="panel panel-primary">


                            <div class="panel-heading">
                                <h4 class="panel-title"><%# Eval("SubCatName") %><i class="icon-menu4"></i></h4>
                            </div>
                            <ul class="message-list">
                                <%--<li class="message-list-header">Developers</li>--%>

                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("Price") %></h6>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("LocationHour") %></h6>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("OutfitChange") %></h6>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("ImagesCapt") %></h6>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("EditedImage") %></h6>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <h6><%# Eval("Description") %></h6>
                                        </div>

                                    </div>
                                </li>
                                 <asp:Button ID="btnSubmit" Text="BOOK NOW" runat="server" OnClick="btnSubmit_Click" class="btn btn-toranj btn-block" />


                            </ul>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

