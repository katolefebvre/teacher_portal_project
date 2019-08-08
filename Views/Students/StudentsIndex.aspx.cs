using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeacherPortalProject.Models;

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

        protected void gridStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            Student student = new Student();
            student.ID = Convert.ToInt32(gridStudent.SelectedRow.Cells[0].Text);
            student.FullName = gridStudent.SelectedRow.Cells[1].Text;
            student.GPA = Convert.ToDecimal(gridStudent.SelectedRow.Cells[2].Text);
            int courseID = Convert.ToInt32(gridStudent.SelectedRow.Cells[3].Text);
            string courseName = "";

            SqlConnection con = new SqlConnection(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=TeacherPortal;Integrated Security=True");

            try
            {
                SqlCommand selectCName = new SqlCommand("SELECT Name FROM Course WHERE Id = @Id", con);
                con.Open();
                selectCName.Parameters.AddWithValue("@Id", courseID);
                courseName = (string)(selectCName.ExecuteScalar());
                selectCName.Dispose();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }

            outID.Text = "<b>Student ID: </b>" + student.ID.ToString();
            outName.Text = "<b>Student Name: </b>" + student.FullName;
            outGPA.Text = "<b>GPA: </b>" + student.GPA.ToString();
            outCourseName.Text = "<b>Course Name: </b>" + courseName;
        }

        protected void gridStudent_onRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "onMouseOver('" + (e.Row.RowIndex + 1) + "')";
                e.Row.Attributes["onmouseout"] = "onMouseOut('" + (e.Row.RowIndex + 1) + "')";
            }
        }
    }
}