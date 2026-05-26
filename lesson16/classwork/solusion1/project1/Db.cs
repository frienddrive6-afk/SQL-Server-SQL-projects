using Microsoft.EntityFrameworkCore;

namespace project1;


public class Db : DbContext
{
    public Db()
    {
        // Database.EnsureDeleted();
        Database.EnsureCreated();
    }


    public virtual DbSet<User> Users { get; set; }
    public virtual DbSet<Role> Roles { get; set; }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=localhost,1433;Database=p42_crud_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;");
    }

}