using Microsoft.EntityFrameworkCore;

public class Db : DbContext
{
    public DbSet<Book> Books { get; set; } = null!;

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=localhost,1433;Database=p42_ef_mig_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;");
    }
}