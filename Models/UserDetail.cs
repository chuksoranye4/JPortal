//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JPortal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserDetail
    {
        public int Id { get; set; }
        public string UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public Nullable<int> SexId { get; set; }
        public Nullable<int> MaritalStatusId { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public Nullable<int> StateId { get; set; }
        public Nullable<int> CountryId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Country Country { get; set; }
        public virtual MaritalStatu MaritalStatu { get; set; }
        public virtual Sex Sex { get; set; }
        public virtual State State { get; set; }
    }
}