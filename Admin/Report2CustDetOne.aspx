<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Report2CustDetOne.aspx.cs" Inherits="Admin_Report2CustDetOne" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>FI Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb bc-3">
        <li></li>
    </ol>
    <div class="row">
        <div class="col-sm-12">
            <div class="tile-title tile-primary">
                <div class="icon">
                    <asp:Image ID="img" runat="server" ImageUrl="~/images/Logo/Logo1.png" />
                    <%--<i class="glyphicon glyphicon-leaf"></i>--%>
                </div>

                <div class="title">
                    <h3>FIRST IMPRESSION STUDIO</h3>
                   <%-- <p>so far in our blog, and our website.</p>--%>
                    <br />
                </div>
            </div>
        </div>
    </div>
    
     <blockquote>
        <p>
            <h2><strong>CUSTOMER INFORMATION</strong></h2>
            <br />
        </p>
    </blockquote>

    <div class="row">
        <div class="col-md-10">
            <div class="col-md-5">
                <asp:DropDownList ID="drpCust" runat="server" class="form-control select2" Font-Size="Medium">
                </asp:DropDownList>
            </div>
            <div class="col-md-5">
                <asp:Button ID="btnRP" runat="server" Text="GENERATE REPORT" OnClick="btnRP_Click" class="btn btn-success btn-lg" />
            </div>
        </div>
    </div>
</asp:Content>

