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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.FullName = txtStudentName.Text;
            student.GPA = float.Parse(txtGPA.Text);
            String insert = "INSERT INTO Student (FullName, GPA) VALUES(@FullName, @GPA)";

            SqlConnection con = new SqlConnection(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");

            try
            {
                SqlCommand cmd = new SqlCommand(insert, con);
                con.Open();
                cmd.Parameters.AddWithValue("@FullName", student.FullName);
                cmd.Parameters.AddWithValue("@GPA", student.GPA);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
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
    }
}