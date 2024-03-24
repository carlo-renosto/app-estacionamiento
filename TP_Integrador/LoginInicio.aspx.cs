using System;
using Negocio;

namespace TP_Integrador {
    public partial class LoginInicio : System.Web.UI.Page {
        Login login = new Login();
        FuncionesDatos func = new FuncionesDatos();

        protected void Page_Load(object sender, EventArgs e) {

        }
  
        protected void btnIni_Click(object sender, EventArgs e) {
            lblError0.Text = "";
            lblError.Text = "";
            if(login.IniciarSesion(txtUsuario.Text, txtContraseña.Text) == 1) {
                lblError.Text = "";

                Session["User"] = null;
                Session["User"] = login.ObtenerUsuario("SELECT * FROM Usuario WHERE Nombre = '" + txtUsuario.Text + "'" + "AND Contraseña = '" + txtContraseña.Text + "'", "Usuario");
                Response.Redirect("PaginaInicio.aspx");
            }
            else if(func.EjecutarSelectSQL("SELECT COUNT(*) FROM Usuario WHERE Nombre ='" + txtUsuario.Text + "'") != 1) {
                lblError0.Text = "Nombre no registrado.";
            }
            else {
                lblError.Text = "Contraseña incorrecta.";
            }
        }

        protected void lbRegistrar_Click(object sender, EventArgs e) {
            if(lblUsuario2.Visible == false) {
                lbRegistrarChecked();
            }
            else {
                lbRegistrarUnchecked();
            }
        }

        protected void lbRegistrarChecked() {
            lblUsuario2.Visible = true;
            txtUsuario2.Visible = true;
            lblContraseña2.Visible = true;
            txtContraseña2.Visible = true;
            btnReg.Visible = true;
            lblContraseña3.Visible= true;
            txtContraseña3.Visible = true;
        }

        protected void lbRegistrarUnchecked() {
            lblUsuario2.Visible = false;
            txtUsuario2.Visible = false;
            lblContraseña2.Visible = false;
            txtContraseña2.Visible = false;
            btnReg.Visible = false;
            lblContraseña3.Visible = false;
            txtContraseña3.Visible = false;
        }

        protected void btnReg_Click(object sender, EventArgs e) {
            if (login.ConsultarUsuario(txtUsuario2.Text) == 1) {
                lblError2.Text = "Usuario ya registrado.";
            }
            else {
                lblError2.Text = "";
                lblExito.Text = "Usuario registrado exitosamente.";

                login.RegistrarUsuario(txtUsuario2.Text, txtContraseña2.Text, false, true);

                txtUsuario.Text = txtUsuario2.Text;
                txtContraseña.Text = txtContraseña2.Text;

                txtUsuario2.Text = "";
                txtContraseña2.Text = "";
            }
        }
    }
}