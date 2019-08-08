<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoursesCreate.aspx.cs" Inherits="TeacherPortalProject.Views.Courses.CoursesCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create a Course</title>
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
            <h1 class="auto-style4">Courses - New Course</h1>
        </div>
        <div class="auto-style4">
            <table>
                <tr>
                    <th class="auto-style1">Course Name:</th>
                    <td class="auto-style3">

                        <asp:TextBox ID="txtCourseName" runat="server" Width="235px" CssClass="auto-style2"></asp:TextBox>

                    </td>
                </tr>
            </table>
            <asp:Button ID="btnCreateC" runat="server" OnClick="btnCreateC_Click" Text="Create New Course" Height="39px" Width="256px" CssClass="auto-style2" />
        </div>
    </form>
</body>
</html>
