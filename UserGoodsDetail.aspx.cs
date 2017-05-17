using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UserGoodsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.t1.Text = "1";
        BookBinder();
    }

    private void BookBinder()
    {
        SqlConnection conn = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from GoodInfo where goodName=@goodName", conn);
        cmd.Parameters.Add("@goodName", SqlDbType.VarChar);
        cmd.Parameters["@goodName"].Value = Request.QueryString["goodName"].ToString();
        SqlDataReader myReader;
        myReader = cmd.ExecuteReader();
        if (myReader.Read())
        {
            this.goodId.Text=myReader["goodId"].ToString();
            this.goodName.Text = myReader["goodName"].ToString();
            this.goodType.Text = myReader["goodType"].ToString();
            this.goodPrice.Text = myReader["goodPrice"].ToString();
            this.goodIntro.Text = myReader["goodIntro"].ToString();
            this.Image1.ImageUrl=myReader["goodPhoto"].ToString();
        }
        conn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Session["url"] = "UserGoodsDetail.aspx?goodName=" + Request.QueryString["goodName"].ToString();
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            int goodId = Convert.ToInt32(this.goodId.Text);
            string Name=Session["username"].ToString();
            int Count = int.Parse(this.t1.Text);
            SqlConnection conn = new SqlConnection("server=.;Database=ecweb;uid=sa;pwd=cxz00429");
            conn.Open();
            string str = "insert into shopcart(goodId,Count,Name) values("+goodId+","+Count+",'"+Name+"')";
            SqlCommand cmd = new SqlCommand(str,conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('加入购物车成功!');location=location</script>");
        }
    }
}