using System;
using System.Collections.Generic;

namespace project1.Models;

public partial class Image
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public DateTime PublishDate { get; set; }

    public string Link { get; set; } = null!;

    public DateTime? DeletedAt { get; set; }

    public int UserId { get; set; }

    public int AlbumId { get; set; }

    public virtual Album Album { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
