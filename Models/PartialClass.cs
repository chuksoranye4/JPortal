using System;
using System.ComponentModel.DataAnnotations;

namespace JPortal.Models
{
    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {     
    }

    [MetadataType(typeof(JobListMetadata))]
    public partial class JobList
    {
    }

    [MetadataType(typeof(JobCategoryMetadata))]
    public partial class JobCategory
    {
    }
    [MetadataType(typeof(SexMetadata))]
    public partial class Sex
    {
    }
    [MetadataType(typeof(CountryMetadata))]
    public partial class Country
    {
    }
    [MetadataType(typeof(EducationMetadata))]
    public partial class Education
    {
    }
}
