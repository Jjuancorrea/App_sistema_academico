using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Sistema_academico
{
    public partial class Frm_estudiantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    // Crear una instancia de cls_conexion
                    cls_conexion conexion = new cls_conexion();
                    // Abrir la conexión
                    conexion.connection.Open();
                    string procedimientoAlmacenado = "SP_consultarSexo"; // Nombre de tu procedimiento almacenado
                    using (SqlCommand cmd = new SqlCommand(procedimientoAlmacenado, conexion.connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        // Crear un adaptador de datos para cargar los resultados en un DataSet
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        // Verifica si el DataSet contiene datos antes de enlazarlo
                        if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                        {
                            // Enlazar el DropDownList con los datos del DataSet
                            cbx_sexo.DataSource = dataSet.Tables[0];
                            cbx_sexo.DataTextField = "Nombre"; // El campo que quieres mostrar en el DropDownList
                            cbx_sexo.DataValueField = "PkId"; // El valor que deseas obtener al seleccionar un elemento
                            cbx_sexo.DataBind();
                        }
                        else
                        {
                            // Manejar la situación en la que no se encontraron datos
                            cbx_sexo.Items.Clear();
                            cbx_sexo.Items.Add(new ListItem("No se encontraron datos", "0"));
                        }
                    }
                    // Cerrar la conexión
                    conexion.connection.Close();
                }
                catch (Exception) { lbl_mensaje.Text = "Error"; }
            }
            if (!IsPostBack)
            {
                try
                {
                    // Crear una instancia de cls_conexion
                    cls_conexion conexion = new cls_conexion();
                    // Abrir la conexión
                    conexion.connection.Open();
                    string procedimientoAlmacenado = "SP_consultarEstrato"; // Nombre de tu procedimiento almacenado
                    using (SqlCommand cmd = new SqlCommand(procedimientoAlmacenado, conexion.connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        // Crear un adaptador de datos para cargar los resultados en un DataSet
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        // Verifica si el DataSet contiene datos antes de enlazarlo
                        if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                        {
                            // Enlazar el DropDownList con los datos del DataSet
                            cbx_estrato.DataSource = dataSet.Tables[0];
                            cbx_estrato.DataTextField = "Nombre"; // El campo que quieres mostrar en el DropDownList
                            cbx_estrato.DataValueField = "PkId"; // El valor que deseas obtener al seleccionar un elemento
                            cbx_estrato.DataBind();
                        }
                        else
                        {
                            // Manejar la situación en la que no se encontraron datos
                            cbx_estrato.Items.Clear();
                            cbx_estrato.Items.Add(new ListItem("No se encontraron datos", "0"));
                        }
                    }
                    // Cerrar la conexión
                    conexion.connection.Close();
                }
                catch (Exception) {lbl_mensaje.Text = "Error"; }
            }

        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            cls_registrar_estudiante objUsuarios = new cls_registrar_estudiante();
            objUsuarios.fnt_agregar(txtId.Text, txtNombre.Text, txtContacto.Text, txtDireccion.Text, txtAcudiente.Text,
                cbx_estrato.SelectedValue,cbx_sexo.SelectedValue);
            lbl_mensaje.Text = objUsuarios.getMensaje();
        }

        protected void btn_consultar_Click(object sender, EventArgs e)
        {
            cls_registrar_estudiante objconsultar = new cls_registrar_estudiante();
            objconsultar.fnt_consultar(txtId.Text);
            lbl_mensaje.Text = objconsultar.getMensaje();
            txtNombre.Text = objconsultar.getNombre();
            txtContacto.Text = objconsultar.getContacto();
            txtDireccion.Text = objconsultar.getDireccion();
            txtAcudiente.Text = objconsultar.getAcudiente();
            cbx_estrato.SelectedIndex = Convert.ToInt16(objconsultar.getEstrato());
            cbx_sexo.SelectedIndex = Convert.ToInt16(objconsultar.getSexo());
        }
    }
}