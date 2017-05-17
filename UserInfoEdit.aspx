<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserInfoEdit.aspx.cs" Inherits="UserInfoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
<center style="font-size: x-large;">修改个人信息</center><br/>
    <div class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label">真实姓名:</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="TnameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label3" runat="server" CssClass="col-sm-4 control-label">性别:</asp:Label>
    <div class="col-sm-8">
    <asp:DropDownList ID="SexDropDownList" runat="server" Width="148px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label4" runat="server" CssClass="col-sm-4 control-label">电话: </asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UserTellTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label5" runat="server" CssClass="col-sm-4 control-label">地址: </asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UaddressTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label6" runat="server" CssClass="col-sm-4 control-label">邮编: </asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="CodeTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label">E-mail: </asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
      <div class="col-sm-6">
      <asp:Button ID="CheckUserInfo" runat="server" Text="确认" 
                onclick="CheckUserInfo_Click"  CssClass="btn btn-success"/>
      </div>
      <div class="col-sm-6">
      <a href="javascript:history.back()" class="btn btn-warning">返回</a>
      </div>
    </div>
    </div>
  </div>
  </div>    
  </div>
    <div class="col-sm-4"></div>
</asp:Content>

