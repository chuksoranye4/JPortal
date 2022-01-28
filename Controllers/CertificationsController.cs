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
    public class CertificationsController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();
        // GET: Certifications
        public ActionResult Index()
        {
            var certifications = unitofwork.CertificationRepository.Get().Where(p => p.UserId == User.Identity.GetUserId());
            if (certifications == null)
            {
                return RedirectToAction("Create");
            }
            return View(certifications.ToList());
        }

        // GET: Certifications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Certification certification = unitofwork.CertificationRepository.GetByID(id);
            if (certification == null)
            {
                return HttpNotFound();
            }
            return View(certification);
        }

        // GET: Certifications/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Certifications/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NameOfTheBody,CertficateName,DateObtained")] Certification certification)
        {
            if (ModelState.IsValid)
            {
                certification.UserId = User.Identity.GetUserId();
                unitofwork.CertificationRepository.Insert(certification);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(certification);
        }

        // GET: Certifications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Certification certification = unitofwork.CertificationRepository.GetByID(id);
            if (certification == null)
            {
                return HttpNotFound();
            }
            return View(certification);
        }

        // POST: Certifications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NameOfTheBody,CertficateName,DateObtained")] Certification certification)
        {
            if (ModelState.IsValid)
            {
                certification.UserId = User.Identity.GetUserId();
                unitofwork.CertificationRepository.Update(certification);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            return View(certification);
        }

        // GET: Certifications/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Certification certification = unitofwork.CertificationRepository.GetByID(id);
        //    if (certification == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(certification);
        //}

        //// POST: Certifications/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Certification certification = unitofwork.CertificationRepository.GetByID(id);
            unitofwork.CertificationRepository.Delete(certification);
            unitofwork.Save();
            return RedirectToAction("Index");
        }

    }
}
