using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;


public partial class UserInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
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
                TnameTextBox.Text = myReader["memberTname"].ToString();
                SexDropDownList.Text = myReader["memberSex"].ToString();
                UserTellTextBox.Text = myReader["memberPhone"].ToString();
                UaddressTextBox.Text = myReader["memberAddress"].ToString();
                CodeTextBox.Text = myReader["memberPostCode"].ToString();
                EmailTextBox.Text = myReader["memberEmail"].ToString();
            }
            myConnection.Close();
        }
    }
    protected void CheckUserInfo_Click(object sender, EventArgs e)
    {
        string memberName = Session["username"].ToString();
        string memberTname = TnameTextBox.Text;
        string memberSex = SexDropDownList.Text;
        string memberPhone = UserTellTextBox.Text;
        string memberAddress = UaddressTextBox.Text;
        string memberPostCode = CodeTextBox.Text;
        string memberEmail = EmailTextBox.Text;
        String sqlconn = "server=.;Database=ecweb;uid=sa;pwd=cxz00429";
        SqlConnection myConnection = new SqlConnection(sqlconn);
        myConnection.Open();
        string str = "update Member set memberTname='" + TnameTextBox.Text + "',memberSex='" + memberSex + "',memberPhone='" + UserTellTextBox.Text + "',memberAddress='" + memberAddress + "',memberPostCode='" + memberPostCode + "',memberEmail='" + memberEmail + "' where memberName='" + memberName + "'";
        SqlCommand cmd = new SqlCommand(str,myConnection);
        cmd.ExecuteNonQuery();
        myConnection.Close();
        Response.Write("<script>alert('成功修改个人信息!');location.href='UserInfo.aspx'</script>");
    }
}