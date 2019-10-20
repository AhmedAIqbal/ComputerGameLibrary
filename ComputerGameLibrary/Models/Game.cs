using System.ComponentModel.DataAnnotations;

namespace ComputerGameLibrary.Models
{
    public class Game
    {
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string Genre { get; set; }
        [Required]
        [Display(Name ="Year Published" )]
        [Range( 1900, 2019,ErrorMessage ="Please enter a Valid Year")]
        public int YearPublished { get; set; }
        [Required]
        public double Price { get; set; }
    }
}