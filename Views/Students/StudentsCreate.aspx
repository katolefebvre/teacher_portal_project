<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsCreate.aspx.cs" Inherits="TeacherPortalProject.Views.Students.StudentsCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create a Student</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">The Ultimate Teacher Portal</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/">Home</a></li>
                        <li><a runat="server" href="~/Views/Students/StudentsIndex">Students</a></li>
                        <li><a runat="server" href="~/Views/Courses/CoursesIndex">Courses</a></li>
                        <li><a runat="server" href="~/Views/Assignments/AssignmentsIndex">Assignments</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div>
            <h1>Students - New Student</h1>
        </div>
        <div>
            <table>
                <tr>
                    <th>Student Name:</th>
                    <td>
                        <asp:TextBox ID="txtStudentName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>GPA:</th>
                    <td>
                        <asp:TextBox ID="txtGPA" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Course:</th>
                    <td>
                        <asp:DropDownList ID="ddlCourses" runat="server" DataSourceID="Courses" DataTextField="Name" DataValueField="Name">
                        </asp:DropDownList>
                        <asp:EntityDataSource ID="CourseEntity" runat="server">
                        </asp:EntityDataSource>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create New Student" />
            <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT [Name] FROM [Course]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>