<%@ Page Title="" Language="C#" MasterPageFile="~/Navigation.master" AutoEventWireup="true" CodeFile="Vip.aspx.cs" Inherits="Vip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .mGrid {    
    width: 100%;    
    background-color: #fff;    
    margin: 5px 0px 10px 0;    
    border: solid 1px #525252;    
    border-collapse:collapse;    
            }   
    .mGrid td {    
    padding: 2px;    
    border: solid 1px #c1c1c1;    
    color: #717171;    
              }   
    .mGrid th {    
    padding: 4px 2px;    
    color: #fff;    
    background: #424242;    
    border-left: solid 1px #525252;    
    font-size: 0.9em;    
              }   
    .mGrid .alt { background: #fcfcfc  }   
    .mGrid .pgr { background: #424242 ; }   
    .mGrid .pgr table { margin: 5px 0; }   
    .mGrid .pgr td {    
    border-width: 0;    
    padding: 0 6px;    
    border-left: solid 1px #666;    
    font-weight: bold;    
    color: #fff;    
    line-height: 12px;    
                    }      
    .mGrid .pgr a { color: #666; text-decoration: none; }   
    .mGrid .pgr a:hover { color: #000; text-decoration: none; }  
    div#search{height:150px;width:1000px;text-align:center}
    .h{color:white;background-color:#708090; height: 33px; width: 180px; font-size:15px}
    .tb{width:100%;}
    .td0{width:20%;height:50px;text-align:right}
    .td1{width:20%;height:50px;text-align:left}
    .tbox{  Height:22px;
        Width:150px;border-width:2px;
       border-color:GhostWhite }
    .btdiv{height:50px;text-align:center;}
    .label{color:gray}
    .operate{text-align:center;font-size:15px}
    .add{width:100px;width:1000px;text-align:center;margin-top:40px}
    </style>
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="search">
        <table class="tb">
            <tr>
                <td class="td0">
                    查询条件：</td>
                <td class="td1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="108px">
                        <asp:ListItem Value="memberId">会员ID</asp:ListItem>
                        <asp:ListItem Value="memberTname">会员名称</asp:ListItem>
                        <asp:ListItem Value="memberPhone">会员电话</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="td0">
                    关键字：</td>
                <td class="td1">
                    <asp:TextBox ID="SearchKey" runat="server" Height="22px" Width="170px"></asp:TextBox>
                </td>
                <td class="td1">
                    <asp:Button ID="Button1" runat="server" Height="32px" Text="查询" Width="86px" OnClick="Button1_Click"  />
                </td>
            </tr>
            
        </table>
        
        </div>
      <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="70px" Width="900px" AllowPaging="True" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnPageIndexChanging="GridView1_PageIndexChanging"  OnRowCommand="GridView1_RowCommand" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
    <Columns>
        <asp:BoundField HeaderText="会员ID" DataField="memberId" />
        <asp:BoundField HeaderText="会员名" DataField="memberTname" />
        <asp:BoundField HeaderText="地址" DataField="memberCity" />
        <asp:BoundField HeaderText="电话" DataField="memberPhone" />
        <asp:BoundField HeaderText="Email" DataField="memberEmail" />
        <asp:BoundField HeaderText="邮编" DataField="memberPostCode" />
        <asp:BoundField HeaderText="会员充值" DataField="memberMoney" />
        <asp:ButtonField HeaderText="删除会员" Text="删除" CommandName="delete" />
        
    </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
</asp:GridView>

    
</asp:Content>

