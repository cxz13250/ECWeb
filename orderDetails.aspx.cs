using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class orderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    public void Bind() 
    {
        String orderId = Request.QueryString["orderId"];
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sql = "select * from orderInfo,Member,orderDetails,GoodInfo where orderInfo.orderId=orderDetails.OrderId and orderDetails.goodId=GoodInfo.goodId and orderMname=memberTname and orderInfo.orderId=" + orderId;
        SqlCommand myCommand = new SqlCommand(sql, myConnection);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs=new DataSet();
        Adapter.Fill(myDs);
        DataTable myTable = myDs.Tables[0];
        DataRow row = myTable.Rows[0];
        DataColumn c1 = myTable.Columns["isCheckout"];//状态
        DataColumn c2 = myTable.Columns["memberTname"];//用户姓名
        DataColumn c3 = myTable.Columns["memberPhone"];//联系手机
        DataColumn c4 = myTable.Columns["ordertime"];//下单时间
        DataColumn c5 = myTable.Columns["memberName"];//用户账号
        DataColumn c6 = myTable.Columns["address"];//收货地址
        LabelStatus.Text = row[c1].ToString();
        LabelUserName.Text = row[c2].ToString();
        LabelPhone.Text = row[c3].ToString();
        LabelOrderTime.Text = row[c4].ToString();
        LabelUserID.Text = row[c5].ToString();
        TextBoxReceiver.Text = row[c2].ToString();
        TextBoxPhone1.Text = row[c3].ToString();
        TextBoxDestination.Text = row[c6].ToString();
        GridView1.DataSource = myDs.Tables[0].DefaultView;
        GridView1.DataBind();
        Double countsum = 0;
        Double pricesum = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            string p = Convert.ToString(GridView1.Rows[i].Cells[2].Text);
            Double price = Convert.ToDouble(p.Remove(0, 6));//删除人民币符号
            Double count = Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
            GridView1.Rows[i].Cells[4].Text = "¥" + (price * count).ToString();
            countsum += count;
            pricesum += price * count;

        }
        //总计
        LabelKind.Text = GridView1.Rows.Count.ToString();
        LabelPiece.Text = countsum.ToString();
        LabelSum.Text = pricesum.ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)//发货
    {
        String orderId = Request.QueryString["orderId"];
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        String sqlstr = "update orderInfo set isCheckout='已发货' where orderId=" + orderId;
        SqlCommand myCommand = new SqlCommand(sqlstr, myConnection);
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        Bind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
}