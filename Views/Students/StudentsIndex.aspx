<%@ Page Title="Students" Language="C#" AutoEventWireup="true" CodeBehind="StudentsIndex.aspx.cs" Inherits="TeacherPortalProject.Views.Students.StudentsIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students</title>
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
            <h1>Students - Home</h1>
        </div>
        <div>
            <asp:Button ID="btnStudentCreate" runat="server" OnClick="btnStudentCreate_Click" Text="Create New Student" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="StudentsDataSource" ForeColor="#333333" GridLines="None" Width="441px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="StudentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
