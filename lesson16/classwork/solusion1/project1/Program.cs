

#region CREATE

// using project1;

// using Db db = new Db();

// db.Users.AddRange(
//     new User { Email = "login1", Password = "password1" },
//     new User { Email = "login2", Password = "password2" },
//     new User { Email = "login3", Password = "password3" }
// );

// db.SaveChanges();


#endregion



#region READ


// using project1;

// using Db db = new Db();

// List<User> users = db.Users.Where(u => u.Id > 1).ToList();
// users.ForEach(System.Console.WriteLine);

// // foreach (User u in users)
// // {
// //     Console.WriteLine(u.ToString());
// // }



// IQueryable<User> users = db.Users.Where(u => u.Id > 1000);
// foreach (User u in users)
// {
//     Console.WriteLine(u.ToString());
// }




#endregion




#region  UPDATE

// using project1;

// using Db db = new Db();

// User? user = db.Users.FirstOrDefault( u => u.Id == 3);

// if(user is not null)
// {
//     user.Email = "aaaaaabbbbccccc#mail.com";
//     user.Password = "0002232347";

//     db.SaveChanges();
// }






// using System.Data;
// using project1;

// User? user = null;

// using (Db db = new Db())
// {
//     user = db.Users.FirstOrDefault(u => u.Id == 3);

// }

// user.Email = "test#mail.com";

// // using (Db db = new Db())
// // {
// //     db.Update(user);
// //     db.SaveChanges();
// // }

// using (Db db = new Db())
// {
//     user.Id = 0;
//     db.Users.Add(user);
//     db.SaveChanges();

// }




#endregion




#region DELETE


using project1;

using Db db = new Db();

User? user = db.Users.FirstOrDefault(u => u.Id == 3);

if (user is not null)
{
    db.Users.Remove(user);
    db.SaveChanges();
}



#endregion


































