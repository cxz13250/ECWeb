using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class GoodsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String goodId = Request.QueryString["goodId"];
            String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand("select * from GoodInfo where goodId = " + goodId, myConnection);
            SqlDataAdapter Adapter = new SqlDataAdapter();
            Adapter.SelectCommand = myCommand;
            DataSet myDs = new DataSet();
            Adapter.Fill(myDs);
            DataTable myTable = myDs.Tables[0];
            DataRow row=myTable.Rows[0];
            DataColumn c1 = myTable.Columns["goodId"];
            DataColumn c2 = myTable.Columns["goodName"];
            DataColumn c3 = myTable.Columns["goodType"];
            DataColumn c4 = myTable.Columns["goodPrice"];
            DataColumn c5 = myTable.Columns["goodIntro"];
            DataColumn c6 = myTable.Columns["goodPhoto"];
            t1.Text = row[c1].ToString();
            t2.Text = row[c2].ToString();
            t3.Text = row[c3].ToString();
            t5.Text = row[c4].ToString();
            t8.Text = row[c5].ToString();
            this.Image1.ImageUrl = row[c6].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string str = "update GoodInfo set goodName='" + t2.Text + "',goodType=" + t3.Text + ",goodPrice=" + t5.Text + ",goodIntro='" + t8.Text + "' where goodId=" + t1.Text;
        SqlCommand myCommand = new SqlCommand(str, myConnection);
        myCommand.ExecuteNonQuery();
        Response.Redirect("Goods.aspx");
    }
}