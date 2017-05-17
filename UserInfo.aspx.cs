using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class UserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            string memberName = Session["username"].ToString();
            String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
            SqlConnection myConnection = new SqlConnection(sqlconn);
            myConnection.Open();
            string str = "select * from Member where memberName='" + memberName + "'";
            SqlCommand cmd = new SqlCommand(str, myConnection);
            SqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            if (myReader.Read())
            {
                TnameLabel.Text = myReader["memberTname"].ToString();
                SexLabel.Text = myReader["memberSex"].ToString();
                UsetTellLabel.Text = myReader["memberPhone"].ToString();
                UadressLabel.Text = myReader["memberAddress"].ToString();
                CodeLabel.Text = myReader["memberPostCode"].ToString();
                EmailLabel.Text = myReader["memberEmail"].ToString();
            }
            myConnection.Close();
        }
        else {
            Session["url"] = "UserInfo.aspx";
            Response.Redirect("UserLogin.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserInfoEdit.aspx");
    }
}