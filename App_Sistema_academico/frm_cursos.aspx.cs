using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Sistema_academico
{
    public partial class frm_cursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            cls_registrar_cursos objUsuarios = new cls_registrar_cursos();
            objUsuarios.fnt_agregar(txtId.Text, txtNombre.Text, txtCreditos.Text, cbx_estado.SelectedValue, txtValor.Text,
                txtContenidos.Text);
            lbl_mensaje.Text = objUsuarios.getMensaje();
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtCreditos.Text = "";
            cbx_estado.SelectedIndex = 0;
            txtValor.Text = "";
            txtContenidos.Text = "";
        }

        protected void btn_consultar_Click(object sender, EventArgs e)
        {
            cls_registrar_cursos objconsultar = new cls_registrar_cursos();
            objconsultar.fnt_consultar(txtId.Text);
            lbl_mensaje.Text = objconsultar.getMensaje();
            txtNombre.Text = objconsultar.getNombre();
            txtCreditos.Text = objconsultar.getCreditos();
            cbx_estado.SelectedIndex = Convert.ToInt16(objconsultar.getEstado());
            txtValor.Text = objconsultar.getValor();
            txtContenidos.Text = objconsultar.getContenido();
        }
    }
}