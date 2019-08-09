using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeacherPortalProject.Views.Courses
{
    public partial class CoursesIndex : System.Web.UI.Page
    {
        public List<String> lstStudents = new List<String>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCourseCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Courses/CoursesCreate");
        }

        protected void gridCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
            "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");
            SqlDataReader reader;

            int SID = Convert.ToInt32(gridCourses.SelectedRow.Cells[0].Text);

            try
            {
                SqlCommand selectSID = new SqlCommand("Select FullName FROM Student Where CourseID= @SID;", con);
                con.Open();
                selectSID.Parameters.AddWithValue("@SID", SID);
                reader = selectSID.ExecuteReader();
                while (reader.Read())
                {
                    lstStudents.Add(reader[0].ToString());
                    //strValue=myreader["email"].ToString();
                    //strValue=myreader.GetString(0);
                }
                con.Close();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}