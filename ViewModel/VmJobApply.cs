using JPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JPortal.ViewModel
{
    public class VmJobApply
    {
        public List<JobCategory> JobCategory { get; set; }
        public List<JobList> JobList { get; set; }

        public List<JobsApply> JobApply { get; set; }
    }
}