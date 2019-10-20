using System.ComponentModel.DataAnnotations;

namespace ComputerGameLibrary.Models
{
    public class GameUser
    {
        public int Id { get; set; }

        [Display(Name = "User Name")]
        [Required (ErrorMessage="Please enter your User Name")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Please enter a Valid Password")]
        public string Password { get; set; }
    }
}