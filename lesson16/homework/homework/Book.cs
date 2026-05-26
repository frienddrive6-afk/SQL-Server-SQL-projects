using System.ComponentModel.DataAnnotations;

public class Book
{
    public int Id { get; set; }
    
    public string Title { get; set; } = null!;
    
    public string Author { get; set; } = null!;
    
    public string? Isbn { get; set; }
    
    public int Pages { get; set; }
    
    public DateTime ReleaseDate { get; set; }
    
    public decimal Price { get; set; }
    
    public string Genre { get; set; } = "General";
    
    public string Publisher { get; set; } = null!;
    
    public bool IsAvailable { get; set; } = true;
    
    public string? Description { get; set; }
}