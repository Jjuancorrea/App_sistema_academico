<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_matriculas.aspx.cs" Inherits="App_Sistema_academico.frm_matriculas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="wrapper bg-white">
    <div class="h2 text-center">Registrar matrículas</div>
    <form class="pt-3" runat="server">
        <div class="form-group py-2">
            <div class="input-field"> 
                <span class="fas fa-address-card p-2"></span> 
                <asp:TextBox type="text" placeholder="Número de matrícual" ID="txtPkn" runat="server"></asp:TextBox>
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
       
        
        <asp:Button  class="btn btn-block text-center my-3" ID="btn_registrar" runat="server" Text="Registrar" OnClick="btn_registrar_Click"/>
        <asp:Button  class="btn btn-block  text-center my-3" ID="btn_consultar" runat="server" Text="Consultar" OnClick="btn_consultar_Click"/>
        <asp:Button class="btn btn-block  text-center my-3" ID="btn_limpiar" runat="server" Text="Limpiar" OnClick="btn_limpiar_Click" />
    <br />
                <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
    </form>
</div>
</body>
</html>
