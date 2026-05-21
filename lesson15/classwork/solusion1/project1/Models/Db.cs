using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace project1.Models;

public partial class Db : DbContext
{
    public Db()
    {
    }

    public Db(DbContextOptions<Db> options)
        : base(options)
    {
    }

    public virtual DbSet<Album> Albums { get; set; }

    public virtual DbSet<Image> Images { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UsersLog> UsersLogs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
// #warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost,1433;Database=p42_insta_db;User Id=sa;Password=ComplexPass123!;Encrypt=False;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Album>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__albums__3213E83F45A5724B");

            entity.ToTable("albums");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreationDate)
                .HasColumnType("smalldatetime")
                .HasColumnName("creation_date");
            entity.Property(e => e.DeletedAt)
                .HasColumnType("smalldatetime")
                .HasColumnName("deleted_at");
            entity.Property(e => e.Description)
                .HasMaxLength(512)
                .HasColumnName("description");
            entity.Property(e => e.Rate).HasColumnName("rate");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .HasColumnName("title");
            entity.Property(e => e.UpdatedAt)
                .HasColumnType("smalldatetime")
                .HasColumnName("updated_at");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.Albums)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_albums_users");
        });

        modelBuilder.Entity<Image>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__images__3213E83F209992F8");

            entity.ToTable("images");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AlbumId).HasColumnName("album_id");
            entity.Property(e => e.DeletedAt)
                .HasColumnType("smalldatetime")
                .HasColumnName("deleted_at");
            entity.Property(e => e.Link)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("link");
            entity.Property(e => e.PublishDate)
                .HasColumnType("smalldatetime")
                .HasColumnName("publish_date");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .HasColumnName("title");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.Album).WithMany(p => p.Images)
                .HasForeignKey(d => d.AlbumId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_images_albums");

            entity.HasOne(d => d.User).WithMany(p => p.Images)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_images_users");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Int).HasName("PK__roles__DC50F6D86CEE1DB0");

            entity.ToTable("roles");

            entity.Property(e => e.Int).HasColumnName("int");
            entity.Property(e => e.Title)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasColumnName("title");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("users");

            entity.HasIndex(e => e.Email, "IX_users_email_unique").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Birthday).HasColumnName("birthday");
            entity.Property(e => e.DeletedAt)
                .HasColumnType("smalldatetime")
                .HasColumnName("deleted_at");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasColumnName("email");
            entity.Property(e => e.Nickname)
                .HasMaxLength(50)
                .HasColumnName("nickname");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
        });

        modelBuilder.Entity<UsersLog>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("users_log");

            entity.Property(e => e.EmailAddress)
                .HasMaxLength(50)
                .HasColumnName("email_address");
            entity.Property(e => e.Nick)
                .HasMaxLength(50)
                .HasColumnName("nick");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
