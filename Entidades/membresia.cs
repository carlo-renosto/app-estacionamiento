
namespace Entidades {
    public class membresia {
        private int dnimembresia;
        private fecha fechainicio;
        private fecha fechafinalizacion;

        public membresia() { 

        }

        public int getdnimembresia() {
            return dnimembresia;
        }

        public fecha getfechainicio() {
            return fechainicio;
        }

        public fecha getfechafinalizacion() {
            return fechafinalizacion;
        }

        public void setdnimembresia(int d) {
            dnimembresia = d;
        }

        public void setfechainicion(fecha i) {
            fechainicio = i;
        }

        public void setfechafinalizacion(fecha f) {
            fechafinalizacion = f;
        }
    }
}
