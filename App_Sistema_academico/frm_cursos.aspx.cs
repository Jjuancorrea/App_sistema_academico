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
    }
}