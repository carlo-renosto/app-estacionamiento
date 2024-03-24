using System.Data;
using System.Data.SqlClient;
using Dao;

namespace Negocio {
    public class FuncionesDatos {
        AccesoDatos conexion = new AccesoDatos();

        public int EjecutarConsultaSQL(string consulta) {
            return conexion.EjecutarConsulta(consulta);
        }

        public int EjecutarSelectSQL(string consulta) {
            return conexion.EjecutarSelect(consulta);
        }

        public int EjecutarSP(SqlCommand cmd, string nombreSp) {
            return conexion.EjecutarSP(cmd, nombreSp);
        }

        public DataTable ObtenerTablaSQL(string consulta, string tabla) {
            return conexion.ObtenerTabla(consulta, tabla);
        }

        public void LlenarGridView(System.Web.UI.WebControls.GridView GridView, string consulta, string tabla) {
            GridView.DataSource = conexion.ObtenerTabla(consulta, tabla);
            GridView.DataBind();
        }
    }
}
