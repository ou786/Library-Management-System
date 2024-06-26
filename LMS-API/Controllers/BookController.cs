using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.Data.SqlClient;
using System.Data.SqlTypes;
using LMS.Api.Models;
using LMS.Api.Repository;
using WebApplication1.Repository;

namespace LMS.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : Controller
    {
        private readonly IBookrepo _bookRepo;
        public BookController(IBookrepo bookRepo)
        {
            _bookRepo = bookRepo;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllBook()
        {
            try
            {
                var result = await _bookRepo.GetAllAsync();
                return Ok(result);
            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpPost]
        public async Task<IActionResult> AddBook(BooksModel books)
        {
            try
            {
                if (books == null) return BadRequest("Requires value");

                var result = await _bookRepo.AddBook(books);
                return RedirectToAction(nameof(GetAllBook));

            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetMember(int id)
        {
            var result = await _bookRepo.GetByIdAsync(id);
            return Ok(result);
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateBook(int id, BooksModel books)
        {
            try
            {
                var result = await _bookRepo.UpdateBook(books);
                return RedirectToAction(nameof(GetAllBook));
            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            var result = await _bookRepo.DeleteBook(id);
            return Ok(result);
        }
    }
}
