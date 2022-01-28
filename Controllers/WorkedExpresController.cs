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
    public class WorkedExpresController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();

        // GET: WorkedExpres
        public ActionResult Index()
        {
            var workedExpres = unitofwork.WorkedExpreRepository.Get().Where(p => p.UserID == User.Identity.GetUserId());
            if(workedExpres == null)
            {
                return RedirectToAction("Create");
            }
            return View(workedExpres.ToList());
        }

        // GET: WorkedExpres/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkedExpre workedExpre = unitofwork.WorkedExpreRepository.GetByID(id);
            if (workedExpre == null)
            {
                return HttpNotFound();
            }
            return View(workedExpre);
        }

        // GET: WorkedExpres/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: WorkedExpres/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CompanyName,Industry,Address,PositionHeld,JobDescription,FromDate,ToDate")] WorkedExpre workedExpre)
        {
            if (ModelState.IsValid)
            {
                workedExpre.UserID = User.Identity.GetUserId();
                unitofwork.WorkedExpreRepository.Insert(workedExpre);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(workedExpre);
        }

        // GET: WorkedExpres/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkedExpre workedExpre = unitofwork.WorkedExpreRepository.GetByID(id);
            if (workedExpre == null)
            {
                return HttpNotFound();
            }
            return View(workedExpre);
        }

        // POST: WorkedExpres/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CompanyName,Industry,Address,PositionHeld,JobDescription,FromDate,ToDate")] WorkedExpre workedExpre)
        {
            if (ModelState.IsValid)
            {
                workedExpre.UserID = User.Identity.GetUserId();
                unitofwork.WorkedExpreRepository.Update(workedExpre);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(workedExpre);
        }

        // GET: WorkedExpres/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    WorkedExpre workedExpre = db.WorkedExpres.Find(id);
        //    if (workedExpre == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(workedExpre);
        //}

        // POST: WorkedExpres/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            WorkedExpre workedExpre = unitofwork.WorkedExpreRepository.GetByID(id);
            unitofwork.WorkedExpreRepository.Delete(workedExpre);
            unitofwork.Save();
            return RedirectToAction("Index");
        }
    }
}
