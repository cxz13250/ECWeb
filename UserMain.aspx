<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="UserMain.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <div class="col-lg-4 col-sm-4"></div><!--左侧不用-->
    <div class="col-lg-4 col-sm-4">
    <div style="width:80%">
        <div class="input-group">
             <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
             <span class="input-group-btn">
                  <asp:Button ID="Button1" runat="server" Text="搜索" onclick="Button1_Click" CssClass="btn btn-default"/>
             </span>
        </div><!-- /input-group -->
    </div></div>
    <div class="col-lg-4 col-sm-4"></div><!--右侧不用-->
    </div>
    <br/><br/><br/>
   <div>
    <div class="col-lg-2 col-sm-2"></div>
    <div class="col-lg-8 col-sm-8">
   <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" 
            RepeatDirection="Horizontal" Width="100%" 
                    Height="100%" Font-Bold="False" 
            Font-Italic="False" Font-Overline="False" Font-Strikeout="False" 
            Font-Underline="False" BorderColor="White" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Both" 
            HorizontalAlign="Center" >
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <ItemStyle ForeColor="#000066" />
                    <ItemTemplate>
                        <center><a href='UserGoodsDetail.aspx?goodName=<%#Eval("goodName") %>'>
                            <asp:Image ID="image1" runat="server" Height="150px" ImageUrl='<%#Eval("goodPhoto") %>'
                                Width="180px" ImageAlign="Middle" />
                        </a></center>
                        <br />
                        <center><asp:HyperLink ID="Hy1" runat="server" NavigateUrl='<%#Eval("goodName","UserGoodsDetail.aspx?goodName={0}") %>'
                            Text='<%# Eval("goodName")%>'></asp:HyperLink></center>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
   </div>
   <div class="col-lg-2 col-sm-2"></div>
   </div>
   
</asp:Content>

