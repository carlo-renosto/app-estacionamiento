using System;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace TP_Integrador {
    public partial class MenuVehiculos : System.Web.UI.Page {
        Negocio.Login login = new Negocio.Login();
        FuncionesDatos func = new FuncionesDatos();

        string consulta = "SELECT VE.Patente, TV.Descripcion, MAR.NombreMarca, MV.NombreModelo, VE.Info FROM Vehiculo VE JOIN TipoVehiculo TV ON VE.IdTipo = TV.Id JOIN MarcaVehiculo MAR ON VE.IdMarca = MAR.IdMarca JOIN ModeloVehiculo MV ON VE.IdModelo = MV.IdModelo WHERE VE.Estado = 1";

        protected void Page_Load(object sender, EventArgs e) {
            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Vehiculo") <= 0) {
                lblalert.Visible = true;

                lblpatente.Visible = false;
                txtBuscarVehiculo.Visible = false;
                btnBuscar.Visible = false;
            } 
            else {
                if (!IsPostBack) {
                    func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
                }
            }

            lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";
        }

        protected void lbReg_Click(object sender, EventArgs e) {
            if (lblpatente2.Visible == true) {
                lbRegOcultarControles();
            } 
            else {
                lbRegMostrarControles();
            }
        }
        protected void lbRegMostrarControles() {
            lblpatente2.Visible = true;
            txtpatente.Visible = true;
            lblinfo.Visible = true;
            txtinfo.Visible = true;
            lblmodelo2.Visible = true;
            ddlmodelo.Visible = true;
            lbltipo.Visible = true;
            ddltipodevehiculo.Visible = true;
            btnRegistrar.Visible = true;
        }

        protected void lbRegOcultarControles() {
            lblpatente2.Visible = false;
            txtpatente.Visible = false;
            lblinfo.Visible = false;
            txtinfo.Visible = false;
            lblmodelo2.Visible = false;
            ddlmodelo.Visible = false;
            lbltipo.Visible = false;
            ddltipodevehiculo.Visible = false;
            btnRegistrar.Visible = false;

            lblerror2.Text = "";
        }

        protected void btnRegistrar_Click(object sender, EventArgs e) {
            if (func.EjecutarSelectSQL("SELECT COUNT(*) FROM Vehiculo WHERE Patente = '" + txtpatente.Text + "'") == 1) {
                lblerror2.Text = "Patente ya registrada.";
            } 
            else {
                DataTable dtVehiculo = func.ObtenerTablaSQL("SELECT IdMarca FROM ModeloVehiculo WHERE IdModelo = " + ddlmodelo.SelectedValue, "ModeloVehiculo");

                string consultaVeh = "INSERT INTO Vehiculo(Patente, IdTipo, IdMarca, IdModelo, Info)";
                string consultaVehValues = " VALUES('" + txtpatente.Text + "', " + ddltipodevehiculo.SelectedValue + ", " + dtVehiculo.Rows[0][0] + ", " + ddlmodelo.SelectedValue + ", '" + txtinfo.Text + "')";

                func.EjecutarConsultaSQL(consultaVeh + consultaVehValues);

                func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");

                lbRegOcultarControles();
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
            if (txtBuscarVehiculo.Text == "") {
                if (ddlBuscarTipo.Enabled == true) {
                    string consultaAux = " AND TV.Id = " + ddlBuscarTipo.SelectedValue;
                    func.LlenarGridView(grdVehiculos, consulta + consultaAux, "Vehiculo");
                } 
                else {
                    func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
                }
            } 
            else {
                if (ddlBuscarTipo.Enabled == true) {
                    string consultaAux = "SELECT VE.Patente, TV.Descripcion, MAR.NombreMarca, MV.NombreModelo, VE.Info FROM Vehiculo VE JOIN TipoVehiculo TV ON VE.IdTipo = TV.Id JOIN MarcaVehiculo MAR ON VE.IdMarca = MAR.IdMarca JOIN ModeloVehiculo MV ON VE.IdModelo = MV.IdModelo WHERE Ve.Patente LIKE '%" + txtBuscarVehiculo.Text + "%' AND VE.Estado = 1";
                    string consultaAux2 = " AND TV.Id = " + ddlBuscarTipo.SelectedValue;
                    func.LlenarGridView(grdVehiculos, consultaAux + consultaAux2, "Vehiculo");
                } 
                else {
                    func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
                }
            }

            txtBuscarVehiculo.Text = "";
        }

        protected void grdVehiculos_RowEditing(object sender, GridViewEditEventArgs e) {
            grdVehiculos.EditIndex = e.NewEditIndex;
            func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");

        }

        protected void grdVehiculos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            lblerror.Text = "";

            grdVehiculos.EditIndex = -1;

            func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
        }

        protected void grdVehiculos_RowUpdating(object sender, GridViewUpdateEventArgs e) {

            string pat = ((Label)grdVehiculos.Rows[e.RowIndex].FindControl("lblpatente")).Text;
            string tipo = ((DropDownList)grdVehiculos.Rows[e.RowIndex].FindControl("ddltipovehiculo")).SelectedValue;
            string marca = ((Label)grdVehiculos.Rows[e.RowIndex].FindControl("lblmarca")).Text;
            string modelo = ((DropDownList)grdVehiculos.Rows[e.RowIndex].FindControl("ddlModelo")).SelectedValue;
            string info = ((TextBox)grdVehiculos.Rows[e.RowIndex].FindControl("TextBox2")).Text;

            if (pat == "" || info == "") {
                lblerror.Text = "Rellenar campos.";
            } 
            else {
                DataTable dtVehiculo = func.ObtenerTablaSQL("SELECT IdMarca FROM ModeloVehiculo WHERE IdModelo = " + modelo, "ModeloVehiculo");

                func.EjecutarConsultaSQL("UPDATE Vehiculo SET IdTipo = " + tipo + ", IdMarca = " + dtVehiculo.Rows[0][0] + ", IdModelo = " + modelo + ", Info = '" + info + "' WHERE Patente = '" + pat + "' ");

                grdVehiculos.EditIndex = -1;
                func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");

                lblerror.Text = "";
            }
        }

        protected void grdVehiculos_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            string s_patente = ((Label)grdVehiculos.Rows[e.RowIndex].FindControl("lblpatente")).Text;
            func.EjecutarConsultaSQL("UPDATE Vehiculo SET Estado = 0 WHERE Patente = '" + s_patente + "'");
            func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
        }

        protected void grdVehiculos_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdVehiculos.PageIndex = e.NewPageIndex;

            if (ddlBuscarTipo.Enabled == true) {
                string consultaAux = " AND TV.Id = " + ddlBuscarTipo.SelectedValue;
                func.LlenarGridView(grdVehiculos, consulta + consultaAux, "Vehiculo");
            } 
            else {
                func.LlenarGridView(grdVehiculos, consulta, "Vehiculo");
            }
        }

        protected void grdVehiculos_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                LinkButton l = (LinkButton)e.Row.FindControl("lbBorrar");

                l.Attributes.Add("onclick", "javascript:return " + "confirm('Realmente quiere eliminar este registro?')");
            }
        }
    }
}