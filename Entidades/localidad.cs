
namespace Entidades {
    public class localidad {
        private int idlocalidad;
        private string nombrelocalidad;

        public localidad() {

        }

        public int getidlocalidad() {
            return idlocalidad;
        }

        public string getNombrelocalidad() {
            return nombrelocalidad;
        }

        public void setidlocalidad(int nro) {
            idlocalidad = nro;
        }

        public void setnombrelocalidad(string nom) {
            nombrelocalidad = nom;
        }
    }
}
