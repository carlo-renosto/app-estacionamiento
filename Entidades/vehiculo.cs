
namespace Entidades {
    public class vehiculo {
        private string patentevehiculo;
        private string marcavehiculo;
        private string modelovehiculo;
        private string infovehiculo;
        private int idvechiculo;

        public vehiculo() {

        }

        public string getpatentevehiculo() {
            return patentevehiculo;
        }

        public string getmarcavehiculo() {
            return marcavehiculo;
        }

        public string getmodelovehiculo() {
            return modelovehiculo;
        }

        public string getinfovehiculo() {
            return infovehiculo;
        }

        public int getidvehiculo() {
            return idvechiculo;
        }

        public void setpatentevehiculo(string p ) {
            patentevehiculo = p;
        }

        public void setmarcavehiculo(string m ) {
            marcavehiculo = m;
        }

        public void setmodelovehiculo(string mv ) {
            modelovehiculo = mv;
        }

        public void setinfovehiculo(string i ) {
            infovehiculo = i;
        }

        public void setidvehiculo(int l) {
            idvechiculo = l;
        }
    }
}
