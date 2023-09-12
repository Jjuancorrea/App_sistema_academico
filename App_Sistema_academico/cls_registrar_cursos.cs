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
        SqlDataReader Lectura;
        private string str_nombre; private string str_creditos; private string str_estado; private string str_valor; private string str_contenido;
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
        public void fnt_consultar(string Id)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("SP_consultarCurso", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@id", Id);
                objConecta.connection.Open();
                Lectura = con.ExecuteReader();
                if (Lectura.Read() == true)
                {
                    str_nombre = Convert.ToString(Lectura[1]);
                    str_creditos = Convert.ToString(Lectura[2]);
                    str_estado = Convert.ToString(Lectura[3]);
                    str_valor = Convert.ToString(Lectura[4]);
                    str_contenido = Convert.ToString(Lectura[5]);
                    str_mensaje = "";
                }
            }
            catch (Exception)
            {
                str_mensaje = "No se encontraron registros";
            }
        }
        public string getMensaje() { return this.str_mensaje; }
        public string getNombre() { return this.str_nombre; }
        public string getCreditos() { return this.str_creditos; }
        public string getEstado() { return this.str_estado; }
        public string getValor() { return this.str_valor; }
        public string getContenido() { return this.str_contenido; }

    }
}