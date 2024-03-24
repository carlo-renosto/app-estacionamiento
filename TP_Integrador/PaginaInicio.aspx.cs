using System;
using System.Data;
using Negocio;

namespace TP_Integrador {
    public partial class PaginaInicio : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();

        protected void Page_Load(object sender, EventArgs e) {
            if (login.ObtenerUsuarioEsAdmin((DataTable)Session["User"]) == "False") {
                HyperLink1.Visible = false;
                HyperLink2.Visible = false;
                HyperLink3.NavigateUrl = "~/MenuMembresiasUser.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (No admin)";
            } 
            else {
                HyperLink3.NavigateUrl = "~/MenuMembresiasAdmin.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";
            }
        }
    }
}