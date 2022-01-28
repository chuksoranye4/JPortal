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
    public class JobListsController : Controller
    {
      
        private UnitOfWork unitofwork = new UnitOfWork();
        // GET: JobLists
        //public ActionResult Index()
        //{
        //    var jobLists = unitofwork.JobLists.Include(j => j.JobCategory);
        //    return View(jobLists.ToList());
        //}

        // GET: JobLists/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var jobList = unitofwork.JobListRepository.GetByID(id);
            if (jobList == null)
            {
                return HttpNotFound();
            }
            return View(jobList);
        }

        //GET:Jblist/JobCategoryList/5

        public ActionResult JobCategoryList(int? id,int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var jobList = unitofwork.JobListRepository.Get(orderBy: q => q.OrderBy(d => d.PostedDate)).Where(p => p.JobCategoryID == id);
            if (jobList == null)
            {
                return HttpNotFound();
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(jobList.ToPagedList(pageNumber, pageSize));
        }
        // GET: JobLists/Create
        public ActionResult Create()
        {
            //ViewBag.JobCategoryID = new SelectList(unitofwork.JobCategories, "Id", "CategoryName");
            return View();
        }

        // POST: JobLists/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,JobCategoryID,Posteunitofworky,JobTitle,JobLocation,RequiredYearsExpreince,DesiredCourse,JobDescription,StateID,Country,PostedDate,ExpDate,Status")] JobList jobList)
        {
            if (ModelState.IsValid)
            {
                //unitofwork.JobLists.Add(jobList);
                //unitofwork.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.JobCategoryID = new SelectList(unitofwork.JobCategories, "Id", "CategoryName", jobList.JobCategoryID);
            return View(jobList);
        }

        // GET: JobLists/Edit/5
        public ActionResult Edit(int? id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            //JobList jobList = unitofwork.JobLists.Find(id);
            //if (jobList == null)
            //{
            //    return HttpNotFound();
            //}
            //ViewBag.JobCategoryID = new SelectList(unitofwork.JobCategories, "Id", "CategoryName", jobList.JobCategoryID);
            //return View(jobList);
            return View();
        }

        // POST: JobLists/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,JobCategoryID,Posteunitofworky,JobTitle,JobLocation,RequiredYearsExpreince,DesiredCourse,JobDescription,StateID,Country,PostedDate,ExpDate,Status")] JobList jobList)
        {
            if (ModelState.IsValid)
            {
                //unitofwork.Entry(jobList).State = EntityState.Modified;
                //unitofwork.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.JobCategoryID = new SelectList(unitofwork.JobCategories, "Id", "CategoryName", jobList.JobCategoryID);
            return View(jobList);
        }

        // GET: JobLists/Delete/5
        public ActionResult Delete(int? id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            //JobList jobList = unitofwork.JobLists.Find(id);
            //if (jobList == null)
            //{
            //    return HttpNotFound();
            //}
            //return View(jobList);
            return View();
        }

        // POST: JobLists/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //JobList jobList = unitofwork.JobLists.Find(id);
            //unitofwork.JobLists.Remove(jobList);
            //unitofwork.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                //unitofwork.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
