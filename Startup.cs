using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FlexipleTask.Startup))]
namespace FlexipleTask
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
