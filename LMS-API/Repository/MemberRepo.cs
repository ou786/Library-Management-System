using LMS.Api.DataAccess;
using LMS.Api.Models;
using Microsoft.Data.SqlClient;
using System.Data.SqlTypes;
namespace LMS.Api.Repository
{
    public class MemberRepo : IMemberrepo
    {
        public readonly ISqlDataAccess _db;

        public MemberRepo(ISqlDataAccess db) { _db = db; }

        public async Task<bool> AddAsync(Members member)
        {
            try
            {
                await _db.SaveData("AddMember", new {member.member_name, member.phone_no, member.dob, member.gender,member.subscription_type });
                return true;
            }
            catch (Exception ex) { return false; }

        }

        public async Task<bool> UpdateAsync(Members member)
        {
            try
            {
                await _db.UpdateData("EditMember", member);
                return true;
            }
            catch (Exception ex) { return false; }

        }

        public async Task<bool> DeleteAsync(int id)
        {
            try
            {
                await _db.DeleteData("DeleteMember", new { member_id = id});
                return true;
            }
            catch (Exception ex) { return false; }

        }

        public async Task<Members?> GetByIdAsync(int id)
        {
            IEnumerable<Members> result = await _db.GetData<Members, dynamic>("GetMember", new { member_id= id });
            return result.FirstOrDefault();
        }

        public async Task<IEnumerable<Members>> GetAllAsync()
        {
            string query = "GetMemberList";
            return await _db.GetData<Members, dynamic>(query, new { });
        }
    }
}
