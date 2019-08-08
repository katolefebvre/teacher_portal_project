<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignmentsCreate.aspx.cs" Inherits="TeacherPortalProject.Views.Assignments.AssignmentsCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create a Student</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <style type="text/css">
        .auto-style1 {
            width: 145px;
        }

        .auto-style2 {
            margin-top: 5px;
        }

        .auto-style3 {
            width: 294px;
        }

        .auto-style4 {
            margin-left: 40px;
        }

        .auto-style5 {
            width: 145px;
            height: 27px;
        }

        .auto-style6 {
            width: 294px;
            height: 27px;
        }
    </style>
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
            <h1 class="auto-style4">Assignments - New Assignment</h1>
        </div>
        <div class="auto-style4">
            <table>
                <tr>
                    <th class="auto-style1">Assignment Name:</th>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtStudentName" runat="server" CssClass="auto-style2" Width="265px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style5">Grade (%):</th>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtGrade" runat="server" CssClass="auto-style2" Width="265px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style1">Course:</th>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="auto-style2" DataSourceID="CoursesList" DataTextField="Name" DataValueField="Id" Width="276px" Height="25px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CoursesList" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <th>Student:</th>
                    <td>
                        <asp:DropDownList ID="ddlStudents" runat="server" DataSourceID="StudentList" DataTextField="FullName" DataValueField="Id" Width="276px" Height="25px" CssClass="auto-style2">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="StudentList" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT [Id], [FullName], [CourseID] FROM [Student]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create New Assignment" Height="40px" Width="160px" CssClass="auto-style2" />
            <asp:Button ID="btnCancel" runat="server" CssClass="auto-style2" Height="40px" Text="Cancel" Width="160px" OnClick="btnCancel_Click" />
        </div>
    </form>
</body>
</html>
