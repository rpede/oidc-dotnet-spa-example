using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers;

[ApiController]
[Route("[controller]")]
public class ResourceController : ControllerBase
{
    [Authorize(Roles = "analyst")]
    [HttpGet("analyst")]
    public String GetAnalyst() => "Your role is analyst";

    [Authorize(Roles = "developer")]
    [HttpGet("developer")]
    public String GetDeveloper() => "Your role is developer";

    [Authorize(Roles = "pm")]
    [HttpGet("pm")]
    public String GetPM() => "Your role is PM";

    [Authorize(Roles = "auditor")]
    [HttpGet("auditor")]
    public String GetAuditor() => "Your role is auditor";
}
