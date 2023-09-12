using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace App_Sistema_academico
{
    public class cls_registrar_cursos
    {
        private string str_mensaje;
        public void fnt_agregar(string Id, string Nombre, string Creditos, string estado, string valor, string contenidos)
        {
            if (Id == "" || Nombre == "" || Creditos == "" || estado == "" || valor == "" || contenidos == "")
            {
                str_mensaje = "No puede mandar campos vacíos";
            }
            else
            {
                try
                {
                    cls_conexion objConecta = new cls_conexion();
                    SqlCommand con = new SqlCommand("SP_guardarCurso", objConecta.connection);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id", Id);
                    con.Parameters.AddWithValue("@nombre", Nombre);
                    con.Parameters.AddWithValue("@creditos", Creditos);
                    con.Parameters.AddWithValue("@estado", estado);
                    con.Parameters.AddWithValue("@valor", valor);
                    con.Parameters.AddWithValue("@contenidos", contenidos);
                    objConecta.connection.Open();
                    con.ExecuteNonQuery();
                    objConecta.connection.Close();
                    str_mensaje = "Registro exitoso";
                }
                catch (Exception) { str_mensaje = "Este registro ya existe"; }
            }
        }
        public string getMensaje() { return this.str_mensaje; }
    }
}