
namespace Entidades {
    class tipovehiculo {
        private int idtipovehiculo;
        private string descripciontipovehiculo;
        private int precioxhora;

        public tipovehiculo() {

        }

        public int getidtipovehiculo() {
            return idtipovehiculo;
        }

        public string getdescripciontipovehiculo() {
            return descripciontipovehiculo;
        }

        public int getprecioxhora() {
            return precioxhora;
        }

        public void setidtipovehiculo(int i) {
            idtipovehiculo = i;
        }

        public void setdescripciontipovehiculo(string des) {
            descripciontipovehiculo = des;
        }

        public void setprecioxhora(int i) {
            precioxhora= i;
        }
    }
}
