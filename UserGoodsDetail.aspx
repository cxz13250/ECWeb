<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserGoodsDetail.aspx.cs" Inherits="UserGoodsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
div#container{background-color:#F8F8FF;width:100%; height:100%; overflow:hidden; margin:0; padding:0;}
       .a{float:left;width:60%;height:200px;background-color:white;text-align:left}
       .b{float:left;width:20%;background-color:#F0FFF0;text-align:left}
       .c{background-color:white;height:50px;font-size:large;color:gray}
       .e{background-color:white;height:50px;width:80%;text-align:left;font-size:large;color:gray}
       .ee{clear:both}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container">
        <div>
            <div class="a">
                <div class="c">
                     <asp:Label ID="Label1" runat="server" Text="商品ID：" CssClass="lable"></asp:Label><asp:Label ID="goodId" runat="server"></asp:Label></div>
                <div class="c">
                     <asp:Label ID="Label2" runat="server" Text="商品名称:" CssClass="lable"></asp:Label><asp:Label ID="goodName" runat="server"></asp:Label></div>
                <div class="c">
                     <asp:Label ID="Label3" runat="server" Text="商品类别:" CssClass="lable"></asp:Label><asp:Label ID="goodType" runat="server"></asp:Label></div>
            </div>
            <div class="b">
                <asp:Image ID="Image1" runat="server" AlternateText="商品图片" Height="100%" Width="100%" />
             </div>
        </div>
        <div class="ee">
            <div class="e">
                 <asp:Label ID="Label5" runat="server" Text="商品价格:" CssClass="lable"></asp:Label><asp:Label ID="goodPrice" runat="server"></asp:Label>
            </div>
            <div class="e">
                 <asp:Label ID="Label8" runat="server" Text="是否推荐:" CssClass="lable"></asp:Label><asp:Label ID="goodIntro" runat="server"></asp:Label>
            </div>
            <div class="e">
                 <asp:Label ID="Label4" runat="server" Text="购买数量:" CssClass="lable"></asp:Label><asp:TextBox ID="t1" runat="server" CssClass="g" ReadOnly="true"></asp:TextBox> 
            </div>
            </div>
            <div class="e">
                <asp:Button ID="Button1" runat="server" Text="加入购物车" cssclass="h" OnClick="Button1_Click" />
                <a href="javascript:history.back()">返回上一页</a>
            </div>
    </div>
</asp:Content>

