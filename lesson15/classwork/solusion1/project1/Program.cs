using project1.Models;

using Db db = new Db();

Role role1 = new Role() {Title = "admin"};
Role role2 = new Role() {Title = "guest"};

Console.WriteLine(role1);
Console.WriteLine(role2);

db.Roles.Add(role1);
db.Roles.Add(role2);

// db.SaveChanges();