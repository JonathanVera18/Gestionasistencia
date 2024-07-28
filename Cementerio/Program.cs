using System;
using Npgsql;
using System.Diagnostics;
using System.Text;
using System.Collections.Generic;

public  class Program
{
    static string connectionString = "Host=localhost;Username=postgres;Password=1234;Database=Cementerio";
   public static void Main(string[] args)
{
       

    GenerarProcedimientosAlmacenados();
    // Ejecuta el respaldo y restauracion
        //RespaldoBaseDatos("C:/Users/marco/OneDrive/Desktop/CementerioP/Cementerio/respaldo.sql");
        //RestauracionBaseDatos("C:/Users/marco/OneDrive/Desktop/CementerioP/Cementerio/respaldo.sql");
    Console.WriteLine(System.IO.Directory.GetCurrentDirectory());
    bool continuar = true;
    while (continuar)
    {
        Console.WriteLine("Seleccione una opción:");
        Console.WriteLine("1. Crear un usuario");
        Console.WriteLine("2. Modificar un usuario");
        Console.WriteLine("3. Eliminar un usuario");
        Console.WriteLine("4. Crear Rol a Usuario ");
        Console.WriteLine("5. Asignar un Rol a Usuario");
        Console.WriteLine("6. Consultar los Usuarios Creados");
        Console.WriteLine("7. Consultar los Roles Creados");
        Console.WriteLine("8. Generar disparadores de auditoría");
        Console.WriteLine("9. Ejecutar automatización con transacciones");
        Console.WriteLine("0. Salir");

        string opcion = Console.ReadLine().Trim();
        switch (opcion)
        {
            case "1":
                CrearUsuario();
                break;
            case "2":
                ModificarUsuario();
                break;
            case "3":
                EliminarUsuario();
                break;
            case "4":
                CrearRol();
                break;
            case "5":
                AsignarRolAUsuario();
                break;
            case "6":
                ConsultarUsuariosCreados();
                break;
            case "7":
                ConsultarRolesCreados();
                break;
            case "8":
                GenerarDisparadoresAuditoria();
                break;
            case "9":
                EjecutarAutomatizacionConTransacciones();
                break;
            case "0":
                continuar = false;
                break;
            default:
                Console.WriteLine("Opción no válida. Por favor, intente de nuevo.");
                break;
        }

        
         // Llama a la función ListarEntidades
        ListarEntidades();

        // Pide al usuario que introduzca el nombre de una entidad
        Console.Write("Por favor, introduce el nombre de una entidad: ");
        string entidad = Console.ReadLine().Trim();

        // Llama a la función ListarAtributosPorEntidad con la entidad introducida por el usuario
        ListarAtributosPorEntidad(entidad);

        // Pide al usuario que introduzca los atributos que desea consultar
        Console.Write("Por favor, introduce los atributos que deseas consultar, separados por comas: ");
        List<string> atributos = Console.ReadLine().Trim().Split(',').ToList();

        // Llama a la función GenerarConsulta con la entidad y los atributos introducidos por el usuario
        GenerarConsulta(entidad, atributos);
        }
        

      
}
 
//Administrar Roles, Usuarios y Permisos
    static void CrearUsuario()
    {
        Console.Write("Ingrese el nombre del nuevo usuario: ");
        string nuevoUsuario = Console.ReadLine().Trim();
        Console.Write("Ingrese la contraseña del nuevo usuario: ");
        string nuevaContraseña = Console.ReadLine().Trim();

        using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
        {
            connection.Open();
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = connection;
                cmd.CommandText = $"CREATE USER {nuevoUsuario} PASSWORD '{nuevaContraseña}'";
                cmd.ExecuteNonQuery();
                Console.WriteLine($"Usuario '{nuevoUsuario}' creado correctamente.");
            }
        }
    }

    static void ModificarUsuario()
{
    Console.Write("Ingrese el nombre del usuario que desea modificar: ");
    string usuarioModificar = Console.ReadLine().Trim();
    Console.Write("Ingrese el nuevo nombre para el usuario: ");
    string nuevoNombre = Console.ReadLine().Trim();
    Console.Write("Ingrese la nueva contraseña para el usuario: ");
    string nuevaContraseña = Console.ReadLine().Trim();

    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = $"ALTER USER {usuarioModificar} RENAME TO {nuevoNombre}; ALTER USER {nuevoNombre} PASSWORD '{nuevaContraseña}'";
            cmd.ExecuteNonQuery();
            Console.WriteLine($"Usuario '{usuarioModificar}' modificado correctamente a '{nuevoNombre}'.");
        }
    }
}

static void EliminarUsuario()
{
    Console.Write("Ingrese el nombre del usuario que desea eliminar: ");
    string usuarioEliminar = Console.ReadLine().Trim();

    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = $"DROP USER IF EXISTS {usuarioEliminar}";
            cmd.ExecuteNonQuery();
            Console.WriteLine($"Usuario '{usuarioEliminar}' eliminado correctamente.");
        }
    }
}

static void CrearRol()
{
    Console.Write("Ingrese el nombre del nuevo rol: ");
    string nuevoRol = Console.ReadLine().Trim();

    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = $"CREATE ROLE {nuevoRol}";
            cmd.ExecuteNonQuery();
            Console.WriteLine($"Rol '{nuevoRol}' creado correctamente.");
        }
    }
}

static void AsignarRolAUsuario()
{
    Console.Write("Ingrese el nombre del usuario al que desea asignar un rol: ");
    string usuarioAsignarRol = Console.ReadLine().Trim();
    Console.Write("Ingrese el nombre del rol que desea asignar: ");
    string rolAsignar = Console.ReadLine().Trim();

    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = $"GRANT {rolAsignar} TO {usuarioAsignarRol}";
            cmd.ExecuteNonQuery();
            Console.WriteLine($"Rol '{rolAsignar}' asignado correctamente a '{usuarioAsignarRol}'.");
        }
    }
}

static void ConsultarUsuariosCreados()
{
    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = "SELECT usename FROM pg_user WHERE usename != 'postgres'";
            NpgsqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine("Usuarios creados:");
            while (reader.Read())
            {
                string usuario = reader.GetString(0);
                Console.WriteLine(usuario);
            }
        }
    }
}
static void ConsultarRolesCreados()
{
    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = "SELECT rolname FROM pg_roles WHERE rolname != 'postgres'";
            NpgsqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine("Roles creados:");
            while (reader.Read())
            {
                string rol = reader.GetString(0);
                Console.WriteLine(rol);
            }
        }
    }
}


//Respaldo  de la base de datos
static void RespaldoBaseDatos(string rutaArchivo)
{
    Console.Write("Por favor, ingresa la contraseña: ");
    string password = Console.ReadLine();

    string filename = "respaldo.sql";
    var process = new Process()
    {
        StartInfo = new ProcessStartInfo
        {
            FileName = "pg_dump.exe",
            Arguments = $"-U postgres -f {filename} Cementerio",
            RedirectStandardError = true,
            UseShellExecute = false,
            CreateNoWindow = true,
            Environment = { ["PGPASSWORD"] = password }
        }
    };
    process.Start();
    string error = process.StandardError.ReadToEnd();
    process.WaitForExit();

    if (string.IsNullOrEmpty(error))
    {
        Console.WriteLine($"Respaldo de la base de datos guardado en {filename}.");
    }
    else
    {
        Console.WriteLine($"Error al respaldar la base de datos: {error}");
    }

    process.Close();
}

static void RestauracionBaseDatos(string rutaArchivo)
{
    Console.Write("Por favor, ingresa la contraseña: ");
    string password = Console.ReadLine();

    string filename = "respaldo.sql";
    var process = new Process()
    {
        StartInfo = new ProcessStartInfo
        {
            FileName = "psql.exe",
            Arguments = $"-U postgres -d Cementerio -f {filename}",
            RedirectStandardError = true,
            UseShellExecute = false,
            CreateNoWindow = true,
            Environment = { ["PGPASSWORD"] = password }
        }
    };
    process.Start();
    string error = process.StandardError.ReadToEnd();
    process.WaitForExit();

    if (string.IsNullOrEmpty(error))
    {
        Console.WriteLine($"Base de datos restaurada desde {filename}.");
    }
    else
    {
        Console.WriteLine($"Error al restaurar la base de datos: {error}");
    }

    process.Close();
}
//Gestión de Consulta y generación de reportes
static void ListarEntidades()
{
    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'";
            NpgsqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine("Entidades:");
            while (reader.Read())
            {
                string entidad = reader.GetString(0);
                Console.WriteLine(entidad);
            }
        }
    }
}

static void ListarAtributosPorEntidad(string entidad)
{
    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = $"SELECT column_name FROM information_schema.columns WHERE table_name = '{entidad}'";
            NpgsqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine($"Atributos de {entidad}:");
            while (reader.Read())
            {
                string atributo = reader.GetString(0);
                Console.WriteLine(atributo);
            }
        }
    }
}

static void GenerarConsulta(string entidad, List<string> atributos)
{
    string consulta = $"SELECT {string.Join(", ", atributos)} FROM {entidad}";

    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        using (NpgsqlCommand cmd = new NpgsqlCommand())
        {
            cmd.Connection = connection;
            cmd.CommandText = consulta;
            NpgsqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    Console.Write($"{reader[i]} ");
                }
                Console.WriteLine();
            }
        }
    }
}
public static void GenerarProcedimientosAlmacenados()
{
    // Obtén la lista de tablas y campos de tu base de datos
    List<(string NombreEntidad, string[] Campos)> entidades = ObtenerTablasYCampos();

    StringBuilder script = new StringBuilder();

    foreach (var entidad in entidades)
    {
        // CREATE
        script.AppendLine($"CREATE OR REPLACE PROCEDURE Create{entidad.NombreEntidad}({string.Join(", ", entidad.Campos.Select(c => $"{c} VARCHAR"))}) AS $$");
        script.AppendLine("BEGIN");
        script.AppendLine($"INSERT INTO {entidad.NombreEntidad}({string.Join(", ", entidad.Campos)}) VALUES ({string.Join(", ", entidad.Campos.Select(c => $"${c}"))});");
        script.AppendLine("END; $$ LANGUAGE plpgsql;");

        // DELETE
        script.AppendLine($"CREATE OR REPLACE PROCEDURE Delete{entidad.NombreEntidad}(IN id VARCHAR) AS $$");
        script.AppendLine("BEGIN");
        script.AppendLine($"DELETE FROM {entidad.NombreEntidad} WHERE {entidad.Campos[0]} = id;");
        script.AppendLine("END; $$ LANGUAGE plpgsql;");
    }

    // Write the script to a file
    System.IO.File.WriteAllText("CRUDProcedures.sql", script.ToString());
}
private static List<(string NombreEntidad, string[] Campos)> ObtenerTablasYCampos()
{
    var entidades = new List<(string NombreEntidad, string[] Campos)>();

    using (var conn = new NpgsqlConnection("Host=localhost;Username=postgres;Password=1234;Database=Cementerio"))
    {
        conn.Open();

        // Obtén las tablas
        using (var cmd = new NpgsqlCommand("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'", conn))
        using (var reader = cmd.ExecuteReader())
            while (reader.Read())
            {
                var nombreEntidad = reader.GetString(0);

                // Obtén los campos para cada tabla
                using (var connCampos = new NpgsqlConnection("Host=localhost;Username=postgres;Password=1234;Database=Cementerio"))
                {
                    connCampos.Open();
                    using (var cmdCampos = new NpgsqlCommand($"SELECT column_name FROM information_schema.columns WHERE table_name = '{nombreEntidad}'", connCampos))
                    using (var readerCampos = cmdCampos.ExecuteReader())
                    {
                        var campos = new List<string>();
                        while (readerCampos.Read())
                            campos.Add(readerCampos.GetString(0));

                        entidades.Add((nombreEntidad, campos.ToArray()));
                    }
                }
            }
    }

    return entidades;
}

static void GenerarDisparadoresAuditoria()
    {
        List<string> tablas = ObtenerTablas();
        
        foreach (string tabla in tablas)
        {
            if (tabla != "audit_log") // Excluimos la tabla audit_log
            {
                string disparador = GenerarDisparadorAuditoria(tabla);
                EjecutarComando(disparador);
            }
        }
        
        Console.WriteLine("Disparadores de auditoría generados correctamente.");
    }

    static List<string> ObtenerTablas()
    {
        List<string> tablas = new List<string>();
        
        using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
        {
            connection.Open();
            using (NpgsqlCommand cmd = new NpgsqlCommand())
            {
                cmd.Connection = connection;
                cmd.CommandText = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'";
                using (NpgsqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        tablas.Add(reader.GetString(0));
                    }
                }
            }
        }

        return tablas;
    }

    
   static string GenerarDisparadorAuditoria(string tabla)
{
    StringBuilder sb = new StringBuilder();

    sb.AppendLine($"CREATE OR REPLACE FUNCTION audit_{tabla}_trigger() RETURNS TRIGGER AS $$");
    sb.AppendLine("BEGIN");
    sb.AppendLine("    IF (TG_TABLE_NAME = 'audit_log') THEN");
    sb.AppendLine("        RETURN NULL; -- No auditar la tabla audit_log");
    sb.AppendLine("    END IF;");
    sb.AppendLine("    IF (TG_OP = 'DELETE') THEN");
    sb.AppendLine($"        INSERT INTO audit_log (tabla, operacion, usuario, fecha, datos_antiguos)");
    sb.AppendLine($"        VALUES (TG_TABLE_NAME, 'DELETE', current_user, current_timestamp, row_to_json(OLD));");
    sb.AppendLine("        RETURN OLD;");
    sb.AppendLine("    ELSIF (TG_OP = 'UPDATE') THEN");
    sb.AppendLine($"        INSERT INTO audit_log (tabla, operacion, usuario, fecha, datos_antiguos, datos_nuevos)");
    sb.AppendLine($"        VALUES (TG_TABLE_NAME, 'UPDATE', current_user, current_timestamp, row_to_json(OLD), row_to_json(NEW));");
    sb.AppendLine("        RETURN NEW;");
    sb.AppendLine("    ELSIF (TG_OP = 'INSERT') THEN");
    sb.AppendLine($"        INSERT INTO audit_log (tabla, operacion, usuario, fecha, datos_nuevos)");
    sb.AppendLine($"        VALUES (TG_TABLE_NAME, 'INSERT', current_user, current_timestamp, row_to_json(NEW));");
    sb.AppendLine("        RETURN NEW;");
    sb.AppendLine("    END IF;");
    sb.AppendLine("    RETURN NULL;");
    sb.AppendLine("END;");
    sb.AppendLine("$$ LANGUAGE plpgsql;");

    sb.AppendLine($"DROP TRIGGER IF EXISTS audit_{tabla}_trigger ON {tabla};");
    sb.AppendLine($"CREATE TRIGGER audit_{tabla}_trigger");
    sb.AppendLine($"AFTER INSERT OR UPDATE OR DELETE ON {tabla}");
    sb.AppendLine($"FOR EACH ROW EXECUTE FUNCTION audit_{tabla}_trigger();");

    return sb.ToString();
}

static void EjecutarAutomatizacionConTransacciones()
{
    using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
    {
        connection.Open();
        bool exito = false;

        try
        {
            using (NpgsqlTransaction transaction = connection.BeginTransaction())
            {
                // Obtener la lista de usuarios
                List<string> usuarios = ObtenerUsuarios(connection);

                // Revocar acceso a todos los usuarios excepto 'postgres'
                foreach (string usuario in usuarios)
                {
                    if (usuario != "postgres")
                    {
                        string comandoRevocacion = $"ALTER USER {usuario} WITH NOLOGIN";
                        using (NpgsqlCommand cmd = new NpgsqlCommand(comandoRevocacion, connection, transaction))
                        {
                            cmd.ExecuteNonQuery();
                            Console.WriteLine($"Se ha revocado el acceso al usuario '{usuario}'.");
                        }
                    }
                }

                // Commit de la transacción
                transaction.Commit();
                exito = true;
                Console.WriteLine("Automatización completada con éxito.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error durante la automatización: {ex.Message}");
        }

        // Verificar el resultado fuera de la transacción
        if (exito)
        {
            VerificarAutomatizacion(connection);
        }
    }
}

static List<string> ObtenerUsuarios(NpgsqlConnection connection)
{
    List<string> usuarios = new List<string>();
    using (NpgsqlCommand cmd = new NpgsqlCommand("SELECT usename FROM pg_user WHERE usename != 'postgres'", connection))
    using (NpgsqlDataReader reader = cmd.ExecuteReader())
    {
        while (reader.Read())
        {
            usuarios.Add(reader.GetString(0));
        }
    }
    return usuarios;
}

static void VerificarAutomatizacion(NpgsqlConnection connection)
{
    using (NpgsqlCommand cmd = new NpgsqlCommand(@"
        SELECT usename, 
               CASE WHEN usesuper THEN 'SUPERUSER'
                    WHEN (SELECT rolcanlogin FROM pg_roles WHERE rolname = usename) THEN 'LOGIN'
                    ELSE 'NOLOGIN'
               END AS status
        FROM pg_user 
        WHERE usename != 'postgres'", connection))
    using (NpgsqlDataReader reader = cmd.ExecuteReader())
    {
        bool todosRevocados = true;
        while (reader.Read())
        {
            string username = reader.GetString(0);
            string status = reader.GetString(1);
            if (status == "LOGIN" || status == "SUPERUSER")
            {
                Console.WriteLine($"ADVERTENCIA: El usuario '{username}' aún puede iniciar sesión (estado: {status}).");
                todosRevocados = false;
            }
            else
            {
                Console.WriteLine($"El usuario '{username}' no puede iniciar sesión, como se esperaba (estado: {status}).");
            }
        }

        if (todosRevocados)
        {
            Console.WriteLine("La automatización se ha realizado correctamente. Todos los usuarios (excepto postgres) tienen el acceso revocado.");
        }
        else
        {
            Console.WriteLine("La automatización no se completó correctamente. Algunos usuarios aún pueden iniciar sesión.");
        }
    }
}

    static void EjecutarComando(string comando)
    {
        try
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            {
                connection.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(comando, connection))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al ejecutar el comando: {ex.Message}");
        }
    }
}






