<%@ Page Title="Assignments" Language="C#" AutoEventWireup="true" CodeBehind="AssignmentsIndex.aspx.cs" Inherits="TeacherPortalProject.Views.Assignments.AssignmentsIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignments</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
            margin-bottom: 5px;
        }

        .auto-style2 {
            margin-left: 40px;
            margin-bottom: 5px;
            margin-top: 0px;
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
            <h1 class="auto-style1">Assignments - Home</h1>
        </div>
        <div>
            <asp:Button ID="btnAssignmentCreate" runat="server" OnClick="btnAssignmentCreate_Click" Text="Create New Assignment" CssClass="auto-style1" />
        </div>
        <div>
            <asp:GridView ID="gridAssignments" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="AssignmentsDataSource" ForeColor="#333333"
                GridLines="None" Width="80%" CssClass="auto-style2" Font-Size="16px" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Assignment ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="CourseID" HeaderText="Course ID" SortExpression="CourseID" />
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" SortExpression="StudentID" />
                    <asp:BoundField DataField="Name" HeaderText="Assignment Name" SortExpression="Name" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade %" SortExpression="Grade" />
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
            <asp:SqlDataSource ID="AssignmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>" SelectCommand="SELECT * FROM [Assignment]" DeleteCommand="DELETE FROM [Assignment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Assignment] ([CourseID], [StudentID], [Name], [Grade]) VALUES (@CourseID, @StudentID, @Name, @Grade)" UpdateCommand="UPDATE [Assignment] SET [CourseID] = @CourseID, [StudentID] = @StudentID, [Name] = @Name, [Grade] = @Grade WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Grade" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Grade" Type="Decimal" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
