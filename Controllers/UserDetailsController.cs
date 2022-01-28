using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JPortal.Repository;
using JPortal.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;

namespace JPortal.Controllers
{
    public class UserDetailsController : Controller
    {
        //private JPortalEntities unitofwork = new JPortalEntities();
        private UnitOfWork unitofwork = new UnitOfWork();

        // GET: UserDetails
        public ActionResult Index()
        {
           // var userDetails = unitofwork.UserDetails.Include(u => u.AspNetUser).Include(u => u.MaritalStatu).Include(u => u.Sex).Include(u => u.Country).Include(u => u.State);
            var userDetails = unitofwork.UserDetailRepository.Get().Where(p => p.UserID == User.Identity.GetUserId());
            if(userDetails == null)
            {
                return RedirectToAction("Create");
            }
            return View(userDetails.FirstOrDefault());
        }

        // GET: UserDetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = unitofwork.UserDetailRepository.GetByID(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // GET: UserDetails/Create
        public ActionResult Create()
        {
            ViewBag.MaritalStatusId = new SelectList(unitofwork.MaritalStatuRepository.Get(), "Id", "Status");
            ViewBag.SexId = new SelectList(unitofwork.SexRepository.Get(), "Id", "Sex1");
            ViewBag.CountryId = new SelectList(unitofwork.CountryRepository.Get(), "Id", "Name");
            ViewBag.StateId = new SelectList(unitofwork.StateRepository.Get(), "Id", "Name");
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FirstName,LastName,MiddleName,SexId,MaritalStatusId,PhoneNumber,Address,StateId,CountryId")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                userDetail.UserID = User.Identity.GetUserId();
                unitofwork.UserDetailRepository.Insert(userDetail);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            ViewBag.MaritalStatusId = new SelectList(unitofwork.MaritalStatuRepository.Get(), "Id", "Status", userDetail.MaritalStatusId);
            ViewBag.SexId = new SelectList(unitofwork.SexRepository.Get(), "Id", "Sex1", userDetail.SexId);
            ViewBag.CountryId = new SelectList(unitofwork.CountryRepository.Get(), "Id", "Name", userDetail.CountryId);
            ViewBag.StateId = new SelectList(unitofwork.StateRepository.Get(), "Id", "Name", userDetail.StateId);
            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = unitofwork.UserDetailRepository.GetByID(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(unitofwork.AspNetUsersRepository.Get(), "Id", "Email", userDetail.UserID);
            ViewBag.MaritalStatusId = new SelectList(unitofwork.MaritalStatuRepository.Get(), "Id", "Status", userDetail.MaritalStatusId);
            ViewBag.SexId = new SelectList(unitofwork.SexRepository.Get(), "Id", "Sex1", userDetail.SexId);
            ViewBag.CountryId = new SelectList(unitofwork.CountryRepository.Get(), "Id", "Name", userDetail.CountryId);
            ViewBag.StateId = new SelectList(unitofwork.StateRepository.Get(), "Id", "Name", userDetail.StateId);
            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstName,LastName,MiddleName,SexId,MaritalStatusId,PhoneNumber,Address,StateId,CountryId")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                userDetail.UserID = User.Identity.GetUserId();
                unitofwork.UserDetailRepository.Update(userDetail);
                unitofwork.Save();
                return RedirectToAction("Index");
            }
            ViewBag.MaritalStatusId = new SelectList(unitofwork.MaritalStatuRepository.Get(), "Id", "Status", userDetail.MaritalStatusId);
            ViewBag.SexId = new SelectList(unitofwork.SexRepository.Get(), "Id", "Sex1", userDetail.SexId);
            ViewBag.CountryId = new SelectList(unitofwork.CountryRepository.Get(), "Id", "Name", userDetail.CountryId);
            ViewBag.StateId = new SelectList(unitofwork.StateRepository.Get(), "Id", "Name", userDetail.StateId);
            return View(userDetail);
        }

        // GET: UserDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = unitofwork.UserDetailRepository.GetByID(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserDetail userDetail = unitofwork.UserDetailRepository.GetByID(id);
            unitofwork.UserDetailRepository.Delete(userDetail);
            unitofwork.Save();
            return RedirectToAction("Index");
        }

    }
}
