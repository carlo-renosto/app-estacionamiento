
namespace Entidades {
    class tipocliente {
        private int idtipocliente;
        private string descripciontipocliente;

        public tipocliente() {

        }

        public int getidtipocliente() {
            return idtipocliente;
        }

        public string getdescripciontipocliente() {
            return descripciontipocliente;
        }

        public void setidetipocliente(int i) {
            idtipocliente = i;
        }

        public void setdescripciontipocliente(string des) {
            descripciontipocliente = des;
        }
    }
}
