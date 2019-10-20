using ComputerGameLibrary.Models;
using ComputerGameLibrary.GameContext;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using ComputerGameLibrary.GamesLibraryViewModel;

namespace ComputerGameLibrary.Controllers
{
   
    public class LoginController : Controller
    {
        GameDbContext db = new GameDbContext();

        public ActionResult Login()
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult Login(GameUser user, string ReturnUrl)
        {
            if (IsValid(user))
            {
                FormsAuthentication.SetAuthCookie(user.UserName, false);
                return RedirectToAction("Index", "Game");
            }
            else
            {
                ModelState.AddModelError("", "Invalid username or password");
                return View(user);
                
            }

        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return Redirect("Login");
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(GameUserViewModel viewModel)
        {
            if (viewModel.Password != viewModel.ConfirmPassword) return View();
            var gameUsers = new GameUser();
            mapper(gameUsers, viewModel);
            db.User.Add(gameUsers);
            db.SaveChanges();
        
            return RedirectToAction("Login");
        }

        private void mapper(GameUser gameUsers, GameUserViewModel viewModel)
        {
            gameUsers.UserName = viewModel.UserName;
            gameUsers.Password = viewModel.Password;
        }

        public bool IsValid(GameUser gameUser)
        {
            var users = db.User.ToList();
            string username = gameUser.UserName;
            return users.Any(u=> u.UserName.ToLower() == gameUser.UserName.ToLower() && u.Password == gameUser.Password);
        }
    }
}