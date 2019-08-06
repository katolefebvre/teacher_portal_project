using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TeacherPortalProject.Models;

namespace TeacherPortalProject.Models
{
    public class Student
    {
        public int ID { get; set; }
        public string FullName { get; set; }


        public float GPA { get; set; }
        public Course Course { get; set; }
    }
}