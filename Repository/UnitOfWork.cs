using JPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JPortal.Repository
{
    public class UnitOfWork : IDisposable
    {
        private JPortalEntities context = new JPortalEntities();
        private GenericRepository<ApplicantApproval> applicantApprovalRepository;
        private GenericRepository<Certification> certificationRepository;
        private GenericRepository<Country> countryRepository;
        private GenericRepository<Education> educationRepository;
        private GenericRepository<JobCategory> jobCategoryRepository;
        private GenericRepository<JobList> jobListRepository;
        private GenericRepository<JobPreference> jobPreferenceRepository;
        private GenericRepository<JobsApply> jobsApplyRepository;
        private GenericRepository<MaritalStatu> maritalStatuRepository;
        private GenericRepository<Referee> refereeRepository;
        private GenericRepository<Sex> sexRepository;
        private GenericRepository<Skill> skillRepository;
        private GenericRepository<State> stateRepository;
        private GenericRepository<UserDetail> userDetailRepository;
        private GenericRepository<WorkedExpre> workedExpreRepository;
        private GenericRepository<Passport> passportRepository;
        private GenericRepository<AspNetUser> aspNetUsersRepository;
        public GenericRepository<ApplicantApproval> ApplicantApprovalRepository
        {
            get
            {
               

                if (this.applicantApprovalRepository == null)
                {
                    this.applicantApprovalRepository = new GenericRepository<ApplicantApproval>(context);
                }
                return applicantApprovalRepository;
            }
        }
        public GenericRepository<Certification> CertificationRepository
        {
            get
            {

                if (this.certificationRepository == null)
                {
                    this.certificationRepository = new GenericRepository<Certification>(context);
                }
                return certificationRepository;
            }
        }
        public GenericRepository<Country> CountryRepository
        {
            get
            {

                if (this.countryRepository == null)
                {
                    this.countryRepository = new GenericRepository<Country>(context);
                }
                return countryRepository;
            }
        }
        public GenericRepository<Education> EducationRepository
        {
            get
            {

                if (this.educationRepository == null)
                {
                    this.educationRepository = new GenericRepository<Education>(context);
                }
                return educationRepository;
            }
        }
        public GenericRepository<JobCategory> JobCategoryRepository
        {
            get
            {

                if (this.jobCategoryRepository == null)
                {
                    this.jobCategoryRepository = new GenericRepository<JobCategory>(context);
                }
                return jobCategoryRepository;
            }
        }
        public GenericRepository<JobList> JobListRepository
        {
            get
            {

                if (this.jobListRepository == null)
                {
                    this.jobListRepository = new GenericRepository<JobList>(context);
                }
                return jobListRepository;
            }
        }

        public GenericRepository<JobsApply> JobsApplyRepository
        {
            get
            {

                if (this.jobsApplyRepository == null)
                {
                    this.jobsApplyRepository = new GenericRepository<JobsApply>(context);
                }
                return jobsApplyRepository;
            }
        }
        public GenericRepository<JobPreference> JobPreferenceRepository
        {
            get
            {

                if (this.jobPreferenceRepository == null)
                {
                    this.jobPreferenceRepository = new GenericRepository<JobPreference>(context);
                }
                return jobPreferenceRepository;
            }
        }
        public GenericRepository<MaritalStatu> MaritalStatuRepository
        {
            get
            {

                if (this.maritalStatuRepository == null)
                {
                    this.maritalStatuRepository = new GenericRepository<MaritalStatu>(context);
                }
                return maritalStatuRepository;
            }
        }
        public GenericRepository<Referee> RefereeRepository
        {
            get
            {

                if (this.refereeRepository == null)
                {
                    this.refereeRepository = new GenericRepository<Referee>(context);
                }
                return refereeRepository;
            }
        }
        public GenericRepository<Sex> SexRepository
        {
            get
            {

                if (this.sexRepository == null)
                {
                    this.sexRepository = new GenericRepository<Sex>(context);
                }
                return sexRepository;
            }
        }
        public GenericRepository<Skill> SkillRepository
        {
            get
            {

                if (this.skillRepository == null)
                {
                    this.skillRepository = new GenericRepository<Skill>(context);
                }
                return skillRepository;
            }
        }
        public GenericRepository<State> StateRepository
        {
            get
            {

                if (this.stateRepository == null)
                {
                    this.stateRepository = new GenericRepository<State>(context);
                }
                return stateRepository;
            }
        }
        public GenericRepository<UserDetail> UserDetailRepository
        {
            get
            {

                if (this.userDetailRepository == null)
                {
                    this.userDetailRepository = new GenericRepository<UserDetail>(context);
                }
                return userDetailRepository;
            }
        }
        public GenericRepository<WorkedExpre> WorkedExpreRepository
        {
            get
            {

                if (this.workedExpreRepository == null)
                {
                    this.workedExpreRepository = new GenericRepository<WorkedExpre>(context);
                }
                return workedExpreRepository;
            }
        }

        public GenericRepository<Passport> PassportRepository
        {
            get
            {

                if (this.passportRepository == null)
                {
                    this.passportRepository = new GenericRepository<Passport>(context);
                }
                return passportRepository;
            }
        } 
        public GenericRepository<AspNetUser> AspNetUsersRepository
        {
            get
            {

                if (this.aspNetUsersRepository == null)
                {
                    this.aspNetUsersRepository = new GenericRepository<AspNetUser>(context);
                }
                return aspNetUsersRepository;
            }
        }       
        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}