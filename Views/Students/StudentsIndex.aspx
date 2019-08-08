<%@ Page Title="Students" Language="C#" AutoEventWireup="true" CodeBehind="StudentsIndex.aspx.cs" Inherits="TeacherPortalProject.Views.Students.StudentsIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <style type="text/css">
        h1 {
            margin-left: 5%;
        }

        #main {
            margin: 0% 5% 0% 5%;
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
    <script type="text/javascript">
        function onMouseOver(rowIndex) {
            var gv = document.getElementById("gridStudent");
            var rowElement = gv.rows[rowIndex];
            rowElement.style.backgroundColor = "#c8e4b6";
            rowElement.cells.style.backgroundColor = "green";
        }

        function onMouseOut(rowIndex) {
            var gv = document.getElementById("gridStudent");
            var rowElement = gv.rows[rowIndex];
            rowElement.style.backgroundColor = "#fff";
            rowElement.cells.style.backgroundColor = "#fff";
        }
    </script>
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
            <asp:Button ID="btnStudentCreate" runat="server" OnClick="btnStudentCreate_Click" Text="Create New Student" CssClass="btnStyle" Style="margin-left: 5.2%" Width="220px" Height="30px" />
        </div>
        <div id="main">
            <div id="table">
                <asp:GridView ID="gridStudent" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="StudentsDataSource"
                    Width="100%" CssClass="auto-style2" Font-Size="16px" AllowSorting="True" OnSelectedIndexChanged="gridStudent_SelectedIndexChanged" OnRowDataBound="gridStudent_onRowDataBound" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Student ID" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                        <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                        <asp:BoundField DataField="CourseID" HeaderText="Course Number" SortExpression="CourseID" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="StudentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TeacherPortalConnectionString %>"
                    SelectCommand="SELECT * FROM [Student]"
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
