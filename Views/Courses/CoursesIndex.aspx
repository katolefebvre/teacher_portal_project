<%@ Page Title="Courses" Language="C#" AutoEventWireup="true"
    CodeBehind="CoursesIndex.aspx.cs"
    Inherits="TeacherPortalProject.Views.Courses.CoursesIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courses</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <style type="text/css">
        h1 {
            margin-left: 5%;
        }

        .auto-style1 {
            margin-left: 40px;
            margin-bottom: 5px;
        }

        .auto-style2 {
            margin-left: 40px;
            margin-bottom: 5px;
            margin-top: 0px;
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button
                        type="button"
                        class="navbar-toggle"
                        data-toggle="collapse"
                        data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">The Ultimate Teacher Portal</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/">Home</a></li>
                        <li>
                            <a runat="server" href="~/Views/Students/StudentsIndex">Students</a>
                        </li>
                        <li>
                            <a runat="server" href="~/Views/Courses/CoursesIndex">Courses</a>
                        </li>
                        <li>
                            <a runat="server" href="~/Views/Assignments/AssignmentsIndex">Assignments</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div>
            <h1 class="auto-style1">Courses - Home</h1>
        </div>
        <div>
            <asp:Button
                ID="btnCourseCreate"
                runat="server"
                OnClick="btnCourseCreate_Click"
                Text="Create New Course"
                CssClass="auto-style1" Height="30px" Width="220px" />
        </div>
        <div>
            <asp:GridView
                ID="gridCourses"
                runat="server"
                AutoGenerateColumns="False"
                CellPadding="4"
                DataKeyNames="Id"
                DataSourceID="CoursesDataSource"
                GridLines="None"
                Width="50%"
                CssClass="auto-style2"
                OnSelectedIndexChanged="gridCourses_SelectedIndexChanged"
                AllowSorting="True"
                ForeColor="#333333" Font-Size="16px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField
                        DataField="Id"
                        HeaderText="Id"
                        ReadOnly="True"
                        SortExpression="Id" />
                    <asp:BoundField
                        DataField="Name"
                        HeaderText="Name"
                        SortExpression="Name" />
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
                                CommandName="Select"
                                Text="Select"></asp:LinkButton>
                            &nbsp;<asp:LinkButton
                                ID="LinkButton3"
                                runat="server"
                                CausesValidation="False"
                                CommandName="Delete"
                                Text="Delete"
                                OnClientClick="return confirm('Are you sure you want to delete this course? All students and assignments attached to this course will be deleted.');"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" Width="25%" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle
                    BackColor="#2461BF"
                    ForeColor="White"
                    HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle
                    BackColor="#D1DDF1"
                    Font-Bold="True"
                    ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <div id="labels" style="margin-left: 40px; height: 54px;">
                <label for="listStudents">Students Attending This Course:</label><br />
                <table id="listStudents">
                    <% foreach (var student in lstStudents)
                        { %>
                    <tr>
                        <td>
                            <%= student %>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <asp:SqlDataSource
                ID="CoursesDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>"
                SelectCommand="SELECT * FROM [Course]"
                DeleteCommand="DELETE FROM [Course] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [Course] ([Name]) VALUES (@Name)"
                UpdateCommand="UPDATE [Course] SET [Name] = @Name WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <footer style="text-align: center">
        <p>&copy; <%: DateTime.Now.Year %> - The Ultimate Teacher Portal</p>
        <p>
            Kato Lefebvre - 991 323 245
        <br />
            Wei Yang Zhou - 991 491 750
        </p>
    </footer>
</body>
</html>
