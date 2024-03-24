using System;
using System.Data;
using System.Data.SqlClient;

namespace Dao {
    public class AccesoDatos {
        private static string rutaConexion = @"Data Source=localhost;Initial Catalog=Estacionamiento;Integrated Security=True";

        public string ObtenerConexion() {
            return rutaConexion;
        }

        public DataTable CrearTabla() {
            DataTable dt = new DataTable();
            DataColumn col = new DataColumn("UserType", System.Type.GetType("System.String"));
            dt.Columns.Add(col);
            col = new DataColumn("Psw", System.Type.GetType("System.String"));
            dt.Columns.Add(col);
            return dt;
        }

        public DataTable ObtenerTabla(string consultaSQL, string nombreTabla) {
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, conn);
            DataSet ds = new DataSet();
            adap.Fill(ds, "nombreTabla");
            conn.Close();
            return ds.Tables["nombreTabla"];
        }

        public void AgregarFila(DataTable tabla, string usertype, string psw) {
            DataRow dr = tabla.NewRow();
            dr["UserType"] = usertype;
            dr["Psw"] = psw;
            tabla.Rows.Add(dr);
        }

        public int EjecutarConsulta(string consultaSQL) {
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            SqlCommand cmd = new SqlCommand(consultaSQL, conn);
            int filas = (int)cmd.ExecuteNonQuery();
            conn.Close();
            return filas;
        }

        public int EjecutarSelect(string consultaSQL) { // Devuelve un valor para consultas SELECT (Usar SELECT COUNT(*))
            int contador;
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            SqlCommand cmd = new SqlCommand(consultaSQL, conn);
            contador = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return contador;
        }

        public int EjecutarSP(SqlCommand Comando, string NombreSP) {
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            int filas = cmd.ExecuteNonQuery();
            conn.Close();
            return filas;
        }

        public int ConsultaLogin(string nombre, string contra) {
            int contador;
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            string consulta = "SELECT count(*) FROM Usuario WHERE Nombre='"+nombre+"'"+"AND Contraseña='"+contra+"'";
            SqlCommand cmd = new SqlCommand(consulta, conn);
            contador = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return contador;
        }

        public int ConsultaLoginNombre(string nombre) {
            int contador;
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.Open();
            string consulta = "SELECT count(*) FROM Usuario WHERE Nombre='" + nombre + "'";
            SqlCommand cmd = new SqlCommand(consulta, conn);
            contador = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return contador;
        }

        public void RegistrarUsuario(string nombre, string psw, bool admin, bool estado) {
            SqlCommand cmd = new SqlCommand();
            SqlParameter param = new SqlParameter();

            param = cmd.Parameters.Add("@NombreU", SqlDbType.VarChar);
            param.Value = nombre;

            param = cmd.Parameters.Add("@ContraseñaU", SqlDbType.VarChar);
            param.Value = psw;

            param = cmd.Parameters.Add("@EsAdmin", SqlDbType.Bit);
            param.Value = admin;

            param = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            param.Value = estado;

            EjecutarSP(cmd, "SpUsuarioInsertar");
        }
    }
}
