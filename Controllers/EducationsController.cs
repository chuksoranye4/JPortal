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

namespace JPortal.Controllers
{
    public class EducationsController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();

        // GET: Educations
        public ActionResult Index()
        {
            var educations = unitofwork.EducationRepository.Get().Where(p => p.UserID == User.Identity.GetUserId());
            if (educations == null)
            {
                return RedirectToAction("Create");
            }
            return View(educations.ToList());
        }

        // GET: Educations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Education education = unitofwork.EducationRepository.GetByID(id);
            if (education == null)
            {
                return HttpNotFound();
            }
            return View(education);
        }

        // GET: Educations/Create
        public ActionResult Create()
        {           
            return View();
        }

        // POST: Educations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Course,Qualification,ToDate,FromDate")] Education education)
        {
            //DateTime toDate = Convert.ToDateTime(Request.Form["model.ToDate"]);
            //DateTime fromDate = Convert.ToDateTime(Request.Form["model.FromDate"]);
            //education.ToDate = toDate;
            //education.FromDate = fromDate;
            education.UserID = User.Identity.GetUserId();
            if (ModelState.IsValid)
            {
                unitofwork.EducationRepository.Insert(education);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(education);
        }

        // GET: Educations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Education education = unitofwork.EducationRepository.GetByID(id);
            if (education == null)
            {
                return HttpNotFound();
            }
            return View(education);
        }

        // POST: Educations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Course,Qualification,FromDate,ToDate")] Education education)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(education).State = EntityState.Modified;
                education.UserID = User.Identity.GetUserId();
                unitofwork.EducationRepository.Update(education);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(education);
        }

        // GET: Educations/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Education education = unitofwork.EducationRepository.GetByID(id);
        //    if (education == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(education);
        //}

        // POST: Educations/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Education education = unitofwork.EducationRepository.GetByID(id);
            unitofwork.EducationRepository.Delete(education);
            unitofwork.Save();
            return RedirectToAction("Index");
        }
    }
}
