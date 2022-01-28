using JPortal.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace JPortal.Models
{
    public class JobCategoryMetadata 
    {
        public int Id { get; set; }
        [Display(Name = "Job Category")]
        [Required(ErrorMessage="Enter Job Category Name")]
        public string CategoryName { get; set; }

        public virtual ICollection<JobPreference> JobPreferences { get; set; }
        public virtual ICollection<JobList> JobLists { get; set; }
    }
    public class JobListMetadata 
    {
        public int Id { get; set; }       
        public Nullable<int> JobCategoryID { get; set; }
        [Display(Name = "Posted By")]

        [Required(ErrorMessage = "Job Title is Required")]
        //[StringLength(50, ErrorMessage = "Last Name length Should be less than 50")]
        public string PostedBy { get; set; }
        [Display(Name = "Job Title")]
        public string JobTitle { get; set; }
        [Display(Name = "Location")]
        public string JobLocation { get; set; }
        [Display(Name = "Company Name")]
        public string CompanyName { get; set; }
        [Display(Name = "Years of Expr.")]
        public string RequiredYearsExpreince { get; set; }
        [Display(Name = "Desired Course(s)")]
        public string DesiredCourse { get; set; }
        [Display(Name = "Job Details")]
        public string JobDetails { get; set; }
        [Display(Name = "Job Description")]
        public string JobDescription { get; set; }

        [DisplayFormat(ConvertEmptyStringToNull = true, NullDisplayText = "-Not Specify-")]
        public string Salary { get; set; }
        [Display(Name = "State")]
        public Nullable<int> StateID { get; set; }
        [Display(Name = "Country")]
        public Nullable<int> Country { get; set; }
        [Display(Name = "Posted Date"),DisplayFormat(DataFormatString="{0:dd-MM-yyyy}",ApplyFormatInEditMode=true)]
        public Nullable<System.DateTime> PostedDate { get; set; }
        [Display(Name = "Expiry Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ExpDate { get; set; }
        public Nullable<int> Status { get; set; }
        public virtual ICollection<ApplicantApproval> ApplicantApprovals { get; set; }
        [Display(Name = "Country")]
        public virtual Country Country1 { get; set; }
        public virtual JobCategory JobCategory { get; set; }
        public virtual State State { get; set; }
        public virtual ICollection<JobsApply> JobsApplies { get; set; }
    }
    public class UserDetailMetadata
    {
        public int Id { get; set; }
        public string UserID { get; set; }


        [Display(Name = "First Name"), Required(), StringLength(256)]
        public string FirstName { get; set; }

        [Display(Name = "Last Name"), Required(), StringLength(256)]
        public string LastName { get; set; }
        [Display(Name="Middle Name"),StringLength(256)]
        public string MiddleName { get; set; }
        public Nullable<int> SexId { get; set; }
        public Nullable<int> MaritalStatusId { get; set; }

        [Required(), Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
        [Required()]
        public string Address { get; set; }

        [Required(), Display(Name = "State")]
        public Nullable<int> StateId { get; set; }
        [Required(), Display(Name = "Country")]
        public Nullable<int> CountryId { get; set; }
        public virtual Country Country { get; set; }
        public virtual MaritalStatu MaritalStatu { get; set; }
        public virtual Sex Sex { get; set; }
        public virtual State State { get; set; }
    }

    public class CountryMetadata
    {
        [Display(Name="Country")]
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<JobList> JobLists { get; set; }
        public virtual ICollection<State> States { get; set; }
        public virtual ICollection<UserDetail> UserDetails { get; set; }
    }
    public class SexMetadata
    {
        public int Id { get; set; }
        [Display(Name = "Sex")]     
        public string Sex1 { get; set; }
        public virtual ICollection<UserDetail> UserDetails { get; set; }
    }

    public  class EducationMetadata
    {
        public int Id { get; set; }
        public string UserID { get; set; }

        //[Display(Name = "Instituion Name")]
        [Required(ErrorMessage = "Enter Instituion Name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Enter Course/Field of study")]
        public string Course { get; set; }

        [Required(ErrorMessage = "Enter Qualification")]
        public string Qualification { get; set; }
        [Display(Name = "End Date"),DisplayFormat(DataFormatString="{0:dd-MM-yyyy}",ApplyFormatInEditMode=true)]
        [Required(ErrorMessage = "Enter End Date")]
        public Nullable<System.DateTime> FromDate { get; set; }
        [Display(Name = "Start Date"), DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "Enter Start Date")]
        public Nullable<System.DateTime> ToDate { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
    }
}