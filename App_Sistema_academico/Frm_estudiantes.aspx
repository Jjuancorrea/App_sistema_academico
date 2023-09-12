 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Frm_estudiantes.aspx.cs" Inherits="App_Sistema_academico.Frm_estudiantes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Estudiantes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <div class="wrapper bg-white">
    <div class="h2 text-center">Matrícula de estudiates</div>
    <form class="pt-3" runat="server">
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-address-card p-2"></span> 
                <asp:TextBox type="text" placeholder="Identificacion" ID="txtId" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-user p-2"></span>
                <asp:TextBox type="text" placeholder="Nombre completo" ID="txtNombre" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-phone p-2"></span>
                <asp:TextBox type="text" placeholder="Contacto" ID="txtContacto" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-globe p-2"></span>
                <asp:TextBox type="text" placeholder="Direccion" ID="txtDireccion" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-user p-2"></span>
                <asp:TextBox type="text" placeholder="Acudiente" ID="txtAcudiente" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-cash-register p-2"></span>
               <asp:DropDownList class="tb form-control" ID="cbx_estrato" runat="server" DataSourceID="SqlDataSourceEstrato" DataTextField="Nombre" DataValueField="PkId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceEstrato" runat="server" ConnectionString="<%$ ConnectionStrings:dbs_sistema_academicoConnectionString %>" SelectCommand="SELECT * FROM [tbl_estrato]"></asp:SqlDataSource>
            </div>
        </div>
         <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-venus-mars p-2"></span>
               <asp:DropDownList class="tb form-control" ID="cbx_sexo" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="PkId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbs_sistema_academicoConnectionString %>" ProviderName="<%$ ConnectionStrings:dbs_sistema_academicoConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tbl_sexo]"></asp:SqlDataSource>
            </div>
        </div>
        
        <asp:Button  class="btn btn-block text-center my-3" ID="btn_registrar" runat="server" Text="Registrar" OnClick="btn_registrar_Click"/>
        <asp:Button  class="btn btn-block  text-center my-3" ID="btn_consultar" runat="server" Text="Consultar" OnClick="btn_consultar_Click"/>
        <asp:Button class="btn btn-block  text-center my-3" ID="btn_limpiar" runat="server" Text="Limpiar" OnClick="btn_limpiar_Click" />
    <br />
                <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
    </form>
</div>
</body>
</html>
