using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                this.Label1.Text = "请登录！";

            }
            else
            {
                this.Label1.Text = "欢迎您";
                this.LinkButton1.Text = "注销";

            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (LinkButton1.Text == "登录")
            Response.Redirect("UserLogin.aspx");
        else if (LinkButton1.Text == "注销")
        {
            Session["username"] = null;
            Response.Redirect("UserMain.aspx");
        }
    }
}
