using LMS.Api.DataAccess;
using LMS.Api.Models;
using WebApplication1.Repository;
using Microsoft.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.SqlTypes;

namespace LMS.Api.Repository
{
    public class BookRepo : IBookrepo
    {
        public readonly ISqlDataAccess _db;

        public BookRepo(ISqlDataAccess db) { _db = db; }

        public async Task<bool> AddBook(BooksModel books)
        {
            try
            {
                await _db.SaveData("AddBook", new {books.title, books.edition,books.author_name, books.published_year});
                return true;
            }
            catch (Exception ex) { return false; }

        }

        public async Task<bool> UpdateBook(BooksModel books)
        {
            try
            {
                await _db.UpdateData("UpdateBook", books);
                return true;
            }
            catch (Exception ex) { return false; }

        }


        public async Task<bool> DeleteBook(int id)
        {
            try
            {
                await _db.DeleteData("DeleteBook", new { book_id = id });
                return true;
            }
            catch (Exception ex) { return false; }

        }

        public async Task<BooksModel?> GetByIdAsync(int id)
        {
            IEnumerable<BooksModel> result = await _db.GetData<BooksModel, dynamic>("GetBook", new { book_id = id });
            return result.FirstOrDefault();
        }

        public async Task<IEnumerable<BooksModel>> GetAllAsync()
        {
            string query = "GetBookList";
            return await _db.GetData<BooksModel, dynamic>(query, new { });
        }
    }
}
