using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AzeBuses.Admin
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                GetTarix();
            }
        }

        void GetTarix()
        {
            DataTable dt = klas.getdatatable("Select * from TB_GirisVaxti");
            RpGiris.DataSource = dt;
            RpGiris.DataBind();
        }
    }
}