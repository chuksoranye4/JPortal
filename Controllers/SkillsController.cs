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
    public class SkillsController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();

        // GET: Skills
        public ActionResult Index()
        {
            var skills = unitofwork.SkillRepository.Get().Where(p=>p.UserID == User.Identity.GetUserId());
            if (skills== null)
            {
                return RedirectToAction("Create");
            }
            return View(skills.ToList());
        }

        // GET: Skills/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Skill skill = unitofwork.SkillRepository.GetByID(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            return View(skill);
        }

        // GET: Skills/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Skills/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,SkillName,Level,YearOfExprience")] Skill skill)
        {
            if (ModelState.IsValid)
            {
                skill.UserID = User.Identity.GetUserId();
                unitofwork.SkillRepository.Insert(skill);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(skill);
        }

        // GET: Skills/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Skill skill = unitofwork.SkillRepository.GetByID(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            return View(skill);
        }

        // POST: Skills/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,SkillName,Level,YearOfExprience")] Skill skill)
        {
            if (ModelState.IsValid)
            {
                skill.UserID = User.Identity.GetUserId();
                unitofwork.SkillRepository.Update(skill);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(skill);
        }

        // GET: Skills/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Skill skill = unitofwork.SkillRepository.GetByID(id);
        //    if (skill == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(skill);
        //}

        // POST: Skills/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Skill skill = unitofwork.SkillRepository.GetByID(id);
            unitofwork.SkillRepository.Delete(skill);
            unitofwork.Save();
            return RedirectToAction("Index");
        }
    }
}
