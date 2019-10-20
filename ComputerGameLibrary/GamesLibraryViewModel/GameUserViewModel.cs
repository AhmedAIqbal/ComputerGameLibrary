using System.ComponentModel.DataAnnotations;

namespace ComputerGameLibrary.GamesLibraryViewModel
{
    public class GameUserViewModel
    {
        [Required(ErrorMessage = "Please enter your User Name")]
        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        [Compare("Password",ErrorMessage ="Passwor is not matched")]
        public string ConfirmPassword { get; set; }
    }
}