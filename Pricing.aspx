<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Pricing.aspx.cs" Inherits="Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Pricing</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="main-content">
        <div class="page-wrapper regular-page">
            <div class="container">

                <h2 class="section-title double-title">
                    <span>Fi Studio</span>Pricing
					</h2>

                <div class="row mb-xlarge">
                    <div class="col-md-12">
                        <div class="call-to-action">
                            <div class="row">
                                <div class="col-md-3">
                                    <h2 class="action-title">Select Category</h2>
                                </div>
                                <div class="col-md-6">
                                    <h2 class="action-title">
                                        <asp:DropDownList ID="drpCat" AutoPostBack="true" class="form-control" OnSelectedIndexChanged="drpCat_SelectedIndexChanged" runat="server">
                                        </asp:DropDownList></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row mb-xlarge">
                    <div class="team-members">
                        <asp:Repeater ID="rpPrice" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">

                                   
                                    <div class="team-head">
                                        <asp:Image ID="img" runat="server" ImageUrl='<%# "~/images/PricingImage/" + Eval("DefImage") %>'  />

                                    </div>
                                  <br />
                                       
                                    <div class="team-content">
                                        <div class="container">
                                            <div class="row mb-medium">
                                                <div class="col-md-4">
                                                    <h4 class="lined"><%# Eval("SubCatName") %></h4>
                                                    <ul class="list-iconed-circle">
                                                       <li><i class="fa fa-share"></i><%# Eval("Price") %></li>
                                                        <li><i class="fa fa-share"></i><%# Eval("LocationHour") %></li>
                                                        <li><i class="fa fa-share"></i><%# Eval("OutfitChange") %></li>
                                                        <li><i class="fa fa-share"></i><%# Eval("ImagesCapt") %></li>
                                                        <li><i class="fa fa-share"></i><%# Eval("EditedImage") %></li>
                                                        <li><i class="fa fa-share"></i><%# Eval("Description") %></li>
                                                         <asp:Button ID="btnSubmit" Text="BOOK NOW" runat="server" OnClick="btnSubmit_Click" class="btn btn-toranj btn-block" />
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                       
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>


                </div>





            </div>
        </div>
    </div>
</asp:Content>

