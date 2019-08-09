<%@ Page
    Title="Assignments"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="AssignmentsIndex.aspx.cs"
    Inherits="TeacherPortalProject.Views.Assignments.AssignmentsIndex" %>

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
            <asp:Button
                ID="btnAssignmentCreate"
                runat="server"
                OnClick="btnAssignmentCreate_Click"
                Text="Create New Assignment"
                CssClass="auto-style1"
                Height="30px"
                Width="220px" />
        </div>
        <div>
            <asp:GridView
                ID="gridAssignments"
                runat="server"
                AutoGenerateColumns="False"
                CellPadding="4"
                DataKeyNames="Id"
                DataSourceID="AssignmentsDataSource"
                ForeColor="#333333"
                GridLines="None"
                Width="50%"
                CssClass="auto-style2"
                Font-Size="16px"
                AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                    <asp:BoundField DataField="FullName" HeaderText="Student" SortExpression="FullName" />
                    <asp:BoundField DataField="Expr1" HeaderText="Course" SortExpression="Expr1" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton
                                ID="LinkButton1"
                                runat="server"
                                CausesValidation="True"
                                CommandName="Update"
                                Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton
                                ID="LinkButton2"
                                runat="server"
                                CausesValidation="False"
                                CommandName="Cancel"
                                Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="LinkButton1"
                                runat="server"
                                CausesValidation="False"
                                CommandName="Edit"
                                Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton
                                ID="LinkButton2"
                                runat="server"
                                CausesValidation="False"
                                CommandName="Delete"
                                Text="Delete"
                                OnClientClick="return confirm('Are you sure you want to delete this assignment?');"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" Width="16%" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource
                ID="AssignmentsDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>"
                SelectCommand="SELECT Assignment.Id, Assignment.Name, Assignment.Grade, Student.FullName, Course.Name AS Expr1 FROM Assignment INNER JOIN Course ON Assignment.CourseID = Course.Id INNER JOIN Student ON Assignment.StudentID = Student.Id AND Course.Id = Student.CourseID"
                DeleteCommand="DELETE FROM [Assignment] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [Assignment] ([CourseID], [StudentID], [Name], [Grade]) VALUES (@CourseID, @StudentID, @Name, @Grade)"
                UpdateCommand="UPDATE [Assignment] SET [CourseID] = @CourseID, [StudentID] = @StudentID, [Name] = @Name, [Grade] = @Grade WHERE [Id] = @Id">
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
