using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;

const string connString = @"Server=localhost;Database=p42_insta_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;";

string procQuery = @"
    CREATE PROCEDURE uspGetUserOf2000
    AS
    BEGIN
        SELECT id, email
        FROM users
        WHERE YEAR(birthday) = 2000;
    END
";

using SqlConnection conn = new SqlConnection(connString);


try
{
    conn.Open();

    System.Console.WriteLine("Connection OK");

    SqlCommand cmd = new SqlCommand(procQuery, conn);
    cmd.ExecuteNonQuery();



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