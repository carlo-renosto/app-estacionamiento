<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMembresiasUser.aspx.cs" Inherits="TP_Integrador.MenuMembresiasUser" %>

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
        .PaginaInicio {
            display: block;
            left: 0%;
        }
        .Clientes {
            display: block;
            left: 10%;
        }
        .Vehiculos {
            display: block;
            left: 20%;
        }
        .Tickets {
            display: block;
            left: 30%;
        }
        .Facturas {
            display: block;
            left: 40%;
        }
         .LabelUsuario {
            display: inline-block;
            position: absolute;
            left: 80%;
        }
        .HyperLinkCambiar {
            display:inline-block;
            position: absolute;
            left: 92%;
        }
        .LabelAlert {
            display: inline-block;
            position: relative;
            left: 0%;
        }
        .LbReg {
            display: inline-block;
            position: relative;
            left: 0%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="PaginaInicio" NavigateUrl="~/PaginaInicio.aspx" Width="150px" Font-Size="X-Large">Pagina inicio</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Clientes" NavigateUrl="~/MenuClientes.aspx" Width="110px" Font-Size="X-Large">Clientes</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Vehiculos" NavigateUrl="~/MenuVehiculos.aspx" Width="125px" Font-Size="X-Large">Vehiculos</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="Tickets" NavigateUrl="~/MenuTickets.aspx" Width="100px" Font-Size="X-Large">Tickets</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="Facturas" NavigateUrl="~/MenuFacturas.aspx" Width="120px" Font-Size="X-Large">Facturas</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="MEMBRESIAS" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;
            &nbsp;&nbsp;<br />
        <br />
            <br />
            <asp:LinkButton ID="lbRen" runat="server" CssClass="LbReg" Font-Size="X-Large" OnClick="lbRen_Click">Renovar</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblDni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DNI Cliente" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDni" runat="server" Visible="False" Width="100px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtDni" ErrorMessage="Ingresar DNI." ForeColor="Red" ValidationGroup="bus">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnBuscarDni" runat="server" Text="Buscar" Visible="False" OnClick="btnBuscarDni_Click" ValidationGroup="bus" />
            <br />
            <asp:ValidationSummary ID="vsBus" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="bus"/>
            <br />
            <asp:Label ID="lblIni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fecha Inicio" Visible="False"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="txtIni" runat="server" Visible="False" Enabled="False" Width="95px"></asp:TextBox>
            <br />
            <asp:Label ID="lblFin" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fecha Fin" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFin" runat="server" Visible="False" TextMode="Date" Width="95px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtFin" ErrorMessage="Ingresar fecha." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRenovar" runat="server" OnClick="btnRenovar_Click" Text="Renovar" ValidationGroup="reg" Visible="False" />
            &nbsp;&nbsp;&nbsp;
            <asp:ValidationSummary ID="vsReg" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="reg"/>
            <br />
    </form>
</body>
</html>
