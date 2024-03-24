using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TP_Integrador {
    public partial class MenuMembresiasAdmin : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        Negocio.FuncionesDatos func = new Negocio.FuncionesDatos();

        protected void Page_Load(object sender, EventArgs e) {
            lblError3.Text = "";

            lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";

            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Membresia") <= 0) {
                lblAlert.Visible = true;

                lblId.Visible = false;
                txtBuscarMembresia.Visible = false;
                btnBuscarMembresia.Visible = false;
            } else {
                lbReg.CssClass = "LbReg";

                if (!IsPostBack) {
                    func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
                }
            }
        }

        protected void lbReg_Click(object sender, EventArgs e) {
            if (lblDni.Visible == true) {
                lbRegOcultarControles();
            } else {
                lbRegMostrarControles();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e) {
            DateTime dtHoy = DateTime.Today;
            DateTime dtFin = DateTime.Parse(txtFin.Text);

            lblError.Text = "";
            lblError2.Text = "";

            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente WHERE Dni =" + txtDni.SelectedValue) != 1) {
                lblError.Text = "DNI no registrado.";
            } else if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Membresia WHERE Dni =" + txtDni.SelectedValue) == 1) {
                lblError.Text = "DNI ya registrado.";
            } else if (dtHoy >= dtFin) {
                lblError2.Text = "Fecha de finalización menor o igual a la fecha de inicio.";
            } else {
                lblError.Text = "";
                lblError2.Text = "";

                func.EjecutarConsultaSQL("INSERT INTO Membresia VALUES(" + txtDni.SelectedValue + ", '" + dtHoy.ToString("yyyy/MM/dd") + "', '" + dtFin.ToString("yyyy/MM/dd") + "', 1)");

                Response.Redirect("MenuMembresiasAdmin.aspx");
            }
        }

        protected void btnBuscarMembresia_Click(object sender, EventArgs e) {
            if (txtBuscarMembresia.Text == "") {
                func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
            } else {
                func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Dni LIKE '%" + txtBuscarMembresia.Text + "%' AND Estado = 1", "Membresia");
            }

            txtBuscarMembresia.Text = "";
        }

        protected void lbRegOcultarControles() {
            lblDni.Visible = false;
            lblIni.Visible = false;
            lblFin.Visible = false;
            txtDni.Visible = false;
            txtIni.Visible = false;
            txtFin.Visible = false;
            btnRegistrar.Visible = false;
        }

        protected void lbRegMostrarControles() {
            lblDni.Visible = true;
            lblIni.Visible = true;
            lblFin.Visible = true;
            txtDni.Visible = true;
            txtIni.Visible = true;
            txtFin.Visible = true;
            btnRegistrar.Visible = true;
        }

        protected void grdMembresia_RowEditing(object sender, GridViewEditEventArgs e) {
            grdMembresia.EditIndex = e.NewEditIndex;

            func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
        }

        protected void grdMembresia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            lblError3.Text = "";

            grdMembresia.EditIndex = -1;

            func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
        }

        protected void grdMembresia_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            string dni = ((Label)grdMembresia.Rows[e.RowIndex].FindControl("lblEditDni")).Text;
            string fechaIni = ((TextBox)grdMembresia.Rows[e.RowIndex].FindControl("txtEditIni")).Text;
            string fechaFin = ((TextBox)grdMembresia.Rows[e.RowIndex].FindControl("txtEditFin")).Text;

            if (fechaIni == "" || fechaFin == "") {
                lblError3.Text = "Ingresar ámbos campos.";
            } else {
                DateTime dtIni = DateTime.Parse(fechaIni);
                DateTime dtFin = DateTime.Parse(fechaFin);

                if (dtIni >= dtFin) {
                    lblError3.Text = "Fecha de finalización menor o igual a la fecha de inicio.";
                } else {
                    lblError3.Text = "";

                    func.EjecutarConsultaSQL("UPDATE Membresia SET FechaInicio = '" + dtIni.ToString("yyyy/MM/dd") + "', FechaFinalizacion = '" + dtFin.ToString("yyyy/MM/dd") + "' WHERE Dni = " + dni);

                    grdMembresia.EditIndex = -1;
                    func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
                }
            }
        }

        protected void grdMembresia_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            string dni = ((Label)grdMembresia.Rows[e.RowIndex].FindControl("LabelDni")).Text;

            SqlCommand cmd = new SqlCommand();
            SqlParameter param = new SqlParameter();
            param = cmd.Parameters.Add("@Dni", SqlDbType.Int);
            param.Value = Convert.ToInt32(dni);

            func.EjecutarSP(cmd, "SpDarBajaMembresia");
            func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
        }

        protected void grdMembresia_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdMembresia.PageIndex = e.NewPageIndex;

            func.LlenarGridView(grdMembresia, "SELECT * FROM Membresia WHERE Estado = 1", "Membresia");
        }

        protected void grdMembresia_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                LinkButton l = (LinkButton)e.Row.FindControl("lbBorrar");

                l.Attributes.Add("onclick", "javascript:return " + "confirm('Realmente quiere eliminar este registro?')");
            }
        }
    }
}