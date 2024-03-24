<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuTickets.aspx.cs" Inherits="TP_Integrador.MenuTickets" %>

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
        .Membresias {
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
            <asp:HyperLink ID="HyperLink0" runat="server" CssClass="PaginaInicio" NavigateUrl="~/PaginaInicio.aspx" Width="150px" Font-Size="X-Large">Pagina inicio</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Clientes" NavigateUrl="~/MenuClientes.aspx" Width="100px" Font-Size="X-Large">Clientes</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Vehiculos" NavigateUrl="~/MenuVehiculos.aspx" Width="125px" Font-Size="X-Large">Vehiculos</asp:HyperLink>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Membresias" Width="150px" Font-Size="X-Large">Membresías</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="Facturas" NavigateUrl="~/MenuFacturas.aspx" Width="120px" Font-Size="X-Large">Facturas</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="TICKETS" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblId" runat="server" Text="ID "></asp:Label>
&nbsp;<asp:TextBox ID="txtBuscarTicket" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            <br />
            <br />
        <asp:GridView ID="grdTicket" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="grdTicket_PageIndexChanging" PageSize="2" OnRowCancelingEdit="grdTicket_RowCancelingEdit" OnRowDeleting="grdTicket_RowDeleting" OnRowEditing="grdTicket_RowEditing" OnRowUpdating="grdTicket_RowUpdating" OnRowDataBound="grdTicket_RowDataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbltId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Patente">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPat" runat="server" Text='<%# Bind("Patente") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItPat" runat="server" Text='<%# Bind("Patente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entrada">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditEnt" runat="server" TextMode="DateTime" Text='<%# Bind("Entrada") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItEntrada" runat="server" Text='<%# Bind("Entrada") %>'></asp:Label>
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
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblAlert" runat="server" CssClass="LabelAlert" Font-Size="X-Large" Text="Ningun ticket generado." Visible="False"></asp:Label>
            &nbsp;<asp:LinkButton ID="lbGen" runat="server" Font-Size="X-Large" OnClick="lbGen_Click">Generar Tickets</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblId0" runat="server" Font-Bold="True" Font-Size="X-Large" Text="ID" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtId0" runat="server" Enabled="False" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblPat" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Patente" Visible="False"></asp:Label>
            &nbsp;&nbsp;
            &nbsp;<asp:TextBox ID="txtPat" runat="server" Visible="False"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtPat" ErrorMessage="Ingresar patente." ForeColor="Red" ValidationGroup="pat">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblEnt" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Entrada" Visible="False"></asp:Label>
            &nbsp; <asp:TextBox ID="txtEnt" runat="server" Visible="False" Enabled="False" TextMode="DateTime" Width="120px"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" Visible="False" ValidationGroup="pat" />
            <br />
            <br />
        <asp:Label ID="lbl_MostrarTicket" runat="server"></asp:Label>
            <asp:ValidationSummary ID="vsGen" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="pat"/>
            <br />
    </form>
</body>
</html>
