using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TeacherPortalProject.Models;

namespace TeacherPortalProject.Models
{
    public class Assignment
    {
        public int ID { get; set; }
        public Course Course { get; set; }
        public Student Student { get; set; }
        public string Name { get; set; }
    }
}