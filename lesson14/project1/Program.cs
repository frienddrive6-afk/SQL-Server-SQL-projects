using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;


const string connString = @"Server=localhost;Database=p42_insta_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;";


SqlConnection conn = new SqlConnection(connString);


string procQuery = @"
    CREATE PROCEDURE uspGetUsersCountrByEmailPattern
        @pattern nvarchar(50),
        @count int out
    AS
    BEGIN
        SET @count = (
            SELECT COUNT(email)
            FROM users
            WHERE email LIKE @pattern
        );
    END
";


try
{
    conn.Open();


    // SqlDataReader reader = GetProcReader("uspGetUserOf2000");
    // RenderResult(reader);

    // SqlCommand cmd = new SqlCommand(procQuery, conn);
    // cmd.ExecuteNonQuery();


    int result = CountByEmail("a%");
    System.Console.WriteLine($"Count: {result}");

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




int CountByEmail(string pattern)
{
    string procName = "uspGetUsersCountrByEmailPattern";

    SqlCommand cmd = new SqlCommand(procName, conn)
    {
        CommandType = CommandType.StoredProcedure,
    };

    cmd.Parameters.Add(new SqlParameter()
    {
        ParameterName = "@pattern",
        SqlDbType = SqlDbType.NVarChar,
        Size = 50,
        Value = pattern,
    });

    SqlParameter countPrm = new SqlParameter()
    {
        ParameterName = "@count",
        SqlDbType = SqlDbType.Int,
        Direction = ParameterDirection.Output,
    };

    cmd.Parameters.Add(countPrm);

    cmd.ExecuteNonQuery();

    return (int)countPrm.Value;
}




SqlDataReader GetProcReader(string procName)
{
    SqlCommand cmd = new SqlCommand()
    {
        Connection = conn,
        CommandType = System.Data.CommandType.StoredProcedure,
        CommandText = procName
    };

    return cmd.ExecuteReader();
}


void RenderResult(SqlDataReader reader)
{
    DataTable dt = new DataTable();
    dt.Load(reader);

    int columnsCount = dt.Columns.Count;
    Console.Write($"#\t\t");
    foreach(DataColumn col in dt.Columns)
    {
        Console.Write($"{col.ColumnName}\t\t");
    }

    Console.WriteLine();
    
    for(int i = 0; i < dt.Rows.Count;i++)
    {
        Console.Write($"{i + 1}\t\t");

        for(int j = 0; j < columnsCount;++j)
        {
            DataRow row = dt.Rows[i];
            Console.Write($"{row[j]}\t\t");
        }
        System.Console.WriteLine();
    }
}
