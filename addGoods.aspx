<%@ Page Title="" Language="C#" MasterPageFile="~/Navigation.master" AutoEventWireup="true" CodeFile="addGoods.aspx.cs" Inherits="addGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       div#container{background-color:#F8F8FF;width:100%; height:100%; overflow:hidden; margin:0; padding:0;}
       .a{float:left;width:80%;
height:200px;background-color:white;text-align:left
    }
       .b{float:left;width:20%;height:200px;background-color:#F0FFF0;text-align:left}
       .c{background-color:white;height:50px;font-size:large;color:gray}
       .e{background-color:white;height:50px;width:80%;text-align:left;font-size:large;color:gray}
       .ee{clear:both}
       .lable{height:40px;width:50px;line-height:40px;text-align:right}
       .g{width:250px;height:40px;border:0px;font-size:large}
       .d{background-color:white;height:50px;width:80%;text-align:center;font-size:large;color:gray}
       .h{color:white;background-color:#008B8B; height: 33px; width: 149px; font-size:15px}
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div id="container">
        <div>
            <div class="a">
                <div class="c">
                     <asp:Label ID="Label1" runat="server" Text="商品ID：" CssClass="lable"></asp:Label><asp:TextBox ID="t1" runat="server" CssClass="g"></asp:TextBox></div>
                <div class="c">
                     <asp:Label ID="Label2" runat="server" Text="商品名称:" CssClass="lable"></asp:Label><asp:TextBox ID="t2" runat="server" CssClass="g"></asp:TextBox></div>
                <div class="c">
                     <asp:Label ID="Label3" runat="server" Text="商品类别:" CssClass="lable"></asp:Label><asp:TextBox ID="t3" runat="server" CssClass="g"></asp:TextBox></div>
            </div>
            
        </div>
        <div class="ee">
            <div class="e">
                 <asp:Label ID="Label5" runat="server" Text="商品价格:" CssClass="lable"></asp:Label><asp:TextBox ID="t5" runat="server" CssClass="g" ></asp:TextBox>
            </div>
                <div class="e">
                     <asp:Label ID="Label8" runat="server" Text="是否推荐:" CssClass="lable"></asp:Label><asp:TextBox ID="t8" runat="server" CssClass="g"></asp:TextBox></div>
                    <asp:Button ID="Button1" runat="server" Text="添加" cssclass="h" OnClick="Button1_Click" /></div>
        

    </div>
</asp:Content>

