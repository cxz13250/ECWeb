using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Goods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            Bind(null);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      
        GridView1.EditIndex = -1;
        Bind(null);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Id = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("delete from GoodInfo where goodId=" + Id, myConnection);
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        string sql = "select * from GoodInfo";
        Bind(sql);
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind(null);

    }
    protected void Bind(String sql) 
    {
        string sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        if (sql == null || sql.Equals("")) {
            sql = "select * from GoodInfo";
        }
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand(sql, myConnection);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        GridView1.DataSource = myDs.Tables[0].DefaultView;
        GridView1.DataBind();
        myConnection.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("addGoods.aspx");
    }
    protected void Search_Click(object sender, EventArgs e)
    {
        String sql = "select * from GoodInfo where ";
        sql += DropDownList1.SelectedValue.ToString() + "='" + SearchKey.Text + "'";
        Bind(sql);
    }
}