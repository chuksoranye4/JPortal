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
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using JPortal.ViewModel;

namespace JPortal.Controllers
{
    public class JobsAppliesController : Controller
    {
        private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();

        // GET: JobsApplies

            [Authorize]
        public ActionResult Index()
        {
            //var jobsApplies = unitofwork.JobsApplyRepository.Get().Where(p => p.ApplyUserID == User.Identity.GetUserId());
            var userid = User.Identity.GetUserId();
            //VmJobApply vm = new VmJobApply();
            //vm.JobApply = db.JobsApplies.Include(j=>j.JobList.JobTitle).Include(j=>j.JobList.JobCategory.CategoryName).Where(p=>p.ApplyUserID == userid).ToList();
            //vm.JobCategory = db.JobCategories.
            var jobsApplies = db.JobsApplies.Include(j => j.JobList).Include(j => j.JobList.JobCategory).Where(p => p.ApplyUserID == userid).OrderBy(t => t.AppliedDate);
            return View(jobsApplies.ToList().OrderByDescending(t=>t.AppliedDate));
        }

         //GET: JobsApplies/Details/5
        public ActionResult Apply(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var jobList = db.JobLists.Where(p=>p.Id == id).SingleOrDefault();
            var JobsApplies = new JobsApply();
            JobsApplies.JobListID = id;
            JobsApplies.PostedByID =jobList.PostedBy;
            JobsApplies.ApplyUserID = User.Identity.GetUserId();
            JobsApplies.AppliedDate = DateTime.Now;
            db.JobsApplies.Add(JobsApplies);
            db.SaveChanges();
            return RedirectToAction("Index","JobsApplies") ;
        }

        public ActionResult Delete(int id)
        {
            JobsApply jobsApply = unitofwork.JobsApplyRepository.GetByID(id);
            unitofwork.JobsApplyRepository.Delete(jobsApply);
            unitofwork.Save();
            return RedirectToAction("Index");
        }

    }
}
