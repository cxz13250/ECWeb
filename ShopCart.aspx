<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShopCart.aspx.cs" Inherits="ShopCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .sumtable{width:720px;height: 50px;}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <center style="font-size: x-large">我的购物车</center><br/>
        <asp:GridView ID="GridView1" CssClass="mygrid" runat="server" AutoGenerateColumns="False" 
          onrowcommand="GridView1_RowCommand" AllowPaging="True" style="width:100%"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" 
        onpageindexchanging="GridView1_PageIndexChanging" Width="80%" >
      <Columns>
          <asp:BoundField DataField="cartId" HeaderText="编号" />
          <asp:BoundField DataField="goodId" HeaderText="商品编号" />
          <asp:BoundField DataField="goodName" HeaderText="商品名" />
          <asp:BoundField DataField="goodPrice" HeaderText="单价" DataFormatString="{0:c}" />
          <asp:BoundField DataField="Count" HeaderText="数量" />
          <asp:BoundField HeaderText="小计" DataFormatString="{0:c}" />
          <asp:TemplateField ShowHeader="False">
              <ItemTemplate>
              <asp:Button ID="Button2" runat="server" Text="取消购买" CommandName="Cancer" CommandArgument="<%# ((GridViewRow) Container).RowIndex%>"/>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
      <FooterStyle BackColor="White" ForeColor="#000066" />
      <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
      <RowStyle ForeColor="#000066" />
      <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F1F1F1" />
      <SortedAscendingHeaderStyle BackColor="#007DBB" />
      <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <div id="sum">
                <table class="sumtable">
                    <tr>
                        <td >
                            <asp:Label ID="Label1" runat="server" Text="总计" CssClass="labelall"></asp:Label><asp:Label ID="LabelKind" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label4" runat="server" Text="种商品" CssClass="labelall"></asp:Label>
                        </td>
                        <td >
                            <asp:Label ID="Label2" runat="server" Text="总计" CssClass="labelall"></asp:Label><asp:Label ID="LabelPiece" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label5" runat="server" Text="件商品" CssClass="labelall"></asp:Label>
                        </td>
                        <td >
                            
                            <asp:Label ID="Label3" runat="server" Text="合计" CssClass="labelall"></asp:Label><asp:Label ID="LabelSum" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label6" runat="server" Text="元" CssClass="labelall"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="buy" Text="下单" runat="server" OnClick="buy_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
    </div>
    <div class="col-sm-3"></div>
</asp:Content>

