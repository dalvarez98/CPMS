using CEN4020_Website.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CEN4020_Website.Pages.ListOfAuth
{
    [Authorize(Policy = "AdminCredentialsRequired")]
    [BindProperties]
    public class CreateModel : PageModel
    {
        private readonly ApplicationDbContext _db;

        public Model.Author Author { get; set; }

        public CreateModel(ApplicationDbContext db)
        {
            _db = db;
        }
        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPost()
        {
            //Author.AuthorID = 4;
            if (ModelState.IsValid)
            {
                await _db.Author.AddAsync(Author);
                await _db.SaveChangesAsync();
                TempData["success"] = "New Author Created Successfully";
                return RedirectToPage("Index");
            }

            return Page();
        }
    }
}
