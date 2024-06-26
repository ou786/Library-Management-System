namespace LMS.Api.Models
{
    public class BooksModel
    {
        public int book_id { get; set; }

        public string? title{ get; set; }

        public string? author_name { get; set; }

        public int edition { get; set; }

        public DateTime published_year { get; set; }

    }
}
