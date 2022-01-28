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
using System.IO;

namespace JPortal.Controllers
{
    public class PassportsController : Controller
    {
        //private JPortalEntities db = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();
        // GET: Passports
        public ActionResult Index()
        {
            var passports = unitofwork.PassportRepository.Get().Where(p => p.UserID == User.Identity.GetUserId());
            if (!passports.Any())
            {
                return RedirectToAction("Create");
            }
            return View(passports.ToList());
        }

        // GET: Passports/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Passport passport = db.Passports.Find(id);
        //    if (passport == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(passport);
        //}

        // GET: Passports/Create
        public ActionResult Create()
        {
                   return View();
        }

        // POST: Passports/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file == null)
                {
                    ModelState.AddModelError("File", "Please Upload Your file");
                }
                else if (file.ContentLength > 0)
                {
                    int MaxContentLength = 1024 * 1024 * 4; //Size = 4 MB
                    string[] AllowedFileExtensions = new string[] { ".jpg", ".gif", ".png" };
                    if (!AllowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
                    {
                        ModelState.AddModelError("File", "Please file of type: " + string.Join(", ", AllowedFileExtensions));
                    }
                    else if (file.ContentLength > MaxContentLength)
                    {
                        ModelState.AddModelError("File", "Your file is too large, maximum allowed size is: " + MaxContentLength + " MB");
                    }
                    else
                    {
                        var fileName = Path.GetFileName(file.FileName) ;
                        var fileExt = Path.GetExtension(fileName);
                        var fileN = Guid.NewGuid() + fileExt.ToString();
                        var path = Path.Combine(Server.MapPath("~/PassportsImg"), fileN);
                        file.SaveAs(path);
                        ModelState.Clear();
                        ViewBag.Message = "File uploaded successfully. File path :   ~/PassportsImg/" + fileName;
                        Passport passport = new Passport();
                        passport.UserID = User.Identity.GetUserId();
                        passport.Img = "PassportsImg/" + fileN;
                        unitofwork.PassportRepository.Insert(passport);
                        unitofwork.Save();
                        return RedirectToAction("Index");
                    }
                }
            }
            return View();
        }

        // GET: Passports/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Passport passport = db.Passports.Find(id);
        //    if (passport == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email", passport.UserID);
        //    return View(passport);
        //}

        // POST: Passports/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,UserID,Img")] Passport passport)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(passport).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email", passport.UserID);
        //    return View(passport);
        //}


        // POST: Passports/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Passport passport = unitofwork.PassportRepository.GetByID(id);
            unitofwork.PassportRepository.Delete(passport);
            unitofwork.Save();
            return RedirectToAction("Index");
        }

    }
}
