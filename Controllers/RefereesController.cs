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
    public class RefereesController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();
        // GET: Referees
        public ActionResult Index()
        {
            var referees = unitofwork.RefereeRepository.Get().Where(p => p.UserID == User.Identity.GetUserId()); 
            if(referees == null)
            {
                return RedirectToAction("Create");
            }
            return View(referees.ToList());
        }

        // GET: Referees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Referee referee = unitofwork.RefereeRepository.GetByID(id);
            if (referee == null)
            {
                return HttpNotFound();
            }
            return View(referee);
        }

        // GET: Referees/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Referees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Email,PoneNumber,Relation")] Referee referee)
        {
            if (ModelState.IsValid)
            {
                referee.UserID = User.Identity.GetUserId();
                unitofwork.RefereeRepository.Insert(referee);
                unitofwork.Save();
                return RedirectToAction("Index");
            }

            return View(referee);
        }

        // GET: Referees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Referee referee = unitofwork.RefereeRepository.GetByID(id);
            if (referee == null)
            {
                return HttpNotFound();
            }
            return View(referee);
        }

        // POST: Referees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Email,PoneNumber,Relation")] Referee referee)
        {
            if (ModelState.IsValid)
            {
                referee.UserID = User.Identity.GetUserId();
                unitofwork.RefereeRepository.Update(referee);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(referee);
        }

        // GET: Referees/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Referee referee = unitofwork.RefereeRepository.GetByID(id);
        //    if (referee == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(referee);
        //}

        // POST: Referees/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Referee referee = unitofwork.RefereeRepository.GetByID(id);
            unitofwork.RefereeRepository.Delete(referee);
            unitofwork.Save();
            return RedirectToAction("Index");
        }

    }
}
