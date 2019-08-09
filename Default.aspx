<%@ Page
    Title="Home Page"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="TeacherPortalProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>The Ultimate Teacher Portal</h1>
        <p class="lead">The ultimate teacher portal to manage your students, courses, assignments, and grades.</p>
        <p class="lead">
            <asp:Button ID="btnStudent" runat="server" Text="Manage Students" OnClick="btnStudent_Click" />
            <asp:Button ID="btnCourse" runat="server" Text="Manage Courses" OnClick="btnCourse_Click" />
            <asp:Button ID="btnAssignment" runat="server" Text="Manage Assignments" OnClick="btnAssignment_Click" />
        </p>
    </div>
</asp:Content>
