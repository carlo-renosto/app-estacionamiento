<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuVehiculos.aspx.cs" Inherits="TP_Integrador.MenuVehiculos" %>

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
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="PaginaInicio" NavigateUrl="~/PaginaInicio.aspx" Width="150px" Font-Size="X-Large">Pagina inicio</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Clientes" NavigateUrl="~/MenuClientes.aspx" Width="110px" Font-Size="X-Large">Clientes</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Membresias" NavigateUrl="~/MenuMembresiasAdmin.aspx" Width="150px" Font-Size="X-Large">Membresías</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="Tickets" NavigateUrl="~/MenuTickets.aspx" Width="100px" Font-Size="X-Large">Tickets</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="Facturas" NavigateUrl="~/MenuFacturas.aspx" Width="120px" Font-Size="X-Large">Facturas</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="HyperLinkCambiar" NavigateUrl="~/LoginInicio.aspx">Cambiar</asp:HyperLink>
            <br />
            <br />
        </div>
            <asp:Label ID="lblMenuInicio" runat="server" Font-Overline="False" Font-Underline="True" Text="VEHICULOS" Font-Bold="True" CssClass="LabelMenu"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblpatente" runat="server" Text="Patente:"></asp:Label>
        &nbsp;<asp:TextBox ID="txtBuscarVehiculo" runat="server"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        &nbsp;
        <asp:CheckBox ID="chBuscarTipo" runat="server" AutoPostBack="True" OnCheckedChanged="chBuscarTipo_CheckedChanged" />
&nbsp;<asp:DropDownList ID="ddlBuscarTipo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id" Enabled="False">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="grdVehiculos" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None"  OnRowDeleting="grdVehiculos_RowDeleting" OnRowEditing="grdVehiculos_RowEditing" OnRowUpdating="grdVehiculos_RowUpdating" OnRowCancelingEdit="grdVehiculos_RowCancelingEdit" OnRowDataBound="grdVehiculos_RowDataBound" AllowPaging="True" OnPageIndexChanging="grdVehiculos_PageIndexChanging" PageSize="2">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Patente">
                    <ItemTemplate>
                        <asp:Label ID="lblpatente" runat="server" Text='<%# Bind("Patente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo de Vehiculo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddltipovehiculo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbldescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Marca">
                    <EditItemTemplate>
                        <asp:Label ID="lblmarca" runat="server" Text='<%# Bind("NombreMarca") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblnombremarca" runat="server" Text='<%# Bind("NombreMarca") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Modelo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlModelo" runat="server" DataSourceID="SqlDataSource2" DataTextField="NombreModelo" DataValueField="IdModelo">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombremodelo" runat="server" Text='<%# Bind("NombreModelo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Informacion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Info") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblinformacion" runat="server" Text='<%# Bind("info") %>'></asp:Label>
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
            <asp:Label ID="lblalert" runat="server" CssClass="LabelAlert" Font-Size="X-Large" Text="Ningun ticket generado." Visible="False"></asp:Label>
            &nbsp;&nbsp;
                <asp:LinkButton ID="lbRegistrarvehiculo" runat="server" Font-Size="X-Large" OnClick="lbReg_Click" ValidationGroup="grupo2">Registrar Vehiculo</asp:LinkButton>
                <br />
        <br />
        <asp:Label ID="lblpatente2" runat="server" Text="Patente:" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtpatente" runat="server" Visible="False" ValidationGroup="grupo1"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txtpatente" ErrorMessage="Ingresar patente." ValidationGroup="grupo1" ForeColor="Red">*</asp:RequiredFieldValidator>
        &nbsp;
        <asp:Label ID="lblerror2" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbltipo" runat="server" Text="Tipo de Vehiculo:" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="ddltipodevehiculo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Id" Visible="False">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT [Descripcion], [Id] FROM [TipoVehiculo]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblmodelo2" runat="server" Text="Modelo:" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlmodelo" runat="server" DataSourceID="SqlDataSource2" Visible="False" DataTextField="NombreModelo" DataValueField="IdModelo">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EstacionamientoConnectionString %>" SelectCommand="SELECT [NombreModelo], [IdModelo], [IdMarca] FROM [ModeloVehiculo]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblinfo" runat="server" Text="Informacion:" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtinfo" runat="server" Visible="False" ValidationGroup="grupo1"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtinfo" ErrorMessage="Ingresar información." ValidationGroup="grupo1" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" Visible="False" ValidationGroup="reg" />
        <br />
        <asp:ValidationSummary ID="vs1" runat="server" ValidationGroup="grupo1" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
