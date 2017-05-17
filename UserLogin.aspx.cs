using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            if(Session["username"]!=null){
                Response.Redirect("Message.aspx?message=您已经登录过了!");
            }
        }
    }
    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string UserName = this.UserNameTextBox.Text.ToString();
        if(UserName==""){
            Response.Write("<script>alert('用户名不能为空!');location=location</script>");
        }
        string UserPwd = this.UserPwdTextBox.Text.ToString();
        if(UserPwd==""){
            Response.Write("<script>alert('密码不可为空!');location=location</script>");
        }
        SqlConnection conn = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
        conn.Open();
        string str = "select * from Member where MemberName='"+UserName+"'";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataAdapter Adapter = new SqlDataAdapter();
        Adapter.SelectCommand = cmd;
        DataSet dataset = new DataSet();
        Adapter.Fill(dataset);
        conn.Close();
        if (dataset.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('该用户名不存在!');location=location</script>");
        }
        else {
            DataTable dt = dataset.Tables[0];
            string pwd = dt.Rows[0][3].ToString();
            if (pwd != UserPwd)
            {
                Response.Write("<script>alert('密码错误!');location=location</script>");
            }
            else {
                Session["username"] = UserName;
                if (Session["url"] == null)
                {
                    Response.Redirect("UserMain.aspx");
                }
                else {
                    Response.Redirect(Session["url"].ToString());
                }
            }
        }
    }
    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}