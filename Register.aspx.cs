using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ibtn_yzm.ImageUrl = "ImageCode.aspx";
        }
    }
    protected void Registrbtn_Click(object sender, EventArgs e)
    {
        string strUserName = this.UserName.Text;
        string strUserPwd = this.UserPwd.Text;
        string code = tbx_yzm.Text;
        HttpCookie htco = Request.Cookies["ImageV"];
        string scode = htco.Value.ToString();
        if (strUserName == "")
        {
            Response.Write("<script>alert('用户名不可为空!');</script>");
        }
        else if (strUserPwd=="")
        {
            Response.Write("<script>alert('密码不可为空!');</script>");
        }   
        else if (code != scode)
        {
            Response.Write("<script>alert('验证码输入不正确!');</script>");
        }
        else{
            string Tname = this.TrueName.Text;
            string Sex = this.UserSex.Text;
            string UserTell = this.UserTell.Text;
            string Uaddress = this.UserAddr.Text;
            string Email = this.Email.Text;
            string Qusetion = this.Question.Text;
            string Answer = this.Answer.Text;
            string Post = this.Code.Text;
            SqlConnection con = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
            con.Open();
            string str = "insert into Member(memberName,memberSex,memberPWD,memberTname,memberQue,memberAns,memberPhone,memberEmail,memberAddress,memberPostCode) values('"
                +strUserName+"','"+Sex+"','"+strUserPwd+"','"+Tname+"','"+Qusetion+"','"+Answer+"','"+UserTell+"','"+Email+"','"+Uaddress+"','"+Post+"')";
            SqlCommand cmd = new SqlCommand(str,con);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["username"] = strUserName;
            Response.Write("<script>alert('注册成功!');location='UserMain.aspx'</script>");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }
}