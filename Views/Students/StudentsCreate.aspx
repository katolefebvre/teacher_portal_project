<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsCreate.aspx.cs" Inherits="TeacherPortalProject.Views.Students.StudentsCreate" %>

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
            margin-left: 0px;
        }

        .auto-style3 {
            width: 294px;
        }

        .auto-style4 {
            margin-left: 40px;
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
            <h1>Students - New Student</h1>
        </div>
        <div class="auto-style4">
            <table>
                <tr>
                    <th class="auto-style1">Student Name:</th>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtStudentName" runat="server" CssClass="auto-style2" Width="265px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style1">GPA:</th>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtGPA" runat="server" CssClass="auto-style2" Width="265px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style1">Course:</th>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="auto-style2" DataSourceID="Courses" DataTextField="Name" DataValueField="Id" Width="270px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create New Student" Height="39px" Width="256px" />
            <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
