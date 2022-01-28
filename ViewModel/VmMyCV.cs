using JPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JPortal.ViewModel
{
    public class VmMyCV
    {
        public UserDetail userDetail { get; set; }
        public State state { get; set; }
        public Sex sex { get; set; }
        public List<Referee> referee { get; set; }
        public Passport passport { get; set; }
        public MaritalStatu maritalStatus { get; set; }
        public List<JobsApply> jobApply { get; set; }
        public List<Education> education { get; set; }

        public List<Country> Country { get; set; }
        public List<Certification> certification { get; set; }
        public List<Skill> skill { get; set; }

        public List<WorkedExpre> workExpress { get; set; }
        public AspNetUser aspNetUser { get; set; }

    }
}