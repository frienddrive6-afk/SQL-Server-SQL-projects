using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;

const string connString = @"Server=localhost;Database=p42_insta_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;";


using SqlConnection conn = new SqlConnection(connString);

#region Conection

// try
// {
//     conn.Open();

//     System.Console.WriteLine("Connection OK");
//     System.Console.WriteLine(conn.ConnectionString);
//     System.Console.WriteLine(conn.State);
//     System.Console.WriteLine(conn.ServerVersion);

//     string query = @"
//     CREATE TABLE roles
//     (
//         int int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
//         title varchar(32) NOT NULL
//     );
//     ";

//     SqlCommand cmd = new SqlCommand(query, conn);
//     cmd.ExecuteNonQuery();

// }
// catch (System.Exception ex)
// {
    
//     System.Console.WriteLine($"ERROR: {ex.Message}");
// }
// finally
// {
// if(conn.State == System.Data.ConnectionState.Open)
//     {
//         conn.Close();
//     }

// }

#endregion


#region Command

//  --- ExecutNonQuery

// try
// {
//     conn.Open();

//     System.Console.WriteLine("Connection OK");

//     string query = @"
//         CREATE TABLE roles
//         (
//             int int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
//             title varchar(32) NOT NULL
//         );
//     ";

//     SqlCommand cmd = new SqlCommand()
//     {
//       Connection = conn,
//       CommandText = query,
//       CommandType = System.Data.CommandType.Text,  
//     };

//     cmd.ExecuteNonQuery();

//     conn.ChangeDatabase("p42_logbook_db");


//     cmd.CommandText = @"
//         CREATE TABLE logs(
//             id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
//             date datetime NOT NULL,
//             message varchar(1024)
//         );
//     ";
    
//     cmd.ExecuteNonQuery();

// }
// catch (System.Exception ex)
// {
    
//     System.Console.WriteLine($"ERROR: {ex.Message}");
// }
// finally
// {
// if(conn.State == System.Data.ConnectionState.Open)
//     {
//         conn.Close();
//         System.Console.WriteLine("Connection Closed");
//     }

// }








// --- ExecutReader

// try
// {
//     conn.Open();

//     System.Console.WriteLine("Connection OK");

//     string query = @"
//         SELECT id,email, password
//         FROM users;
//     ";

//     SqlCommand cmd = new SqlCommand(query, conn);

//     using (SqlDataReader reader = cmd.ExecuteReader())
//     {
//         System.Console.WriteLine($"{reader.GetName(0)}\t{reader.GetName(1)}\t{reader.GetName(2)}");


//         // while(reader.Read())
//         // {
//         //     int id = reader.GetFieldValue<int>(0);
//         //     // int id2 = reader.GetInt32(0);
//         //     string email = reader.GetFieldValue<string>(1);
//         //     string password = reader.GetFieldValue<string>(2);
//         //     System.Console.WriteLine($"{id}\t{email}\t{password}");
//         // }


//         DataTable dt = new DataTable();
//         dt.Load(reader);
//         foreach(DataRow row in dt.Rows)
//         {
//             System.Console.WriteLine($"{row["id"]}\t{row["email"]}\t{row["password"]}");
//         }


//     }


// }
// catch (System.Exception ex)
// {
    
//     System.Console.WriteLine($"ERROR: {ex.Message}");
// }
// finally
// {
// if(conn.State == System.Data.ConnectionState.Open)
//     {
//         conn.Close();
//         System.Console.WriteLine("Connection Closed");
        
//     }

// }









// --- ExecutScalar

try
{
    conn.Open();

    System.Console.WriteLine("Connection OK");

    string query = @"SELECT 
        MAX(id)
        FROM users;
    ";

    SqlCommand cmd = new SqlCommand(query, conn);

    int maxId = (int)cmd.ExecuteScalar();

    System.Console.WriteLine($"Max ID: {maxId}");



}
catch (System.Exception ex)
{
    
    System.Console.WriteLine($"ERROR: {ex.Message}");
}
finally
{
if(conn.State == System.Data.ConnectionState.Open)
    {
        conn.Close();
        System.Console.WriteLine("Connection Closed");
        
    }

}

#endregion