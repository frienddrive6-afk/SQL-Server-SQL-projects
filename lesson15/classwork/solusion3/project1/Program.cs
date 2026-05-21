

#region CREATE

using project1;

using Db db = new Db();

db.Users.AddRange(
    new User { Email = "login1", Password = "password1" },
    new User { Email = "login2", Password = "password2" },
    new User { Email = "login3", Password = "password3" }
);

db.SaveChanges();


#endregion