using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Negocio;

namespace TP_Integrador {
    public partial class MenuFacturas : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        FuncionesDatos func = new FuncionesDatos();

        protected void Page_Load(object sender, EventArgs e) {
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Factura") <= 0) {
                lblId.Visible = false;
                txtBuscarFactura.Visible = false;
                btnBuscar.Visible = false;
            }
            if(login.ObtenerUsuarioEsAdmin((DataTable)Session["User"]) == "False") {
                HyperLink2.Visible = false;
                HyperLink3.Visible = false;

                lblId.Visible = false;
                txtBuscarFactura.Visible = false;
                btnBuscar.Visible = false;
                grdFactura.Visible = false;

                HyperLink1.NavigateUrl = "~/MenuMembresiasUser.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (No admin)";
            }
            else {
                HyperLink1.NavigateUrl = "~/MenuMembresiasAdmin.aspx";

                lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";

                if(!IsPostBack) {
                    func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE estado = 1", "Factura");
                }
            }
        }

        protected void btnGenerar_Click(object sender, EventArgs e) {
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente WHERE Dni = '" + txtDni.SelectedValue + "' AND Estado = 1") <= 0) {
                lblError2.Text = "DNI no registrado.";
                return;
            }
            
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Ticket WHERE Id = " + txtTicket.Text) <= 0) {
                lblError3.Text = "Ticket no registrado.";
                return;
            }
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Ticket WHERE Id = " + txtTicket.Text) == 1) {
                lblError3.Text = "Ticket ya registrado.";
                return;
            }
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Factura WHERE Id = " + txtTicket.Text) == 1) {
                lblError3.Text = "Ticket ya registrado (Factura existente).";
                return; 
            }
            
            lblError3.Text = "";
            lblError2.Text = "";

            func.EjecutarConsultaSQL("INSERT INTO Factura(Dni, Id, Salida, Estado) VALUES('" + txtDni.SelectedValue + "', '" + txtTicket.Text + "', '" + DateTime.Now.ToString("s") + "', 1)");

            mostrarTicket(txtTicket.Text);

            txtTicket.Text = "";

            if(login.ObtenerUsuarioEsAdmin((DataTable)Session["User"]) == "True") {
                func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
            }
            else {
                lblExito.Text = "Factura generada exitosamente.";

                lbGenOcultarControles();
            }
        }

        protected void lbGen_Click(object sender, EventArgs e) {
            if(lblDni.Visible == true) {
                lbGenOcultarControles();
            }
            else {
                lbGenMostrarControles();
            }
        }

        protected void lbGenOcultarControles() {
            lblDni.Visible = false;
            txtDni.Visible = false;
            lblTicket.Visible = false;
            txtTicket.Visible = false;
            txtTicket.Text = "";
            btnGenerar.Visible = false;
        }

        protected void lbGenMostrarControles() {
            lblExito.Text = "";

            lblDni.Visible = true;
            txtDni.Visible = true;
            lblTicket.Visible = true;
            txtTicket.Visible = true;
            btnGenerar.Visible = true;
        }

        protected void mostrarTicket(string id) {
            if(lbl_MostrarTicket.Text == "") {
                DataTable ticket = func.ObtenerTablaSQL("SELECT T.Id, T.Patente, T.Entrada, F.Salida, F.Importe, F.Dni FROM Ticket T INNER JOIN Factura F ON F.Id = '" + id + "' WHERE T.Id = '" + id + "'", "Ticket");
                string patente = "";
                string dni = "";
                string entrada = "";
                string salida = "";
                string importe = "";

                foreach(DataRow row in ticket.Rows) {
                    id = row["Id"].ToString();
                    patente = row["Patente"].ToString();
                    dni = row["Dni"].ToString();
                    entrada = row["Entrada"].ToString();
                    salida = row["Salida"].ToString();
                    importe = row["Importe"].ToString();
                }

                lbl_MostrarTicket.Text = "Id: " + id + " <br /> Patente: " + patente + " <br /> DNI: " + dni + " <br /> Entrada: " + entrada + " <br /> Salida: " + salida + " <br /> Importe: " + importe;
            }
            else {
                lbl_MostrarTicket.Text = "";
            }
        }

        protected void mostrarCommand(object sender, GridViewCommandEventArgs e) {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            int index = row.RowIndex;
            string id = ((Label)grdFactura.Rows[index].FindControl("lbl_ID")).Text;

            mostrarTicket(id);
        }

        protected void grdFactura_RowCommand1(object sender, GridViewCommandEventArgs e) {
            if(e.CommandName == "mostrarCommand") {
                int fila = Convert.ToInt32(e.CommandArgument);
                string id = ((Label)grdFactura.Rows[fila].FindControl("lbl_ID")).Text;
                mostrarTicket(id);
            }
        }

        protected void grdFactura_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdFactura.PageIndex = e.NewPageIndex;

            func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
        }

        protected void grdFactura_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            lblError.Text = "";

            grdFactura.EditIndex = -1;

            func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
        }

        protected void grdFactura_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            string id = ((Label)grdFactura.Rows[e.RowIndex].FindControl("lbl_ID")).Text;

            SqlCommand cmd = new SqlCommand();
            SqlParameter param = new SqlParameter();
            param = cmd.Parameters.Add("@Id", SqlDbType.Int);
            param.Value = Convert.ToInt32(id);

            func.EjecutarSP(cmd, "SpDarBajaFactura");
            func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
        }

        protected void grdFactura_RowEditing(object sender, GridViewEditEventArgs e) {
            grdFactura.EditIndex = e.NewEditIndex;

            func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
        }

        protected void grdFactura_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            string id = ((Label)grdFactura.Rows[e.RowIndex].FindControl("lblEdnId")).Text;
            string dni = ((TextBox)grdFactura.Rows[e.RowIndex].FindControl("txtEdnDni")).Text;
            string salida = ((TextBox)grdFactura.Rows[e.RowIndex].FindControl("txtEdnSalida")).Text;

            if(dni == "" || salida == "") {
                lblError.Text = "Ingresar ámbos campos.";
            }
            else
            {
                func.EjecutarConsultaSQL("UPDATE Factura SET Dni = '" + dni + "', Salida = '" + salida + "' WHERE Id = " + id);

                grdFactura.EditIndex = -1;
                func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Ticket");
            }
        }

        protected void txtBuscarFactura_TextChanged(object sender, EventArgs e) {

        }

        protected void btnBuscar_Click(object sender, EventArgs e) {
            if(txtBuscarFactura.Text == "") {
                func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Estado = 1", "Factura");
            }
            else {
                func.LlenarGridView(grdFactura, "SELECT * FROM Factura WHERE Id LIKE '%" + txtBuscarFactura.Text + "%' AND Estado = 1", "Factura");
            }

            txtBuscarFactura.Text = "";
        }

        protected void grdFactura_RowDataBound(object sender, GridViewRowEventArgs e) {
            if(e.Row.RowType == DataControlRowType.DataRow) {
                LinkButton l = (LinkButton)e.Row.FindControl("lbBorrar");

                l.Attributes.Add("onclick", "javascript:return " + "confirm('Realmente quiere eliminar este registro?')");
            }
        }
    }
}