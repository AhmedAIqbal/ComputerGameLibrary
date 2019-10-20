using ComputerGameLibrary.Models;
using System.Data.Entity;

namespace ComputerGameLibrary.GameContext
{
    public class GameDbContext : DbContext
    {
      public  DbSet<Game> Games { get; set; }

      public DbSet<GameUser> User { get; set; }
    }
}