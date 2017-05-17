<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-4 col-md-4"></div>
    <div class="col-sm-4 col-md-4">
        <h2>欢迎登录</h2>
        <div class="form-group">
           <asp:Label ID="Label1" runat="server" Text="账号：" CssClass="col-sm-4 control-label"></asp:Label>
           <div class="col-sm-8">
           <asp:TextBox runat="server" ID="UserNameTextBox" CssClass="form-control"></asp:TextBox>
           </div>
        </div>
        <div class="form-group">
           <asp:Label ID="Label2" runat="server" Text="密码：" CssClass="col-sm-4 control-label"></asp:Label>
           <div class="col-sm-8">
           <asp:TextBox runat="server" ID="UserPwdTextBox" CssClass="form-control"></asp:TextBox>
           </div>
        </div>
        <div class="form-group">
                <div class="col-sm-6">
                <asp:Button runat="server" ID="LoginBtn" Text="登录" OnClick="LoginBtn_Click" CssClass="btn btn-success"/>
                </div>
                <div class="col-sm-6">
                    <asp:Button runat="server" ID="RegisterBtn" Text="注册" OnClick="RegisterBtn_Click" CssClass="btn btn-warning"/>
                </div>
        </div>
     </div>
    <div class="col-sm-4 col-md-4"></div>
</asp:Content>

