using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class GoodItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
        conn.Open();
        string str = "select * from GoodInfo where goodName='" + Session["goodName"] + "'";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = cmd;
        DataSet dataset = new DataSet();
        Adapter.Fill(dataset);
        conn.Close();
        this.DataList1.DataSource = dataset;
        this.DataList1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["goodName"] = TextBox1.Text;
        string str = "select goodName from GoodInfo where goodName='" + Session["goodName"] + "'";
        SqlConnection conn = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
        conn.Open();
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = cmd;
        DataSet dataset = new DataSet();
        Adapter.Fill(dataset);
        conn.Close();
        if (dataset.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('请输入正确的商品名！')</script>");
        }
        else
        {
            Response.Redirect("UserGoodItem.aspx");
        }
    }
}