using System;
using System.Collections.Generic;

namespace project1.Models;

public partial class Album
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime CreationDate { get; set; }

    public int UserId { get; set; }

    public DateTime? DeletedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public int? Rate { get; set; }

    public virtual ICollection<Image> Images { get; set; } = new List<Image>();

    public virtual User User { get; set; } = null!;
}
