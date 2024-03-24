
namespace Entidades {
    public class cliente {
        private string nombre;
        private string apellido;
        private int dni;
        private int idlocalidad;
        private int telefono;
        private int idtipo;

        public cliente() { 
        
        }

        public string getnombre() {
            return nombre;
        }

        public string getapellido() {
            return apellido;
        }

        public int getdni() {
            return dni;
        }

        public int getidlocalidad() {
            return idlocalidad;
        }

        public int gettelefono() {
            return telefono;
        }

        public int getidtipo() {
            return idtipo;
        }

        public void setnombre(string nom) {
            nombre = nom;
        }

        public void setapellido(string ape) {
            apellido = ape;
        }

        public void setdni(int nro) {
            dni = nro;
        }

        public void setidlocalidad(int loc) {
            idlocalidad = loc;
        }

        public void settelefono(int tel) {
            telefono = tel;
        }

        public void setidtipo(int id) {
            idtipo = id;
        }
    }
}
