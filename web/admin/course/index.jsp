
<%@page import="com.prad.webapp.entity.Course"%>
<%@page import="com.prad.webapp.dao.impl.CourseDAOImpl"%>
<%@page import="com.prad.webapp.dao.CourseDAO"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Courses</h1>
<div class="pull-right">
    <p>
        <a href="addCourse.jsp" class="btn btn-success"><span class="gyphicon glyphicon-plus"></span></a>
        
    </p>
</div>
<table class="table table-bordered table-striped table-hover">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Fees</th>
        <th>Status</th>
        <th>Added Date</th>
        <th>Action</th>
    </tr>
    <%
        CourseDAO courseDAO = new CourseDAOImpl();
        for (Course c : courseDAO.getAll()) {

    %>
    <tr class="<%=(c.isStatus()) ? "success" : "danger"%>"> 
        <td> <%=c.getId()%> </td>
        <td> <%=c.getName()%> </td>
        <td> <%=c.getFees()%> </td>
        <td> <%=c.isStatus()%> </td>
        <td> <%=c.getAdded_date() %> </td>
        <td>
            <a href="editCourse.jsp?id=<%=c.getId()%>" class="btn btn-success btn-xs">
                <span class="glyphicon glyphicon-pencil" </span>
            </a>    
            <a href="deleteCourse.jsp?id=<%=c.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete ?')" >
                <span class="glyphicon glyphicon-trash"> </span>
            </a>

        </td>

    </tr>
    <% }%>
</table>
<%@include file="../../footer.jsp" %>
