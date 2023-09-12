using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace App_Sistema_academico
{
    public class cls_registrar_estudiante
    {
        private string str_mensaje;
        SqlDataReader Lectura;
        private string str_nombre; private string str_contacto; private string str_direccion; private string str_acudiente; private string str_estrato;
        private string str_sexo;
        public void fnt_agregar(string Pkcodigo, string Nombre, string contacto, string direccion, string acudiente, string estrato,
            string sexo)
        {
            if (Pkcodigo == "" || Nombre == "" || contacto == "" || acudiente == "" || direccion == "" || estrato == "" || sexo == ""
                 )
            {
                str_mensaje = "No puede mandar campos vacíos";
            }
            else
            {
                try
                {
                    cls_conexion objConecta = new cls_conexion();
                    SqlCommand con = new SqlCommand("SP_guardarEstudiante", objConecta.connection);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id", Pkcodigo);
                    con.Parameters.AddWithValue("@nombre", Nombre);
                    con.Parameters.AddWithValue("@contacto", contacto);
                    con.Parameters.AddWithValue("@direccion", direccion);
                    con.Parameters.AddWithValue("@acudiente", acudiente);
                    con.Parameters.AddWithValue("@estrato", estrato);
                    con.Parameters.AddWithValue("@sexo", sexo);
                    objConecta.connection.Open();
                    con.ExecuteNonQuery();
                    objConecta.connection.Close();
                    str_mensaje = "Registro exitoso";
                }
                catch (Exception) { str_mensaje = "Este registro ya existe"; }
            }
        }
        public void fnt_consultar(string codigo)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("SP_consultarEstudiante", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@id", codigo);
                objConecta.connection.Open();
                Lectura = con.ExecuteReader();
                if (Lectura.Read() == true)
                {
                    str_nombre = Convert.ToString(Lectura[1]);
                    str_contacto = Convert.ToString(Lectura[2]);
                    str_direccion = Convert.ToString(Lectura[3]);
                    str_acudiente = Convert.ToString(Lectura[4]);
                    str_estrato = Convert.ToString(Lectura[5]);
                    str_sexo = Convert.ToString(Lectura[6]);
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
        public string getContacto() { return this.str_contacto; }
        public string getDireccion() { return this.str_direccion; }
        public string getAcudiente() { return this.str_acudiente; }
        public string getEstrato() { return this.str_estrato; }
        public string getSexo() { return this.str_sexo; }


    }
}