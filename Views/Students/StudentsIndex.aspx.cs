using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeacherPortalProject.Views.Students
{
    public partial class StudentsIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStudentCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Students/StudentsCreate.aspx");
        }
    }
}