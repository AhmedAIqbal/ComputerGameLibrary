using ComputerGameLibrary.GameContext;
using System.Linq;
using System.Web.Mvc;
using ComputerGameLibrary.Models;

namespace ComputerGameLibrary.Controllers
{
    [Authorize]
    public class GameController : Controller
    {
        GameDbContext db = new GameDbContext();
        public ActionResult Index()
        {
            var Model = db.Games.ToList();
            return View(Model);
        }

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Game gameLibrary)
        {
            if(gameLibrary != null)
            {
                db.Games.Add(gameLibrary);
                db.SaveChanges();
            }

           return  RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Update(int Id)
        {
            var model = db.Games.Where(x => x.Id == Id).FirstOrDefault();
            return View(model);
        }

        [HttpPost]
        public ActionResult Update(Game gameLibrary)
        {
           var modelToBeUpdated = db.Games
                .Where(g => g.Id == gameLibrary.Id).FirstOrDefault();
            modelToBeUpdated.Title = gameLibrary.Title;
            modelToBeUpdated.YearPublished = gameLibrary.YearPublished;
            modelToBeUpdated.Price = gameLibrary.Price;
            modelToBeUpdated.Genre = gameLibrary.Genre;

            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int Id)
        {
            var modelToBeDeleted = db.Games.Where(x => x.Id == Id).FirstOrDefault();
            db.Games.Remove(modelToBeDeleted);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}