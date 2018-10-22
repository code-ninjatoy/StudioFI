<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.master" AutoEventWireup="true" CodeFile="DeactivateAcc.aspx.cs" Inherits="DeactivateAcc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Deactivation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div class="page-header">
        <div class="page-title">
            <h3>Deactivate Account</h3>
        </div>
    </div>

    <div class="form-horizontal" role="form">
        <!-- Basic inputs -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title"><i class="icon-bubble4"></i>Deactivation Process</h6>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Enter Current Password : </label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtpass" class="form-control" TextMode="Password" runat="server" placeholder="Enter Password" />
                    </div>
                </div>

                <div class="form-actions text-center">
                    <asp:Button ID="btnDeactivate" OnClick="btnDeactivate_Click" class="btn btn-primary pull-left btn-lg" Text="Deactivate" runat="server" />
                </div>
            </div>
        </div>
        <!-- /basic inputs -->
    </div>

</asp:Content>

