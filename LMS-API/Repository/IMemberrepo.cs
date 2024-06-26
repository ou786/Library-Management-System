using LMS.Api.Models;

namespace LMS.Api.Repository
{
    public interface IMemberrepo
    {
        Task<bool> AddAsync(Members member);
        Task<bool> UpdateAsync(Members member);
        Task<bool> DeleteAsync(int id);
        Task<IEnumerable<Members>> GetAllAsync();
        Task<Members> GetByIdAsync(int id);
    }
}