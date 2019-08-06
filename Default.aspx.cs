using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeacherPortalProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Students/StudentsIndex.aspx");
        }

        protected void btnCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Courses/CoursesIndex.aspx");
        }

        protected void btnAssignment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Assignments/AssignmentsIndex.aspx");
        }
    }
}