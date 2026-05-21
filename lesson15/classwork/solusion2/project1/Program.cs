


using project1;

using Db db = new Db();


Role role1 = new Role { Title = "Admin" };
Role role2 = new Role { Title = "User" };

System.Console.WriteLine(role1.ToString());
System.Console.WriteLine(role2.ToString());

db.Roles.Add(role1);
db.Roles.Add(role2);


db.SaveChanges();
