<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-4">
    </div>
    <div class="col-sm-4">
    <center style="font-size: x-large">欢迎注册</center><br/>
    <div class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label">用户名：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label2" runat="server" CssClass="col-sm-4 control-label">密码：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UserPwd" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label3" runat="server" CssClass="col-sm-4 control-label">真实姓名：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="TrueName" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label4" runat="server" CssClass="col-sm-4 control-label">性别：</asp:Label>
    <div class="col-sm-8">
    <asp:DropDownList ID="UserSex" runat="server" Height="24px" Width="88px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label5" runat="server" CssClass="col-sm-4 control-label">电话：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UserTell" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label6" runat="server" CssClass="col-sm-4 control-label">地址：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="UserAddr" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label">邮编：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="Code" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label8" runat="server" CssClass="col-sm-4 control-label">E-mail：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label9" runat="server" CssClass="col-sm-4 control-label">密码问题：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="Question" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label10" runat="server" CssClass="col-sm-4 control-label">密码答案：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="Answer" runat="server" CssClass="form-control"></asp:TextBox>
    </div></div>
    <div class="form-group">
    <asp:Label ID="Label11" runat="server" CssClass="col-sm-4 control-label">验证码：</asp:Label>
    <div class="col-sm-8">
    <asp:TextBox ID="tbx_yzm" runat="server" CssClass="form-control" style="width:100px"></asp:TextBox>
    <asp:ImageButton ID="ibtn_yzm" runat="server" />
    <a href="javascript:changeCode()" style="text-decoration: underline; font-size:10px;">换一张</a>
    <script type="text/Javascript">
        function changeCode() {
            document.getElementById('ibtn_yzm').src = document.getElementById('ibtn_yzm').src + '?';
        }
    </script>
    </div></div>
    <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
      <div class="col-sm-6">
      <asp:Button ID="Button2" runat="server" Text="注册" 
                onclick="Registrbtn_Click" CssClass="btn btn-success"/>
      </div>
      <div class="col-sm-6">
      <asp:Button ID="Button3" runat="server" CausesValidation="False" 
                onclick="Button1_Click" Text="返回" CssClass="btn btn-warning"/>
      </div>
    </div>
    </div>
    </div>
    <div class="col-sm-4">
    </div>
</asp:Content>

