using Negocio;
using System;
using System.Data;

namespace TP_Integrador {
    public partial class WebForm1 : System.Web.UI.Page {
        Login login = new Login();
        FuncionesDatos func = new FuncionesDatos();

        protected void Page_Load(object sender, EventArgs e) {
            lblUsuario.Text = "Usuario: " + login.ObtenerUsuarioNombre((DataTable)Session["User"]) + " (Admin)";
            string consultaGrd = "Select Count(*) as Ingresos, sum(Importe) AS Importes from Factura Where Estado=1";
            string consultaGrd2 = "Select Count(*) as Membresias from Membresia where Estado=1 AND datediff(day, FechaInicio, '" + DateTime.Today.ToString("G") + "')>=0 AND datediff(day, FechaFinalizacion, '" + DateTime.Now.ToString("G") + "')<=0";
            string consultaGrd3 = "select ve.Patente, tv.Descripcion as Tipo,Count(*) as NIngresos " +
                "from Vehiculo as ve inner join Ticket as tk on tk.Patente = ve.Patente inner join TipoVehiculo as tv " +
                "on ve.IdTipo = tv.Id where tk.Estado = 1 " +
                "group by ve.Patente, tv.Descripcion";
            string consultaGrd4 = "select tc.Descripcion as Tipo, count(*) as CNumero from Cliente as cl inner join TipoCliente as tc on tc.Id = cl.IdTipo group by tc.Descripcion";
            string consultaGrd5 = "select tv.Descripcion as Tipo2, count(*) as VNumero from Vehiculo as ve inner join TipoVehiculo as tv on tv.Id = ve.IdTipo group by tv.Descripcion";
            if (!IsPostBack) {
                func.LlenarGridView(grdReportes, consultaGrd, "Factura");
                func.LlenarGridView(grdReportes2, consultaGrd2, "Membresia");
                func.LlenarGridView(grdReportes3, consultaGrd3, "Vehiculo");
                func.LlenarGridView(grdReportes4, consultaGrd4, "Cliente");
                func.LlenarGridView(grdReportes5, consultaGrd5, "Vehiculo");
            }
        }

        protected void grdReportes_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void Button1_Click(object sender, EventArgs e) {
            string consultaGrd = "Select Count(*) as Ingresos, sum(Importe) AS Importes from Factura where Estado=1";
            if (txtIni.Text == "" && txtFin.Text == "") {
                func.LlenarGridView(grdReportes, consultaGrd, "Factura");
                return;
            }
            if (txtIni.Text == "" || txtFin.Text == "") {
                lblError.Text = "Porfavor Ingrese ambas fechas";
                return;
            }
            lblError.Text = "";
            DateTime dtIni = DateTime.Parse(txtIni.Text);
            DateTime dtFin = DateTime.Parse(txtFin.Text);
            consultaGrd = "Select Count(*) as Ingresos, sum(Importe) AS Importes from Factura where Estado = 1 and datediff(day, Salida, '" + dtIni.ToString("yyyy/MM/dd") + "')<=0 AND datediff(day, Salida, '" + dtFin.ToString("yyyy/MM/dd") + "')>=0";
            func.LlenarGridView(grdReportes, consultaGrd, "Factura");
            txtFin.Text = "";
            txtIni.Text = "";
        }

        protected void btnFiltrar2_Click(object sender, EventArgs e) {
            string consultaGrd2 = "Select Count(*) as Membresias from Membresia where Estado=1 and datediff(day, FechaInicio, '" + DateTime.Today.ToString("G") + "')>=0 AND datediff(day, FechaFinalizacion, '" + DateTime.Now.ToString("G") + "')<=0";
            if (txtFecha.Text == "") {
                func.LlenarGridView(grdReportes2, consultaGrd2, "Membresia");
                return;
            }
            DateTime dtFecha = DateTime.Parse(txtFecha.Text);
            consultaGrd2 = "Select Count(*) as Membresias from Membresia where Estado=1 and datediff(day, FechaInicio, '" + dtFecha.ToString("yyyy/MM/dd") + "')>=0 AND datediff(day, FechaFinalizacion, '" + dtFecha.ToString("yyyy/MM/dd") + "')<=0";
            func.LlenarGridView(grdReportes2, consultaGrd2, "Membresia");
            txtFecha.Text = "";
        }

        protected void btnFiltrar3_Click(object sender, EventArgs e) {
            string consultaGrd3 = "select ve.Patente, tv.Descripcion as Tipo,Count(*) as NIngresos " +
                "from Vehiculo as ve inner join Ticket as tk on tk.Patente = ve.Patente inner join TipoVehiculo as tv " +
                "on ve.IdTipo = tv.Id where tk.Estado = 1 " +
                "group by ve.Patente, tv.Descripcion";
            if (txtIni2.Text == "" && txtFin2.Text == "") {
                func.LlenarGridView(grdReportes3, consultaGrd3, "Vehiculo");
                return;
            }
            if (txtIni2.Text == "" || txtFin2.Text == "") {
                lblError2.Text = "Porfavor Ingrese ambas fechas";
                return;
            }
            lblError2.Text = "";
            DateTime dtIni = DateTime.Parse(txtIni2.Text);
            DateTime dtFin = DateTime.Parse(txtFin2.Text);
            consultaGrd3 = "select ve.Patente, tv.Descripcion as Tipo,Count(*) as NIngresos " +
                "from Vehiculo as ve inner join Ticket as tk on tk.Patente = ve.Patente inner join TipoVehiculo as tv " +
                "on ve.IdTipo = tv.Id where tk.Estado = 1 and datediff(day, tk.Entrada, '" + dtIni.ToString("yyyy/MM/dd") + "')<=0 " +
                "AND datediff(day, tk.Entrada, '" + dtFin.ToString("yyyy/MM/dd") + "')>=0 group by ve.Patente, tv.Descripcion";
            func.LlenarGridView(grdReportes3, consultaGrd3, "Vehiculo");
            txtFin2.Text = "";
            txtIni2.Text = "";
        }
    }
}