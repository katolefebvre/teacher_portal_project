﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeacherPortalProject.Views.Courses
{
    public partial class CoursesIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCourseCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Courses/CoursesCreate");
        }

        protected void gridCourses_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}