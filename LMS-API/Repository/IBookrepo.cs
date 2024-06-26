using LMS.Api.Models;

namespace WebApplication1.Repository
{
    public interface IBookrepo
    {
        Task<bool> AddBook(BooksModel books);
        Task<bool> UpdateBook(BooksModel books);
        Task<bool> DeleteBook(int id);
        Task<BooksModel> GetByIdAsync(int id);
        Task<IEnumerable<BooksModel>> GetAllAsync();
    }
}
