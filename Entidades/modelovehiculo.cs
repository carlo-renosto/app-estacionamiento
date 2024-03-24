
namespace Entidades {
    public class modelovehiculo {
        private int idmarca;
        private int idmodelo;
        private string nombremodelo;

        public modelovehiculo() {

        }

        public int getidmarca() {
            return idmarca;
        }

        public int getidmodelo() {
            return idmodelo;
        }

        public string getnombremodelo() {
            return nombremodelo;
        }

        public void setidmarca(int m) {
            idmarca = m;
        }

        public void setidmodelo(int mo) {
            idmodelo = mo;
        }

        public void setnombremodelo(string modelo) {
            nombremodelo = modelo;
        }
    }
}
