using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JPortal.Startup))]
namespace JPortal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
