using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JPortal.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using JPortal.Repository;

namespace JPortal.Controllers
{
    public class JobPreferencesController : Controller
    {
        private JPortalEntities db = new JPortalEntities();

        // GET: JobPreferences
        public ActionResult Index()
        {
            var jobPreferences = db.JobPreferences.Include(j => j.AspNetUser).Include(j => j.AspNetUser1).Include(j => j.JobCategory).Include(j => j.State);
            return View(jobPreferences.ToList());
        }

        // GET: JobPreferences/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobPreference jobPreference = db.JobPreferences.Find(id);
            if (jobPreference == null)
            {
                return HttpNotFound();
            }
            return View(jobPreference);
        }

        // GET: JobPreferences/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.JobCategories, "Id", "CategoryName");
            ViewBag.StateID = new SelectList(db.States, "Id", "Name");
            return View();
        }

        // POST: JobPreferences/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CategoryID,StateID")] JobPreference jobPreference)
        {
            if (ModelState.IsValid)
            {
                jobPreference.UserID = User.Identity.GetUserId();
                db.JobPreferences.Add(jobPreference);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.JobCategories, "Id", "CategoryName", jobPreference.CategoryID);
            ViewBag.StateID = new SelectList(db.States, "Id", "Name", jobPreference.StateID);
            return View(jobPreference);
        }

        // GET: JobPreferences/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobPreference jobPreference = db.JobPreferences.Find(id);
            if (jobPreference == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.JobCategories, "Id", "CategoryName", jobPreference.CategoryID);
            ViewBag.StateID = new SelectList(db.States, "Id", "Name", jobPreference.StateID);
            return View(jobPreference);
        }

        // POST: JobPreferences/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CategoryID,StateID")] JobPreference jobPreference)
        {
            if (ModelState.IsValid)
            {
                jobPreference.UserID = User.Identity.GetUserId();
                db.Entry(jobPreference).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.JobCategories, "Id", "CategoryName", jobPreference.CategoryID);
            ViewBag.StateID = new SelectList(db.States, "Id", "Name", jobPreference.StateID);
            return View(jobPreference);
        }

        // GET: JobPreferences/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    JobPreference jobPreference = db.JobPreferences.Find(id);
        //    if (jobPreference == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(jobPreference);
        //}

        // POST: JobPreferences/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            JobPreference jobPreference = db.JobPreferences.Find(id);
            db.JobPreferences.Remove(jobPreference);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
