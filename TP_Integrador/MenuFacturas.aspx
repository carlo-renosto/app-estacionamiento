<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuFacturas.aspx.cs" Inherits="TP_Integrador.MenuFacturas" %>

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
        .Tickets {
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
            left: 1%;
            top: 1px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style8">
            <asp:HyperLink ID="HyperLink0" runat="server" CssClass="PaginaInicio" NavigateUrl="~/PaginaInicio.aspx" Width="150px" Font-Size="X-Large">Pagina inicio</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Clientes" NavigateUrl="~/MenuClientes.aspx" Width="120px" Font-Size="X-Large">Clientes</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Vehiculos" NavigateUrl="~/MenuVehiculos.aspx" Width="125px" Font-Size="X-Large">Vehiculos</asp:HyperLink>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Membresias" Width="150px" Font-Size="X-Large">Membresías</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="Tickets" NavigateUrl="~/MenuTickets.aspx" Width="100px" Font-Size="X-Large">Tickets</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            <br />
        </div>
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="FACTURAS" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblId" runat="server" Text="ID "></asp:Label>
&nbsp;<asp:TextBox ID="txtBuscarFactura" runat="server" OnTextChanged="txtBuscarFactura_TextChanged"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        <br />
        <br />
        <asp:GridView ID="grdFactura" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdFactura_PageIndexChanging" OnRowCancelingEdit="grdFactura_RowCancelingEdit" OnRowCommand="grdFactura_RowCommand1" OnRowDeleting="grdFactura_RowDeleting" OnRowEditing="grdFactura_RowEditing" OnRowUpdating="grdFactura_RowUpdating" OnRowDataBound="grdFactura_RowDataBound" AllowPaging="True" PageSize="2">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:Label ID="lblEdnId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_ID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdnDni" runat="server" Text='<%# Bind("Dni") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Dni" runat="server" Text='<%# Bind("Dni") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salida">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdnSalida" runat="server" Text='<%# Bind("Salida") %>' TextMode="DateTime"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Salida" runat="server" Text='<%# Bind("Salida") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Importe ($)">
                    <EditItemTemplate>
                        <asp:Label ID="lblEdnImporte" runat="server" Text='<%# Bind("Importe") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Importe" runat="server" Text='<%# Bind("Importe") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="mostrarCommand" Text="Mostrar" />
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
        <br />
            <asp:Label ID="lblAlert" runat="server" CssClass="LabelAlert" Font-Size="X-Large" Text="Ninguna factura generada." Visible="False"></asp:Label>
            &nbsp;&nbsp;
            <asp:LinkButton ID="lbGen" runat="server" Font-Size="X-Large" OnClick="lbGen_Click">Generar Facturas</asp:LinkButton>
            &nbsp;&nbsp;
            <asp:Label ID="lblExito" runat="server"></asp:Label>
            <br />
        <br />
            <asp:Label ID="lblDni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DNI" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:DropDownList ID="txtDni" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dni" DataValueField="Dni" Visible="False">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblTicket" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Ticket" Visible="False"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtTicket" runat="server" Visible="False"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblError3" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" Visible="False" />
        <br />
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT [Dni] FROM [Cliente]"></asp:SqlDataSource>
        <asp:Label ID="lbl_MostrarTicket" runat="server"></asp:Label>
        <br />
    </form>
</body>
</html>
