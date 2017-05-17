using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginbt_Click(object sender, EventArgs e)
    {
        string constr = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(constr);
        myConnection.Open();
        string sql = "select count(adminId)from Admin";  //得到数据库现有的的行数
        SqlCommand myCommand1 = new SqlCommand(sql, myConnection);
        SqlDataAdapter Adapter1 = new SqlDataAdapter();
        Adapter1.SelectCommand = myCommand1;
        DataSet myDs1 = new DataSet();
        Adapter1.Fill(myDs1);
        DataTable myTable1 = myDs1.Tables[0];
        int t = int.Parse(myTable1.Rows[0][0].ToString());
        SqlCommand myCommand = new SqlCommand("select * from Admin", myConnection);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = myCommand;
        DataSet myDs = new DataSet();
        Adapter.Fill(myDs);
        DataTable myTable = myDs.Tables[0];
        int count = 0;
        for (int i = 0; i < t; i++)
        {
            string a = Convert.ToString(myTable.Rows[i][1]);
            string b = Convert.ToString(myTable.Rows[i][2]);
            
            if (userName.Text == a)
            {
                if (PWD.Text != b) { Response.Write("<script>alert('密码错误，请重输！')</script>"); break; }
                else { Response.Redirect("main.aspx"); break; }
            }
            else count++;
        }
        if (count == t) { Response.Write("<script>alert('无此用户，请重输！')</script>"); }
        myConnection.Close();
    }
}