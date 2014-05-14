using System.Web;
using System.Web.Mvc;

namespace Sisfut.Integracao.RestService
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}