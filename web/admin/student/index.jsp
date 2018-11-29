<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.entity.Student"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%@include file="../../header.jsp" %>
<h1>Students</h1>
<div class="pull-right">
    <p>
        <a href="addStudent.jsp" class="btn btn-success btn-xs"><span class="gyphicon glyphicon-plus"></span></a>
        
    </p>
</div>
<table class="table table-bordered table-striped table-hover">

    <tr>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Email</th>
        <th>Contact Number</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        StudentDAO studentDAO = new StudentDAOImpl();
        for (Student s : studentDAO.getAll()) {

    %>
    <tr class="<%=(s.isStatus()) ? "success" : "danger"%>"> 
        <td> <%=s.getId()%> </td>
        <td> <%=s.getFirstName()%> <%=s.getLastName() %> </td>
        <td> <%=s.getEmail() %> </td>
        <td> <%=s.getContactNo() %> </td>
        
        <td> <%=s.isStatus()%> </td>
        <td>
            <a href="editStudent.jsp?id=<%=s.getId() %> " class="btn btn-success btn-xs">
                <span class="glyphicon glyphicon-pencil" </span>
            </a>    
            <a href="deleteStudent.jsp?id=<%=s.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete ?')" >
                <span class="glyphicon glyphicon-trash"> </span>
            </a>

        </td>

    </tr>
    <% }%>
</table>
<%@include file="../../footer.jsp" %>
