<%@ Page Title="" Language="C#" MasterPageFile="~/Navigation.master" AutoEventWireup="true" CodeFile="orderDetails.aspx.cs" Inherits="orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        div#container{background-color:#F8F8FF;width:100%; height:100%; overflow:hidden; margin:0; padding:0;text-align:center}
        div#status{width:95%;height:50px;border:0.7px solid #DCDCDC ;margin-left:5px;margin-right:5px;margin-top:20px;line-height:50px}
        div#customer{width:95%;height:300px;border:0.7px solid #DCDCDC ;margin-left:5px;margin-right:5px;margin-top:20px}
        div#goods{width:95%;height:600px;border:0.7px solid #DCDCDC ;margin-left:5px;margin-right:5px;margin-top:20px}
        .status{width:100%;height:100%}
        .LabelStatus {color:red;}
        .labelall{font: 16px/1.5 'Microsoft YaHei',arial,tahoma,\5b8b\4f53,sans-serif; }
        .cancel{background-color:#C0C0C0;color:black;height:30px;width:100px;border:1px solid #C0C0C0;margin-right:1px}
        .con{background-color:#1E90FF;color:#F8F8FF;height:30px;width:100px;border:1px solid #1E90FF}
        .td1{text-align:left;padding-left:25px}
        .td2{text-align:right;padding-right:25px}
        div#user{width:95%;height:150px;}
        .usertable{width:100%;height:50%;margin-left:2.5%}
        .usertd{text-align:left}
        div#userID{width:100%;height:50% ;margin-left:2.5%;text-align:left;line-height:75px;padding-left:5px}
        div#receiver{width:95%;height:50% ;border-top:2px dotted #A9A9A9;margin-left:2.5%}
        .receivertable{width:100%;height:100%;text-align:left}
        .receivertd{text-align:left}
        .receiverbox{width:200px;border-bottom:1px solid gray;border:0px;height:20px}
        .goodslabel{width:100%;height:30px;text-align:left;padding-left:25px;color:gray;line-height:30px}
        .mGrid {width: 100%; background-color: #fff;margin: 5px 0px 10px 0;border: solid 1px #525252; border-collapse:collapse;}
        .mGrid .alt { background: #fcfcfc  }
        .Griddiv{padding-left:25px}
        div#sum{padding-left:25px}
        .sumtable{width:720px;height: 50px;}
        
        
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="container">
        <div id="status">
            <table class="status">
                <tr>
                    <td class="td1">
                        <asp:Label ID="Label1" runat="server" Text="订单状态：" CssClass="labelall"></asp:Label><asp:Label ID="LabelStatus" runat="server" Text="状态" CssClass="LabelStatus"></asp:Label>
                    </td>
                    
                    <td class="td2">
                        <asp:Button ID="Button2" runat="server" Text="发货" class="con" OnClick="Button2_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        <div id="customer">
            <div id="user">
                <table class="usertable">
                    <tr>
                        <td class="usertd">
                            <asp:Label ID="Label3" runat="server" Text="下单用户姓名：" CssClass="labelall"></asp:Label>
                            <asp:Label ID="LabelUserName" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="手机：" CssClass="labelall"></asp:Label>
                            <asp:Label ID="LabelPhone" runat="server" Text="la"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="下单时间：" CssClass="labelall"></asp:Label>
                            <asp:Label ID="LabelOrderTime" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
                <div id="userID">
                    <asp:Label ID="LabelUserD" runat="server" Text="下单用户账号：" CssClass="labelall"></asp:Label><asp:Label ID="LabelUserID" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div id="receiver">
                <table class="receivertable">
                    <tr>
                        <td class="receivertd">
                            <asp:Label ID="LabelReceiver" runat="server" Text="收货人姓名：" CssClass="labelall"></asp:Label><asp:TextBox ID="TextBoxReceiver" runat="server" CssClass="receiverbox"></asp:TextBox>

                        </td>
                        <td>
                            <asp:Label ID="LabelPhone1" runat="server" Text="联系电话： " CssClass="labelall"></asp:Label><asp:TextBox ID="TextBoxPhone1" runat="server" CssClass="receiverbox"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelDestination" runat="server" Text="收货人地址：" CssClass="labelall"></asp:Label><asp:TextBox ID="TextBoxDestination" runat="server" CssClass="receiverbox"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="修改确认" CssClass="con" OnClick="Button3_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="goods">
            <div class="goodslabel">
                <asp:Label ID="Label15" runat="server" Text="商品详情"></asp:Label>
            </div>
            <div class="Griddiv">
                <asp:GridView ID="GridView1" runat="server" Width="800px" AutoGenerateColumns="False" Height="251px" CssClass="mGrid" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:ImageField DataImageUrlField="goodPhoto" HeaderText="商品图片">
                           <ControlStyle Height="100px" Width="150px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="goodName" HeaderText="商品名" />
                        <asp:BoundField DataField="goodPrice" HeaderText="售价" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Count" HeaderText="数量" />
                        <asp:BoundField HeaderText="小计" DataFormatString="{0:c}" />
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
            </div>
            <div id="sum">
                <table class="sumtable">
                    <tr>
                        <td >
                            <asp:Label ID="Label16" runat="server" Text="总计" CssClass="labelall"></asp:Label><asp:Label ID="LabelKind" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label18" runat="server" Text="种商品" CssClass="labelall"></asp:Label>
                        </td>
                        <td >
                            <asp:Label ID="Label19" runat="server" Text="总计" CssClass="labelall"></asp:Label><asp:Label ID="LabelPiece" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label21" runat="server" Text="件商品" CssClass="labelall"></asp:Label>
                        </td>
                        <td >
                            
                            <asp:Label ID="Label22" runat="server" Text="合计" CssClass="labelall"></asp:Label><asp:Label ID="LabelSum" runat="server" Text="Label" CssClass="LabelStatus"></asp:Label><asp:Label ID="Label2" runat="server" Text="元" CssClass="labelall"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
    
    </div>
</asp:Content>

