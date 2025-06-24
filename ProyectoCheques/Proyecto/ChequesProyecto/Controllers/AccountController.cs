using ChequesProyecto.Services.Account;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ChequesProyecto.Controllers
{
    [EnableCors("alexcors")]
    [Route("api/v1/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;
        public AccountController(IAccountService accountService) {
            _accountService = accountService;
        }

        [HttpGet("account")]
        public async Task<IActionResult> GetAccountAll()
        {
            try
            {
                return Ok(await _accountService.GetAccountAll());
            }
            catch (Exception ex) {
                return StatusCode(500, new { error=ex.Message });
            }
        }
    }
}
