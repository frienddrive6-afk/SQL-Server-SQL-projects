namespace project1;

class Role
{
    public int Id { get; set; }

    public string? Title { get; set; } 

    public override string ToString() => $"id: {Id}, title: {Title}";


}