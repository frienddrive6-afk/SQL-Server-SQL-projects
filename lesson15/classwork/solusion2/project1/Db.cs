using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace project1;


class Db : DbContext
{
    public Db()
    {
        Database.EnsureDeleted();
        Database.EnsureCreated();
    }


    public virtual DbSet<User> Users { get; set; }
    public virtual DbSet<Role> Roles { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=localhost,1433;Database=p42_ef_code_first_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;");
    }



}