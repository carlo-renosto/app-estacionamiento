using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Negocio;

namespace TP_Integrador {
    public partial class MenuTickets : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        FuncionesDatos func = new FuncionesDatos();
        protected void Page_Load(object sender, EventArgs e) {
            lblError2.Text = "";

            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Ticket") <= 0) {
                lblAlert.Visible = true;

                lblId.Visible = false;
                txtBuscarTicket.Visible = false;
                btnBuscar.Visible = false;
            }

            if (login.ObtenerUsuarioEsAdmin((DataTable)Session["User"]) == "False") {
                HyperLink2.Visible = false;
                HyperLink3.Visible = false;

                lblId.Visible = false;
                txtBuscarTicket.Visible = false;
                btnBuscar.Visible = false;
                grdTicket.Visible = false;

                HyperLink1.NavigateUrl = "~/MenuMembresiasUser.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (No admin)";
            } 
            else {
                HyperLink1.NavigateUrl = "~/MenuMembresiasAdmin.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";

                if (!IsPostBack) {
                    func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
                }
            }
        }

        protected void lbGen_Click(object sender, EventArgs e) {
            if (lblPat.Visible == true) {
                lbGenOcultarControles();
            } 
            else {
                lbGenMostrarControles();

                DataTable dtTickets = func.ObtenerTablaSQL("SELECT MAX(Id) + 1 FROM Ticket", "Ticket");
                txtId0.Text = dtTickets.Rows[0][0].ToString();
            }
        }

        protected void lbGenOcultarControles() {
            lblId0.Visible = false;
            txtId0.Visible = false;
            lblPat.Visible = false;
            txtPat.Visible = false;
            lblEnt.Visible = false;
            txtEnt.Visible = false;
            txtEnt.Text = "";
            btnGenerar.Visible = false;
        }

        protected void lbGenMostrarControles() {
            lblExito.Text = "";

            lblId0.Visible = true;
            txtId0.Visible = true;
            lblPat.Visible = true;
            txtPat.Visible = true;
            lblEnt.Visible = true;
            txtEnt.Visible = true;
            txtEnt.Text = DateTime.Now.ToString("G");
            btnGenerar.Visible = true;

            lbl_MostrarTicket.Text = "";
        }

        protected void btnGenerar_Click(object sender, EventArgs e) {
            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Vehiculo WHERE Patente = '" + txtPat.Text + "' AND Estado = 1") <= 0) {
                lblError2.Text = "Patente no registrada.";
            }
            else {
                func.EjecutarConsultaSQL("INSERT INTO Ticket(Patente, Entrada, Estado) VALUES('" + txtPat.Text + "', '" + txtEnt.Text + "', 1)");

                txtPat.Text = "";

                if (login.ObtenerUsuarioEsAdmin((DataTable)Session["User"]) == "True") {
                    func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
                } 
                else {
                    lblExito.Text = "Ticket generado exitosamente.";

                    lbGenOcultarControles();

                    lbl_MostrarTicket.Text = "Id: " + txtId0.Text + " <br /> Patente: " + txtPat.Text + " <br /> Entrada: " + txtEnt.Text;
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e) {
            if (txtBuscarTicket.Text == "") {
                func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
            } 
            else {
                func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Id LIKE '%" + txtBuscarTicket.Text + "%' AND Estado = 1", "Ticket");
            }

            txtBuscarTicket.Text = "";
        }

        protected void grdTicket_RowEditing(object sender, GridViewEditEventArgs e) {
            grdTicket.EditIndex = e.NewEditIndex;

            func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
        }

        protected void grdTicket_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            lblError.Text = "";

            grdTicket.EditIndex = -1;

            func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
        }

        protected void grdTicket_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            string id = ((Label)grdTicket.Rows[e.RowIndex].FindControl("lblEditId")).Text;
            string patente = ((TextBox)grdTicket.Rows[e.RowIndex].FindControl("txtEditPat")).Text;
            string entrada = ((TextBox)grdTicket.Rows[e.RowIndex].FindControl("txtEditEnt")).Text;

            if (patente == "" || entrada == "") {
                lblError.Text = "Ingresar ámbos campos.";
            } 
            else if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Vehiculo WHERE Patente = '" + patente + "' AND Estado = 1") <= 0) {
                lblError.Text = "Patente no registrada.";
            } 
            else {
                lblError.Text = "";

                DateTime dtEnt = DateTime.Parse(entrada);

                func.EjecutarConsultaSQL("UPDATE Ticket SET Patente = '" + patente + "', Entrada = '" + dtEnt + "' WHERE Id = " + id);

                grdTicket.EditIndex = -1;
                func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
            }
        }

        protected void grdTicket_RowDeleting(object sender, GridViewDeleteEventArgs e) // Crear trigger para eliminar factura de ticket (si tiene) en caso de que este sea eliminada!!!
        {
            string id = ((Label)grdTicket.Rows[e.RowIndex].FindControl("lbltId")).Text;

            SqlCommand cmd = new SqlCommand();
            SqlParameter param = new SqlParameter();
            param = cmd.Parameters.Add("@Id", SqlDbType.Int);
            param.Value = Convert.ToInt32(id);

            func.EjecutarSP(cmd, "SpDarBajaTicket");
            func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
        }

        protected void grdTicket_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdTicket.PageIndex = e.NewPageIndex;

            func.LlenarGridView(grdTicket, "SELECT * FROM Ticket WHERE Estado = 1", "Ticket");
        }

        protected void grdTicket_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                LinkButton l = (LinkButton)e.Row.FindControl("lbBorrar");

                l.Attributes.Add("onclick", "javascript:return " + "confirm('Realmente quiere eliminar este registro?')");
            }
        }
    }
}