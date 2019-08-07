using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using TeacherPortalProject.Models;

namespace TeacherPortalProject.Models
{
    public class Student
    {
        public int ID { get; set; }
        public string FullName { get; set; }

        [Range(0, 4.0, ErrorMessage = "GPA must be between 0 and 4.")]
        public decimal GPA { get; set; }
    }
}