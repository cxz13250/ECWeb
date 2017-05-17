<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" style="background-color: #00FFFF">
    <center style="font-size: x-large; background-color: #00FFFF;">个人信息显示</center><br>
    <center>用户真实姓名:&nbsp; <asp:Label ID="TnameLabel" runat="server" Text=""></asp:Label></center> <br />
      
        <center> 性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="SexLabel" runat="server" Text=""></asp:Label></center><br />
            
        <center> 电话:&nbsp;&nbsp;&nbsp; <asp:Label ID="UsetTellLabel" runat="server" Text=""></asp:Label></center> <br />
        <center>地址： &nbsp;&nbsp;  <asp:Label ID="UadressLabel" runat="server" Text=""></asp:Label></center>      
        <br />
        
        <center>邮编:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="CodeLabel" runat="server" Text=""></asp:Label></center> 
        <br />
        <center>E-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="EmailLabel" runat="server" Text=""></asp:Label></center> 
        <br />
        <br />
      <center>
        <asp:Button ID="Button2" runat="server" onclick="Button1_Click" Text="修改" 
              Height="30px" Width="60px" />&nbsp;&nbsp;&nbsp;
        <a href='javascript:history.back()'  style="height:30px;width:60px">返回</a>
        </center>
    </div>
</asp:Content>

