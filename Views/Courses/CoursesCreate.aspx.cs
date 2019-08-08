using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeacherPortalProject.Models;
using System.Data.SqlClient;

namespace TeacherPortalProject.Views.Courses
{
    public partial class CoursesCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateC_Click(object sender, EventArgs e)
        {
            Course course = new Course();
            course.CourseName = txtCourseName.Text;

            String insertCourse = "INSERT INTO Course (Name) VALUES (@CourseName)";

            SqlConnection con = new SqlConnection(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");

            try
            {
                SqlCommand cmdCourse = new SqlCommand(insertCourse, con);
                con.Open();
                cmdCourse.Parameters.AddWithValue("@CourseName", course.CourseName);
                cmdCourse.ExecuteNonQuery();
                cmdCourse.Dispose();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("~/Views/Courses/CoursesIndex.aspx");
        }
    }
}