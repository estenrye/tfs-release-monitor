using System.IO;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace ServiceHookCollector.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DeploymentCompletedController : ControllerBase
    {
        private readonly ILogger<DeploymentCompletedController> _logger;

        public DeploymentCompletedController(ILogger<DeploymentCompletedController> logger)
        {
            this._logger = logger;
        }

        [HttpPost]
        public async Task<string> Post()
        {
            var encoding = Encoding.UTF8;
            using (StreamReader reader = new StreamReader(Request.Body, encoding))
            {
                var jsonBody = await reader.ReadToEndAsync();
                return jsonBody;
            }
        }
    }
}