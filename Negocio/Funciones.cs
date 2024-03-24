using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class Funciones
    {
        AccesoDatos conexion = new AccesoDatos();

        public int EjecutarConsultaSQL(string consulta)
        {
            return conexion.EjecutarConsulta(consulta);
        }

        public int EjecutarSelectSQL(string consulta)
        {
            return conexion.EjecutarSelect(consulta);
        }

        public DataTable ObtenerTablaSQL(string consulta, string tabla)
        {
            return conexion.ObtenerTabla(consulta, tabla);
        }

        public void LlenarGridView(System.Web.UI.WebControls.GridView GridView, string consulta, string tabla)
        {
            GridView.DataSource = conexion.ObtenerTabla(consulta, tabla);
            GridView.DataBind();
        }
    }
}
