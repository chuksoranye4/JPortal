using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JPortal.Models;
using JPortal.Repository;

namespace JPortal.Repository
{
    public class masterViewbag : ActionFilterAttribute
    {
        private UnitOfWork unitofwork = new UnitOfWork();
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            filterContext.Controller.ViewBag.JobCatMaster = unitofwork.JobCategoryRepository.Get();
        }
    }
}