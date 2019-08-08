using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeacherPortalProject.Models;

namespace TeacherPortalProject.Views.Assignments
{
    public partial class AssignmentsCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Assignment assignment = new Assignment();
            String insertAssignment = "INSERT INTO Assignment (Name, Grade, CourseID, StudentID) VALUES (@Name, @Grade, " +
                "(SELECT Id FROM Course WHERE Id = @CourseID), (SELECT Id FROM Student WHERE Id = @StudentID))";

            SqlConnection con = new SqlConnection(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");

            try
            {
                SqlCommand cmdAssignment = new SqlCommand(insertAssignment, con);
                con.Open();
                cmdAssignment.Parameters.AddWithValue("@Name", assignment.Name);
                cmdAssignment.Parameters.AddWithValue("@Grade", assignment.Grade);
                cmdAssignment.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);
                cmdAssignment.Parameters.AddWithValue("@StudentID", ddlStudents.SelectedValue);
                cmdAssignment.ExecuteNonQuery();
                cmdAssignment.Dispose();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("~/Views/Assignments/AssignmentsIndex.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Assignments/AssignmentsIndex.aspx");
        }
    }
}