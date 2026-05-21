using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;


const string connString = @"Server=localhost;Database=test_insetn_code_c#;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;";

SqlConnection conn = new SqlConnection(connString);


// string title = "EF CORE";
// string title = "c++";
// string title = "my_title');INSERT INTO subjects (title) VALUES('ADMIN LOOSER!!!";


string title = "p42";
int status = 3;
  
try
{
    conn.Open();

    System.Console.WriteLine("Connection OK");

    // string query = $@"INSERT INTO subjects(title) VALUES(@title)";
    // System.Console.WriteLine(query);

    // SqlCommand cmd = new SqlCommand(query, conn);
    // SqlParameter prm = new SqlParameter("@title",title)
    // {
    //     SqlDbType = SqlDbType.NVarChar,
    //     Size = 256
    // };
    // cmd.Parameters.Add(prm);

    // cmd.ExecuteNonQuery();

    string query =  @"
        INSERT INTO groups (title, status)
        VALUES(@title, @status)
        SET @last_id = SCOPE_IDENTITY();
    ";

    SqlCommand cmd = new SqlCommand(query, conn);
    
    cmd.Parameters.Add(new SqlParameter("@title", title)
    {
        SqlDbType = SqlDbType.NVarChar,
        Size = 128,
    });

    cmd.Parameters.Add(new SqlParameter("@status", status)
    {
        SqlDbType = SqlDbType.TinyInt,
    });

    SqlParameter idPrm = new SqlParameter()
    {
        ParameterName = "@last_id",
        SqlDbType = SqlDbType.Int,
        Direction = ParameterDirection.Output,
    };

    cmd.Parameters.Add(idPrm);

    cmd.ExecuteNonQuery();

    System.Console.WriteLine($"Last_ID: {idPrm.Value}");

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