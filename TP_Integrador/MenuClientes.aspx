<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuClientes.aspx.cs" Inherits="TP_Integrador.MenuClientes" %>

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
        .Vehiculos {
            display: block;
            left: 10%;
        }
        .Membresias {
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
        </style>
</head>
<body>
    <form id="form1" runat="server" style="height: 96px">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Paginainicio" NavigateUrl="~/PaginaInicio.aspx" Width="150px" Font-Size="X-Large">Pagina inicio</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Vehiculos" NavigateUrl="~/MenuVehiculos.aspx" Width="125px" Font-Size="X-Large">Vehiculos</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Membresias" NavigateUrl="~/MenuMembresiasAdmin.aspx" Width="150px" Font-Size="X-Large">Membresías</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="Tickets" NavigateUrl="~/MenuTickets.aspx" Width="100px" Font-Size="X-Large">Tickets</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="Facturas" NavigateUrl="~/MenuFacturas.aspx" Width="120px" Font-Size="X-Large">Facturas</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
        &nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            <br />
            <div>
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="CLIENTES" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblId" runat="server" Text="DNI"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtBuscarCliente" runat="server"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                &nbsp;
                <asp:CheckBox ID="chBuscarTipo" runat="server" AutoPostBack="True" OnCheckedChanged="chBuscarTipo_CheckedChanged" />
&nbsp;<asp:DropDownList ID="ddlBuscarTipo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id" Enabled="False">
                </asp:DropDownList>
                <br />
                <br />
        <asp:GridView ID="grdClientes" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="grdClientes_PageIndexChanging" OnRowDeleting="grdClient_RowDeleting" OnRowCancelingEdit="grdClientes_RowCancelingEdit" OnRowEditing="grdClientes_RowEditing" OnRowUpdating="grdClientes_RowUpdating" OnRowDataBound="grdClientes_RowDataBound" PageSize="2">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditDni" runat="server" Text='<%# Bind("Dni") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItDni" runat="server" Text='<%# Bind("Dni") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Localidad">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditLocalidad" runat="server" DataSourceID="SqlDataSource2" DataTextField="NombreL" DataValueField="Id">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItLocalidad" runat="server" Text='<%# Bind("NombreL") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditTipo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItTipo" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
            <asp:Label ID="lblAlert" runat="server" CssClass="LabelAlert" Font-Size="X-Large" Text="Ningun ticket generado." Visible="False"></asp:Label>
            &nbsp;
                <asp:LinkButton ID="lbReg" runat="server" Font-Size="X-Large" OnClick="lbReg_Click">Registrar Clientes</asp:LinkButton>
                <br />
                <p>
            <asp:Label ID="lblDni" runat="server" Font-Bold="True" Font-Size="X-Large" Text="DNI" Visible="False"></asp:Label>
            &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="txtDni" runat="server" Visible="False"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingresar DNI." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                &nbsp;
                    <asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
                </p>
                <p>
            <asp:Label ID="lblNombre" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nombre" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:TextBox ID="txtNombre" runat="server" Visible="False"></asp:TextBox>
            &nbsp;
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingresar nombre." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:Label ID="lblApellido" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Apellido" Visible="False"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="txtApellido" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingresar apellido." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </p>
                <p>
            <asp:Label ID="lblTelefono" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Telefono" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtTelefono" runat="server" Visible="False"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar teléfono." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                </p>
                <p>
            <asp:Label ID="lblLocalidad" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Localidad" Visible="False"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlLocalidad" runat="server" DataSourceID="SqlDataSource2" DataTextField="NombreL" DataValueField="Id" Visible="False">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Ingresar localidad." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT * FROM [Localidad]"></asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <p>
            <asp:Label ID="lblTipo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Tipo" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id" Visible="False">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="ddlTipo" ErrorMessage="Ingresar tipo." ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT * FROM [TipoCliente]"></asp:SqlDataSource>
                </p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnAgregar_Click" Visible="False" ValidationGroup="reg" />
                <asp:ValidationSummary ID="vsReg" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="reg" />
            <br />
        </div>
    </form>
</body>
</html>
