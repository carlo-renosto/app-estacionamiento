<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMembresiasAdmin.aspx.cs" Inherits="TP_Integrador.MenuMembresiasAdmin" %>

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
            left: -1%;
            top: 0px;
        }
        .LbReg {
            display: inline-block;
            position: relative;
            left: 5%;
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
            <asp:Label ID="lblId" runat="server" Text="DNI"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtBuscarMembresia" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscarMembresia" runat="server" Text="Buscar" OnClick="btnBuscarMembresia_Click" />
            &nbsp;&nbsp;<br />
            <br />
        <asp:GridView ID="grdMembresia" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="grdMembresia_RowDeleting" OnRowCancelingEdit="grdMembresia_RowCancelingEdit" OnRowEditing="grdMembresia_RowEditing" OnRowUpdating="grdMembresia_RowUpdating" AllowPaging="True" OnPageIndexChanging="grdMembresia_PageIndexChanging" OnRowDataBound="grdMembresia_RowDataBound" PageSize="2">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditDni" runat="server" Text='<%# Bind("Dni") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDni" runat="server" Text='<%# Bind("Dni") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Inicio">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditIni" runat="server" TextMode="DateTime" Text='<%# Bind("FechaInicio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelFechaIni" runat="server" Text='<%# Bind("FechaInicio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Fin">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditFin" runat="server" TextMode="DateTime" Text='<%# Bind("FechaFinalizacion") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelFechaFin" runat="server" Text='<%# Bind("FechaFinalizacion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbBorrar" CommandName="Delete" runat="server">Eliminar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError3" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblAlert" runat="server" CssClass="LabelAlert" Font-Size="X-Large" Text="Ninguna membresía registrada." Visible="False"></asp:Label>
            &nbsp;<asp:LinkButton ID="lbReg" runat="server" Font-Size="X-Large" OnClick="lbReg_Click">Registrar Membresías</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblDni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DNI" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="txtDni" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dni" DataValueField="Dni" Visible="False">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            &nbsp;<asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtDni" ErrorMessage="Ingresar DNI." ForeColor="Red" ValidationGroup="fecha">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblIni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fecha Inicio" Visible="False"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="txtIni" runat="server" Visible="False" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Label ID="lblFin" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Fecha Fin" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFin" runat="server" Visible="False" TextMode="Date"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtFin" ErrorMessage="Ingresar fecha." ForeColor="Red" ValidationGroup="fecha">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" ValidationGroup="fecha" Visible="False" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT [Dni] FROM [Cliente]"></asp:SqlDataSource>
            <asp:ValidationSummary ID="vsReg" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="fecha"/>
            <br />
    </form>
</body>
</html>
