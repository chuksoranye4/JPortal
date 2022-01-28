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
    public class MyCVController : Controller
    {
        // GET: MyCV
        private JPortalEntities db = new JPortalEntities();
        public ActionResult Index()
        {
            string userid = User.Identity.GetUserId();
            VmMyCV mycv = new VmMyCV();
            mycv.certification = db.Certifications.Where(p=>p.UserId == userid).ToList();
            mycv.education = db.Educations.Where(p=>p.UserID == userid).ToList();
            mycv.referee = db.Referees.Where(p=>p.UserID == userid).ToList();
            mycv.passport = db.Passports.Where(p=>p.UserID == userid).FirstOrDefault();
            mycv.userDetail = db.UserDetails.Where(p => p.UserID == userid).FirstOrDefault();
            mycv.skill =db.Skills.Where(p=>p.UserID == userid).ToList();
            mycv.workExpress = db.WorkedExpres.Where(p => p.UserID == userid).ToList();
            mycv.aspNetUser = db.AspNetUsers.Where(p => p.Id == userid).FirstOrDefault();
            return View(mycv);
        }
    }
}