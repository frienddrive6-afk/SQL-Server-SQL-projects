using Microsoft.EntityFrameworkCore;

namespace project1;


public class Db : DbContext
{
    public Db()
    {
        
    }

    public DbSet<User> Users {get; set;}



    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=localhost,1433;Database=p42_ef_mig_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;");
    }

}