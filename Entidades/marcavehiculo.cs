
namespace Entidades {
    public class marcavehiculo {
        private int idmarca;
        private string nombremarca;

        public marcavehiculo() {

        }

        public int getidmarca() {
            return idmarca;
        }

        public string getnombremarca() {
            return nombremarca;
        }

        public void setidmarca(int nro) {
            idmarca = nro;
        }

        public void setnombremarca(string nm) {
            nombremarca = nm;
        }
    }
}
