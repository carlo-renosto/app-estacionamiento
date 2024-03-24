
namespace Entidades {
    class usuario {
        private string nombre;
        private string contraseña;
        private bool esAdmin;

        public usuario() {

        }

        public void setNombre(string n) {
            nombre = n;
        }

        public string getNombre() {
            return nombre;
        }

        public void setContraseña(string c) {
            contraseña = c;
        }

        public string getContraseña() {
            return contraseña;
        }

        public void setAdmin(bool a) {
            esAdmin = a;
        }

        public bool getAdmin() {
            return esAdmin;
        }
    }
}
