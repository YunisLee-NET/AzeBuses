using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses
{
    public partial class Xetler : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true)
            {
                string ID;
                ID = Request.QueryString["ID"].ToString();
                GetTable(ID);
                GetXetler(ID);
            }
        }

        void GetTable(string ID)
        {
            DDLXett.DataValueField = "ID";
            DDLXett.DataTextField = "MarsrutNo";
            DDLXett.DataSource = klas.getdatatable("Select * from TB_Bus1 order by Sira");
            DDLXett.DataBind();
            DDLXett.Items.Insert(0, new ListItem("Marşrutu seçin", "0"));
        }

        protected void GetXetler(string ID)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 where ID=" + ID);
            if (dt != null)
            {
                RpXett.DataSource = dt;
                RpXett.DataBind();

                RpFoto.DataSource = dt;
                RpFoto.DataBind();
            }
        }

        protected void DDLXett_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from TB_Bus1 where ID=" + DDLXett.SelectedValue.ToString());
            RpXett.DataSource = dt;
            RpXett.DataBind();

            RpFoto.DataSource = dt;
            RpFoto.DataBind();
        }
    }
}