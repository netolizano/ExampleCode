using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using AutoMapper;
using System.Web.Http;
using System.Web.UI;

namespace UI
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            GlobalConfiguration.Configure(WebApiConfig.Register);

            //Initialize the mappings for the Entities classes
            Mapper.Initialize(cfg => {
                cfg.CreateMap<DataLayer.Employee, Entities.EmployeeET>();
            });

            //enable javascript validations

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }
    }
}