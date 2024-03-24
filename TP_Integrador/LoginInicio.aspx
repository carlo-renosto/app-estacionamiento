<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginInicio.aspx.cs" Inherits="TP_Integrador.LoginInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .LabelMenu {
            display: block;
            text-align: center;
            font-size: 40px;
        }
        .LabelUsuario {
            display: inline-block;
            position: relative;
            left: 38%;
        }
        .DdlUsuario {
            display: inline-block;
            position: relative;
            left: 36%;
            width: 99px;
        }
        .LabelContraseña {
            display: inline-block;
            position: relative;
            left: 38%;
        }
        .TxtContraseña {
            display: inline-block;
            position: relative;
            left: 36%;
            width: 99px;
        }
        .RfvValidator {
            display: inline-block;
            position: absolute;
            left: 56%;
        }
        .LblError {
            display: inline-block;
            position: relative;
            left: 34%;
        }
        .BtnIngresar {
            display: block;
            position: relative;
            left: 47%;
            height: 30px;
            width: 90px;
        }
        .LblAlert {
            display: inline-block;
            position: relative;
            left: 36%;
        }
        .BtnRegistrar {
            display: inline-block;
            position: relative;
            left: 36%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="Inicio Sesión" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario" Font-Size="X-Large" Text="Usuario" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtUsuario" runat="server" CssClass="DdlUsuario"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="rfvIniciar" runat="server"  CssClass="RfvValidator" ControlToValidate="txtUsuario" ErrorMessage="Ingresar DNI." ForeColor="Red" ValidationGroup="ini">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblError0" runat="server" CssClass="LblError" ForeColor="Red"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblContraseña1" runat="server" CssClass="LabelContraseña" Font-Size="X-Large" Text="Contraseña" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtContraseña" runat="server" CssClass="TxtContraseña" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp; <asp:RequiredFieldValidator ID="rfvIniciar2" runat="server" CssClass="RfvValidator" ControlToValidate="txtContraseña" ErrorMessage="Ingresar contraseña." ForeColor="Red" ValidationGroup="ini">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server" CssClass="LblError" ForeColor="Red"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnIni" runat="server" CssClass="BtnIngresar" Text="Ingresar" ValidationGroup="ini" Font-Bold="False" Font-Size="Large" OnClick="btnIni_Click"/>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblAlert" runat="server" CssClass="LblAlert" Font-Size="Large" Text="No tiene una cuenta?"></asp:Label>
            &nbsp;<asp:LinkButton ID="lbRegistrar" runat="server" CssClass="BtnRegistrar" Font-Size="Large" OnClick="lbRegistrar_Click">Registrar</asp:LinkButton>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblUsuario2" runat="server" CssClass="LabelUsuario" Font-Size="X-Large" Text="Usuario" Font-Bold="True" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario2" runat="server" CssClass="TxtContraseña" Visible="False"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvIniciar3" runat="server"  CssClass="RfvValidator" ControlToValidate="txtUsuario2" ErrorMessage="Ingresar DNI." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError2" runat="server" CssClass="LblError" ForeColor="Red"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblContraseña2" runat="server" CssClass="LabelContraseña" Font-Size="X-Large" Text="Contraseña" Font-Bold="True" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtContraseña2" runat="server" CssClass="TxtContraseña" TextMode="Password" Visible="False"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="rfvIniciar5" runat="server" CssClass="RfvValidator" ControlToValidate="txtContraseña2" ErrorMessage="Ingresar contraseña." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblContraseña3" runat="server" CssClass="LabelContraseña" Font-Size="Larger" Text="Repita Contraseña" Font-Bold="True" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtContraseña3" runat="server" CssClass="TxtContraseña" TextMode="Password" Visible="False"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvIniciar6" runat="server" CssClass="RfvValidator" ControlToValidate="txtContraseña3" ErrorMessage="Repetir contraseña" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnReg" runat="server" CssClass="BtnIngresar" Text="Registrar" ValidationGroup="reg" Font-Bold="False" Font-Size="Large" OnClick="btnReg_Click" Visible="False"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server" CssClass="LblError" ForeColor="Red"></asp:Label>
            <asp:ValidationSummary ID="vsIniciar" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="ini"/>
            <asp:ValidationSummary ID="vsReg" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="reg"/>
        </div>
        <p>
&nbsp;</p>
    </form>
</body>
</html>
