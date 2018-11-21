<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>
<%@include file="../header.jsp" %>
<h1> Enrollment Details </h1>
<div class="pull-right">
                <p>
                    <a href="addEnrollment.jsp" class="btn btn-success btn-xs"><span class="gyphicon glyphicon-plus"></span></a>
                </p>
            </div>
<table class="table table-bordered table-hover">
    <tr>
        <th>ID</th>
        <th>Student</th>
        <th>Course</th>
        <th>Fees</th>
        <th>Discount</th>
        <th>Remaining</th>
        <th>Status</th>
        <th>Action</th>
    </tr> 
    <%
        EnrollmentDAO enrollDAO = new EnrollmentDAOImpl();
        for (Enrollment e : enrollDAO.getAllData()) {
    %>
    <tr>

        <td><%=e.getId() %> </td>
        <td><%=e.getStudent().getFirstName()%>  <%=e.getStudent().getLastName()%> </td>
        <td><%=e.getCourse().getName() %> </td>
        <td><%=e.getFees()%> </td>
        <td><%=e.getDiscount() %>% </td>
        <td><%=e.getRemaining() %></td>
        <td><%=e.isStatus() %> </td>
        <td>
                        <a href="editEnrollment.jsp?id=<%=e.getId()%>" class="btn btn-success btn-xs">
                            <span class="glyphicon glyphicon-pencil" </span>
                        </a>    
                        <a href="deleteEnrollment.jsp?id=<%=e.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete ?')" >
                            <span class="glyphicon glyphicon-trash"> </span>
                        </a>
                        
                    </td>

    </tr>
    <% } %>
</table>
<%@include file="../footer.jsp" %>

