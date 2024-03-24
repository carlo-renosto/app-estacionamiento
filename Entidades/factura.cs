
namespace Entidades {
    public class factura {
        private int idfactura;
        private int dnifactura;
        private float importefactura;
        /// falta la hora de salida

        public factura() {

        }

        public int getidfactura() {
            return idfactura;
        }

        public int getdnifactura() {
            return dnifactura;
        }

        public float getimportefactura() {
            return importefactura;
        }

        public void setidfactura(int nro) {
            idfactura = nro;
        }

        public void setdnifactura(int n) {
            dnifactura = n;
        }

        public void setimportefactura(int i) {
            importefactura = i;
        }
    }
}
