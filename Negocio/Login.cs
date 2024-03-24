using System.Data;
using Dao;

namespace Negocio {
    public class Login {
        AccesoDatos conexion = new AccesoDatos();
        public int IniciarSesion(string nombre, string psw) {
            return conexion.ConsultaLogin(nombre, psw);
        }

        public int ConsultarUsuario(string nombre) {
            return conexion.ConsultaLoginNombre(nombre);
        }

        public void RegistrarUsuario(string nombre, string psw, bool admin, bool estado) {
            conexion.RegistrarUsuario(nombre, psw, admin, estado);
        }

        public DataTable ObtenerUsuario(string consulta, string nombreTabla) {
            return conexion.ObtenerTabla(consulta, nombreTabla);
        }

        public string ObtenerUsuarioNombre(DataTable dt) {
            return dt.Rows[0][0].ToString();
        }

        public string ObtenerUsuarioContraseña(DataTable dt) {
            return dt.Rows[0][1].ToString();
        }

        public string ObtenerUsuarioEsAdmin(DataTable dt) {
            return dt.Rows[0][2].ToString();
        }
    }
}
