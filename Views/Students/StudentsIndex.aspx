<%@ Page Title="Students" Language="C#" AutoEventWireup="true" CodeBehind="StudentsIndex.aspx.cs" Inherits="TeacherPortalProject.Views.Students.StudentsIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <style type="text/css">
        h1 {
            margin-left: 40px;
        }

        #main {
            margin: 0px 35px 0px 35px;
            height: 100%;
            padding: 5px;
        }

        #table {
            width: 50%;
            height: 100%;
            float: left;
        }

        #labels {
            margin-left: 0px;
        }

        td {
            cursor: pointer;
        }

        .hover_row {
            background-color: #A1DCF2;
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
            <h1 class="auto-style1">Students - Home</h1>
        </div>
        <div>
            <asp:Button
                ID="btnStudentCreate"
                runat="server"
                OnClick="btnStudentCreate_Click"
                Text="Create New Student"
                Style="margin-left: 40px; margin-bottom: 5px;"
                Width="220px"
                Height="30px" />
        </div>
        <div id="main">
            <div id="table" style="margin-right: 10px">
                <asp:GridView ID="gridStudent" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="StudentsDataSource"
                    Width="100%" CssClass="auto-style2" Font-Size="16px" AllowSorting="True" OnSelectedIndexChanged="gridStudent_SelectedIndexChanged" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                        <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                        <asp:BoundField DataField="Name" HeaderText="Course" SortExpression="Name" />
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
                                    OnClientClick="return confirm('Are you sure you want to delete this student? All assignments attached to this student will be deleted.');"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="25%" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="StudentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>"
                    SelectCommand="SELECT Student.Id, Student.FullName, Student.GPA, Course.Name FROM Student INNER JOIN Course ON Student.CourseID = Course.Id"
                    DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id"
                    InsertCommand="INSERT INTO [Student] ([FullName], [GPA], [CourseID]) VALUES (@FullName, @GPA, @CourseID)"
                    UpdateCommand="UPDATE [Student] SET [FullName] = @FullName, [GPA] = @GPA, [CourseID] = @CourseID WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="GPA" Type="Decimal" />
                        <asp:Parameter Name="CourseID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="GPA" Type="Decimal" />
                        <asp:Parameter Name="CourseID" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div id="labels">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="outID" runat="server" Font-Size="16px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="outName" runat="server" Font-Size="16px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="outGPA" runat="server" Font-Size="16px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="outCourseName" runat="server" Font-Size="16px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
