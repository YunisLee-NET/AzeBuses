using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses
{
    public partial class Xett1 : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack == true)
            {
                GetTable();
            }
        }

        void GetTable()
        {
            DDLXett.DataValueField = "ID";
            DDLXett.DataTextField = "MarsrutNo";
            DDLXett.DataSource = klas.getdatatable("Select * from TB_Bus1 order by Sira");
            DDLXett.DataBind();
            DDLXett.Items.Insert(0, new ListItem("Marşrutu seçin", "0"));
        }
        

        protected void DDLXett_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 where ID=" + DDLXett.SelectedValue.ToString());
            RpXett.DataSource = dt;
            RpXett.DataBind();

            RpFoto.DataSource = dt;
            RpFoto.DataBind();
        }



        protected void lnkGonder_Click(object sender, EventArgs e)
        {
            //if (ViewState["CommentID"].ToString() == "0")
            //{
            //    klas.baglanti.Open();
            //    SqlCommand cmd = new SqlCommand("Insert into TB_Comment (Name, Surname, Comment, CommentTarix, XettID) values (@Name, @Surname, @Comment, GETDATE(), @XettID)", klas.baglanti);
            //    cmd.Parameters.AddWithValue("Name", txtAd.Text);
            //    cmd.Parameters.AddWithValue("Surname", txtSoyad.Text);
            //    cmd.Parameters.AddWithValue("Comment", txtYorum.Text);
            //    cmd.Parameters.AddWithValue("XettID", ID);

            //    cmd.ExecuteNonQuery();

            //    txtAd.Text = "";
            //    txtSoyad.Text = "";
            //    txtYorum.Text = "";
            //    klas.baglanti.Close();
            //}
        }

        void GetAxtar()
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 where MarsrutNo like '" + txtAxtar.Text + "%'");
            RpXett.DataSource = dt;
            RpXett.DataBind();

            RpFoto.DataSource = dt;
            RpFoto.DataBind();
        }

        protected void lnkAxtar_Click(object sender, EventArgs e)
        {
            GetAxtar();
            txtAxtar.Text = "";
        }

        //void GetComment(string ID)
        //{
        //    DataTable dt = klas.getdatatable("Select * from TB_Comment where XettID=" + ID);
        //    if (dt != null)
        //    {
        //        RP_Yorum.DataSource = dt;
        //        RP_Yorum.DataBind();
        //    }
        //}
    }
}