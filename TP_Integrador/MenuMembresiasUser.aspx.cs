using System;
using System.Data;
using Negocio;

namespace TP_Integrador {
    public partial class MenuMembresiasUser : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        FuncionesDatos func = new FuncionesDatos();
        protected void Page_Load(object sender, EventArgs e) {
            lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (No admin)";

            ocultarControles();
        }

        protected void ocultarControles() {
            HyperLink2.Visible = false;
            HyperLink3.Visible = false;
        }

        protected void lbRen_Click(object sender, EventArgs e) {
            if (lblDni.Visible == true) {
                lbRegOcultarControles();
            } 
            else {
                lbRegMostrarControles();
            }
        }

        protected void lbRegOcultarControles() {
            lblDni.Visible = false;
            txtDni.Visible = false;
            btnBuscarDni.Visible = false;

            lblIni.Visible = false;
            lblFin.Visible = false;
            txtIni.Visible = false;
            txtFin.Visible = false;
            btnRenovar.Visible = false;

            lblExito.Text = "";
        }

        protected void lbRegMostrarControles() {
            lblDni.Visible = true;
            txtDni.Visible = true;
            btnBuscarDni.Visible = true;
        }

        protected void btnBuscarDni_Click(object sender, EventArgs e) {
            lblError.Text = "";
            lblError2.Text = "";

            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente WHERE Dni =" + txtDni.Text + " AND Estado = 1") != 1) {
                lblError.Text = "DNI no registrado.";
                lblIni.Visible = false;
                lblFin.Visible = false;
                txtIni.Visible = false;
                txtFin.Visible = false;
                btnRenovar.Visible = false;
            } 
            else if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Membresia WHERE Dni =" + txtDni.Text + " AND Estado = 1") != 1) {
                lblError.Text = "El DNI registrado no posee una membresía.";
            } 
            else {
                lblIni.Visible = true;
                lblFin.Visible = true;
                txtIni.Visible = true;
                txtFin.Visible = true;
                btnRenovar.Visible = true;

                DataTable dtCliente = func.ObtenerTablaSQL("SELECT * FROM Membresia WHERE Dni = " + txtDni.Text, "Cliente");
                DateTime dtClienteFecha = DateTime.Parse(dtCliente.Rows[0][1].ToString());
                txtIni.Text = dtClienteFecha.ToString("yyyy/MM/dd");
            }
        }

        protected void btnRenovar_Click(object sender, EventArgs e) {
            DateTime dtHoy = DateTime.Parse(txtIni.Text);
            DateTime dtFin = DateTime.Parse(txtFin.Text);

            lblError.Text = "";
            lblError2.Text = "";

            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente WHERE Dni =" + txtDni.Text + " AND Estado = 1") != 1) {
                lblError.Text = "DNI no registrado. (Cliente)";
            } 
            else if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Membresia WHERE Dni =" + txtDni.Text + " AND Estado = 1") != 1) {
                lblError.Text = "El DNI registrado no posee una membresía.";
            } 
            else if (dtHoy >= dtFin) {
                lblError2.Text = "Fecha de finalización menor o igual a la fecha de inicio.";
            } 
            else {
                lblError.Text = "";
                lblError2.Text = "";

                func.EjecutarConsultaSQL("UPDATE Membresia SET FechaFinalizacion = '" + dtFin.ToString() + "' WHERE Dni = " + txtDni.Text);

                lbRegOcultarControles();
                lblExito.Text = "Membresía renovada exitosamente.";
            }
        }
    }
}