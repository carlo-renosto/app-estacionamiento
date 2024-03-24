<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaInicio.aspx.cs" Inherits="TP_Integrador.PaginaInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .LabelMenu {
            display: block;
            font-size: 40px;
            position: relative;
            left: 39%;
        }
        .HyperLinks {
            display: block;
            width: 200px;
            font-size: 25px;
            position: relative;
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="Menú Inicio" Font-Bold="True" CssClass="LabelMenu" Width="1060px"></asp:Label>
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
        &nbsp;<asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="HyperLinks" NavigateUrl="~/MenuClientes.aspx">Menú Clientes</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="HyperLinks" NavigateUrl="~/MenuVehiculos.aspx">Menú Vehiculos</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="HyperLinks">Menú Membresias</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="HyperLinks" NavigateUrl="~/MenuTickets.aspx" ValidateRequestMode="Enabled">Menú Tickets</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="HyperLinks" NavigateUrl="~/MenuFacturas.aspx" ValidateRequestMode="Enabled">Menú Facturas</asp:HyperLink>
            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="HyperLinks" ValidateRequestMode="Enabled" NavigateUrl="~/MenuReportes.aspx">Menú Reportes</asp:HyperLink>
            <p style="margin-left: 40px">
            <br />
        &nbsp;&nbsp;&nbsp;
            </p>
        </div>
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
