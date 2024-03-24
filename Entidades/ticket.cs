
namespace Entidades {
    public class ticket {
        private int idticket;
        private string patenteticket;
        ///falta la hora de entrada
        
        public ticket() {

        }

        public int getidticket() {
            return idticket;
        }

        public string getpatenteticket() {
            return patenteticket;
        }

        public void setidticket(int id) {
            idticket = id;
        }

        public void setpatenteticket(string pat) {
            patenteticket = pat;
        }
    }
}
