using System;
using System.Collections.Generic;

namespace project1.Models;

public partial class User
{
    public int Id { get; set; }

    public string Email { get; set; } = null!;

    public string Nickname { get; set; } = null!;

    public string Password { get; set; } = null!;

    public DateOnly Birthday { get; set; }

    public DateTime? DeletedAt { get; set; }

    public virtual ICollection<Album> Albums { get; set; } = new List<Album>();

    public virtual ICollection<Image> Images { get; set; } = new List<Image>();
}
