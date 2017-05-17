using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class ShopCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]==null){
            Session["url"]="ShopCart.aspx";
            Response.Redirect("UserLogin.aspx");
        }
        if (!IsPostBack)
        {
            Bind();
        }
    }

    public void Bind()
    {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sql = "select cartId,GoodInfo.goodId,goodName,Count,goodPrice from GoodInfo,shopcart where Shopcart.Name='"+Session["username"]+"' and shopcart.goodId=GoodInfo.goodId";
        SqlCommand myCommand = new SqlCommand(sql, myConnection);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        DataTable myTable = myDs.Tables[0];
        if (myTable.Rows.Count == 0)
        {
            Response.Redirect("Message.aspx?message=购物车是空的!");
        }
        GridView1.DataSource = myDs.Tables[0].DefaultView;
        GridView1.DataBind();
        Double countsum = 0;
        Double pricesum = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            string p = Convert.ToString(GridView1.Rows[i].Cells[3].Text);
            Double price = Convert.ToDouble(p.Remove(0, 6));//删除人民币符号
            Double count = Convert.ToDouble(GridView1.Rows[i].Cells[4].Text);
            GridView1.Rows[i].Cells[5].Text = "¥" + (price * count).ToString();
            countsum += count;
            pricesum += price * count;

        }
        //总计
        LabelKind.Text = GridView1.Rows.Count.ToString();
        LabelPiece.Text = countsum.ToString();
        LabelSum.Text = pricesum.ToString();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GridView1.Rows[index];
        int cartId = int.Parse(row.Cells[0].Text);
        if(e.CommandName=="Cancer"){
            delete(cartId);
            Bind();
        }
    }

    protected void buy_Click(object sender, EventArgs e)
    {
        string MemberTname = getMemberTame(Session["username"].ToString());
        string MemberAddress = getMemberAddress(Session["username"].ToString());
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        DateTime time = System.DateTime.Now;
        string str1 = "insert into orderinfo(isCheckout,ordertime,address,orderMname) values('未发货','"+time+"','"+MemberAddress+"','"+MemberTname+"')";
        SqlCommand cmd = new SqlCommand(str1,myConnection);
        cmd.ExecuteNonQuery();
        int orderId=getOrderId(time);
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            int cartId = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
            int goodId=Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
            int Count=Convert.ToInt32(GridView1.Rows[i].Cells[4].Text);
            string str2 = "insert into orderDetails(OrderId,goodId,Count) values(" +orderId+ ","+goodId+","+Count+")";
            cmd.Connection = myConnection;
            cmd.CommandText = str2;
            cmd.ExecuteNonQuery();
            delete(cartId);
        }
        myConnection.Close();
        string message="下单成功!";
        Response.Redirect("Message.aspx?message="+message);
    }

    protected void delete(int cartId) {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string str = "delete from shopcart where cartId=" + cartId;
        SqlCommand cmd = new SqlCommand(str, myConnection);
        cmd.ExecuteNonQuery();
        myConnection.Close();
    }

    protected string getMemberTame(string MemberName) {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sql = "select memberTname from Member where memberName='"+MemberName+"'";
        SqlCommand cmd = new SqlCommand(sql,myConnection);
        SqlDataReader myReader;
        myReader = cmd.ExecuteReader();
        string temp;
        if (myReader.Read())
        {
            temp = myReader["memberTname"].ToString();
        }
        else {
            temp = null;
        }
        return temp;
    }

    protected string getMemberAddress(string MemberName)
    {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sql = "select memberAddress from Member where memberName='" + MemberName + "'";
        SqlCommand cmd = new SqlCommand(sql, myConnection);
        SqlDataReader myReader;
        myReader = cmd.ExecuteReader();
        string temp;
        if (myReader.Read())
        {
            temp = myReader["memberAddress"].ToString();
        }
        else
        {
            temp = null;
        }
        return temp;
    }

    protected int getOrderId(DateTime time)
    {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sql = "select orderId from orderinfo where ordertime='" + time + "'";
        SqlCommand cmd = new SqlCommand(sql, myConnection);
        SqlDataReader myReader;
        myReader = cmd.ExecuteReader();
        int temp;
        if (myReader.Read())
        {
            temp = Convert.ToInt32(myReader["orderId"].ToString());
        }
        else
        {
            temp = 0;
        }
        return temp;
    }
}