using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Negocio;

namespace TP_Integrador {
    public partial class MenuClientes : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        FuncionesDatos func = new FuncionesDatos();

        string consultaGrd = "SELECT Dni, C.Nombre, Apellido, Telefono, L.NombreL, TC.Descripcion FROM Cliente C JOIN Localidad L ON C.IdLocalidad = L.Id JOIN TipoCliente TC ON C.IdTipo = TC.Id  WHERE C.Estado = 1";

        protected void Page_Load(object sender, EventArgs e) {
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente") <= 0) {
                lblAlert.Visible = true;

                lblId.Visible = false;
                txtBuscarCliente.Visible = false;
                btnBuscar.Visible = false;
                ddlBuscarTipo.Visible = false;
            }
            else {
                if(!IsPostBack) {
                    func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
                }
            }

            lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";
        }

        protected void lbReg_Click(object sender, EventArgs e) {
            if(lblDni.Visible == true) {
                lbRegOcultarControles();
            }
            else {
                lbRegMostrarControles();
            }
        }

        protected void lbRegMostrarControles() {
            lblDni.Visible = true;
            txtNombre.Visible = true;
            lblNombre.Visible = true;
            txtApellido.Visible = true;
            lblApellido.Visible = true;
            txtDni.Visible = true;
            lblLocalidad.Visible = true;
            ddlLocalidad.Visible = true;
            lblTipo.Visible = true;
            ddlTipo.Visible = true;
            txtTelefono.Visible = true;
            lblTelefono.Visible = true;
            btnRegistrar.Visible = true;
        }

        protected void lbRegOcultarControles() {
            lblDni.Visible = false;
            txtNombre.Visible = false;
            lblNombre.Visible = false;
            txtApellido.Visible = false;
            lblApellido.Visible = false;
            txtDni.Visible = false;
            lblLocalidad.Visible = false;
            ddlLocalidad.Visible = false;
            lblTipo.Visible = false;
            ddlTipo.Visible = false;
            txtTelefono.Visible = false;
            lblTelefono.Visible = false;
            btnRegistrar.Visible = false;

            lblError2.Text = "";
        }

        protected void btnAgregar_Click(object sender, EventArgs e) {
            if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Cliente WHERE Dni = " + txtDni.Text) == 1) {
                lblError2.Text = "DNI ya registrado.";
            }
            else {
                string consulta = "INSERT INTO Cliente(Dni, Nombre, Apellido, Telefono, IdLocalidad, IdTipo)"; 
                string consultaValues = " VALUES(" + txtDni.Text + ", '" + txtNombre.Text + "', '" + txtApellido.Text + "', '" + txtTelefono.Text + "', " + ddlLocalidad.SelectedValue.ToString() + ", " + ddlTipo.SelectedValue.ToString() + ")";

                func.EjecutarConsultaSQL(consulta + consultaValues);
                func.LlenarGridView(grdClientes, consultaGrd, "Cliente");

                btnAgregarLimpiarControles();
            }
        }

        protected void chBuscarTipo_CheckedChanged(object sender, EventArgs e) {
            if (chBuscarTipo.Checked) {
                ddlBuscarTipo.Enabled = true;
            }
            else {
                ddlBuscarTipo.Enabled = false;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e) {
            if(txtBuscarCliente.Text == "") {
                if(ddlBuscarTipo.Enabled == true) {
                    string consultaGrdAux = " AND C.IdTipo = " + ddlBuscarTipo.SelectedValue;
                    func.LlenarGridView(grdClientes, consultaGrd + consultaGrdAux, "Cliente");
                }
                else {
                    func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
                }

                txtBuscarCliente.Text = "";
            }
            else {
                string consultaGrdAux = "SELECT Dni, C.Nombre, Apellido, Telefono, L.NombreL, TC.Descripcion FROM Cliente C JOIN Localidad L ON C.IdLocalidad = L.Id JOIN TipoCliente TC ON C.IdTipo = TC.Id  WHERE Dni LIKE '%" + txtBuscarCliente.Text + "%' AND  C.Estado = 1";
             
                if(ddlBuscarTipo.Enabled == true) {
                    string consultaGrdAux2 = " AND C.IdTipo = " + ddlBuscarTipo.SelectedValue;
                    func.LlenarGridView(grdClientes, consultaGrdAux + consultaGrdAux2, "Cliente");
                }
                else {
                    func.LlenarGridView(grdClientes, consultaGrdAux, "Cliente");
                }
            }

            txtBuscarCliente.Text = "";
        }

        protected void btnAgregarLimpiarControles() {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtTelefono.Text = "";
        }

        protected void grdClientes_RowEditing(object sender, GridViewEditEventArgs e) {
            grdClientes.EditIndex = e.NewEditIndex;

            func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
        }

        protected void grdClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            lblError.Text = "";

            grdClientes.EditIndex = -1;

            func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
        }

        protected void grdClientes_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            string dni = ((Label)grdClientes.Rows[e.RowIndex].FindControl("lblEditDni")).Text;
            string nombre = ((TextBox)grdClientes.Rows[e.RowIndex].FindControl("txtEditNombre")).Text;
            string apellido = ((TextBox)grdClientes.Rows[e.RowIndex].FindControl("txtEditApellido")).Text;
            string telefono = ((TextBox)grdClientes.Rows[e.RowIndex].FindControl("txtEditTelefono")).Text;
            string localidad = ((DropDownList)grdClientes.Rows[e.RowIndex].FindControl("ddlEditLocalidad")).SelectedValue;
            string tipo = ((DropDownList)grdClientes.Rows[e.RowIndex].FindControl("ddlEditTipo")).SelectedValue;

            if(dni == "" || nombre == "" || apellido == "" || telefono == "" || localidad == "" || tipo == "") {
                lblError.Text = "Rellenar campos.";
            }
            else {
                lblError.Text = "";

                func.EjecutarConsultaSQL("UPDATE Cliente SET Nombre = '" + nombre + "', Apellido = '" + apellido + "', Telefono = '" + telefono + "', IdLocalidad = " + localidad + ", IdTipo = " + tipo + " WHERE Dni = " + dni);

                grdClientes.EditIndex = -1;
                func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
            }
        }

        protected void grdClient_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            string dni = ((Label)grdClientes.Rows[e.RowIndex].FindControl("lblItDni")).Text;

            SqlCommand cmd = new SqlCommand();
            SqlParameter param = new SqlParameter();
            param = cmd.Parameters.Add("@Dni", SqlDbType.Int);
            param.Value = Convert.ToInt32(dni);

            func.EjecutarSP(cmd, "SpDarBajaCliente");
            func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
        }

        protected void grdClientes_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdClientes.PageIndex = e.NewPageIndex;

            if (ddlBuscarTipo.Enabled == true) {
                string consultaGrdAux = " AND C.IdTipo = " + ddlBuscarTipo.SelectedValue;
                func.LlenarGridView(grdClientes, consultaGrd + consultaGrdAux, "Cliente");
            }
            else {
                func.LlenarGridView(grdClientes, consultaGrd, "Cliente");
            }
        }

        protected void grdClientes_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                LinkButton l = (LinkButton)e.Row.FindControl("lbBorrar");

                l.Attributes.Add("onclick", "javascript:return " + "confirm('Realmente quiere eliminar este registro?')");
            }
        }
    }
}