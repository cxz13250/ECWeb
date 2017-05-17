using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class addGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string sqlstr = "insert into GoodInfo(goodId,goodName,goodType,goodPrice,goodIntro) values (" + t1.Text + ",'" + t2.Text + "'," + t3.Text + "," + t5.Text + ",'" + t8.Text + "')";
        SqlCommand com = new SqlCommand(sqlstr, myConnection);
        com.ExecuteNonQuery();
        Response.Redirect("Goods.aspx");
        myConnection.Close();
    }
}