using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JPortal.Models;
using JPortal.Repository;
using PagedList;

namespace JPortal.Controllers
{
    public class HomeController : Controller
    {
        private UnitOfWork unitofwork = new UnitOfWork();
        // GET: JobCategories
        public ActionResult Index(int? page)
        {
            //ViewBag.JobCatList = new SelectList(unitofwork.JobCategories, "Id", "CategoryName");
           // var jobLists = .JobLists.Include(j => j.JobCategory).ToList();
            var jobLists = unitofwork.JobListRepository.Get(orderBy: q => q.OrderBy(d => d.PostedDate)).Where(p=>p.Status==1);
            //var model = new JobPortal.ViewModel.Vm1
            //{
            //    JobCat = unitofwork.JobCategories.ToList(),
            //    JobLt = unitofwork.JobLists.ToList()
            //};
            // joblist.JobLists.ToList();

            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(jobLists.ToPagedList(pageNumber,pageSize));
        }
    }
}