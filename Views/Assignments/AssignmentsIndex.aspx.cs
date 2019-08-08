using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeacherPortalProject.Views.Assignments
{
    public partial class AssignmentsIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAssignmentCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Assignments/AssignmentsCreate.aspx");
        }
    }
}