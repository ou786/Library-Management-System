using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.Data.SqlClient;
using System.Data.SqlTypes;
using LMS.Api.Models;
using LMS.Api.Repository;

namespace LMS.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MemberController : ControllerBase
    {
        private readonly IMemberrepo _memberRepo;
        public MemberController(IMemberrepo memberRepo)
        {
            _memberRepo = memberRepo;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllMember()
        {
            try
            {
                var result = await _memberRepo.GetAllAsync();
                return Ok(result);
            } catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetMember(int id)
        {
            var result = await _memberRepo.GetByIdAsync(id);
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMember(int id)
        {
            var result = await _memberRepo.DeleteAsync(id);
            return Ok(result);
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateMember(int id, Members member)
        {
            try
            {
                if (id != member.member_id) return BadRequest("id not found");

                var memberToUpdate = await _memberRepo.GetByIdAsync(id);

                if (memberToUpdate == null) return NotFound("No such Member found");

                var result = await _memberRepo.UpdateAsync(member);
                return RedirectToAction(nameof(GetAllMember));
            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpPost]
        public async Task<IActionResult> AddMember(Members member)
        {
            try
            {
                if (member == null) return BadRequest("Requires value");

                var result = await _memberRepo.AddAsync(member);
                return RedirectToAction(nameof(GetAllMember));

            } catch (Exception ex) { return BadRequest(ex.Message); }
        }
    }
}