using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeacherPortalProject.Models;

namespace TeacherPortalProject.Views.Students
{
    public partial class StudentsCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.FullName = txtStudentName.Text;
            student.GPA = decimal.Parse(txtGPA.Text);
            String insertStudent = "INSERT INTO Student (FullName, GPA, CourseID) VALUES (@FullName, @GPA, " +
                "(SELECT Id FROM Course WHERE Id = @CourseID))";

            SqlConnection con = new SqlConnection(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");

            try
            {
                SqlCommand cmdStudent = new SqlCommand(insertStudent, con);
                con.Open();
                cmdStudent.Parameters.AddWithValue("@FullName", student.FullName);
                cmdStudent.Parameters.AddWithValue("@GPA", student.GPA);
                cmdStudent.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);
                cmdStudent.ExecuteNonQuery();
                cmdStudent.Dispose();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("~/Views/Students/StudentsIndex.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Students/StudentsIndex.aspx");
        }
    }
}