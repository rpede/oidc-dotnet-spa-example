using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Web.Resource;
using backend.Models;

namespace backend.Controllers;

[ApiController]
[Route("[controller]")]
[RequiredScope(RequiredScopesConfigurationKey = "OpenIDConnectSettings")]
public class AuthController : ControllerBase
{
    [HttpGet("Login")]
    public async Task Login([FromServices] IConfiguration config)
    {
        await HttpContext.ChallengeAsync(
          OpenIdConnectDefaults.AuthenticationScheme,
          new AuthenticationProperties
          {
              RedirectUri = config.GetSection("OpenIDConnectSettings")["Frontend"]
          });
    }

    [HttpGet("Callback")]
    public async Task Callback()
    {
        await HttpContext.AuthenticateAsync();
    }

    [HttpGet("UserInfo")]
    public ActionResult GetUserInfo()
    {
        var user = this.HttpContext.User;

        if (user?.Identity != null && user.Identity.IsAuthenticated)
        {
            return this.Ok(new UserModel
            {
                IsAuthenticated = true,
                Name = user.FindFirst("name")?.Value,
                EmailAddress = user.FindFirst(c => c.Type == ClaimTypes.Email)?.Value,
                AdditionalClaims = user.Identities.First().Claims.ToDictionary(claim => claim.Type, claim => claim.Value)
            });
        }

        return this.Ok(new UserModel
        {
            IsAuthenticated = false,
        });
    }
}
