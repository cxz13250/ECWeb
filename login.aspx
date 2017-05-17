<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        div#container{background-color:white;}
        div#header{text-align:center;width:100%; height:15%; overflow:hidden; margin:0; padding:0;}
        div#login{width:1200px; height:500px; overflow:hidden; margin:auto; padding:0;background-color:#E6E6FA;}
        table#logintb{width:30%;height:50%;margin-left:35%;margin-right:35%;background-color:#E0FFFF;margin-top:10%;text-align:center}
        td#ID{border-color:grey;border-width:5px;width:70%}
        td#idTb{width:20%;}
        td#psTb{width:20%;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="header">
           <img width="1200px" height="140px" src="" />
        </div>
        <div id="login">
        <table id="logintb">
            
            <tr >
                <td id="idTb">
                    <img src="image/user.png" align="right" style="height: 33px; width: 36px" />
                </td>
                <td id="ID"  align="left" >
                    
                    <asp:TextBox ID="userName" runat="server" BackColor="GhostWhite" Height="32%" Width="88%" align="left"></asp:TextBox>
                    
                </td>
                <td></td>
                
            </tr>
            <tr >
                <td id="psTb" >
                    <img align="right" src="image/Password.png" style="height: 39px"/>
                </td>
                <td id="passWord" align="left">
                    <asp:TextBox ID="PWD" runat="server" BackColor="GhostWhite" Height="32%" Width="88%" align="left" TextMode="Password">1234430</asp:TextBox>
                </td>
            </tr>
            <tr >
                <td></td>
             
                <td id="logbt" align="left">
                    
                    <asp:Button ID="loginbt" runat="server" Text="登录" BackColor="#00BFFF"  Height="45%" Width="40%"  Font-Size="Medium" OnClick="loginbt_Click"/>&nbsp;
                    <a href="javascript:history.back()" style="background-color:#00BFFF;height:45%;width:40%;Font-Size:medium">返回</a>
                </td>
            </tr>
            

        </table>
           
    </div>
        </div>
    </form>
</body>
</html>
