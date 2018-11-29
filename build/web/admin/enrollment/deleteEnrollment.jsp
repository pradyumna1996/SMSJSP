<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>

<%
EnrollmentDAO enrollmentDAO= new EnrollmentDAOImpl();
if(request.getParameter("id")!=null){
    int id= Integer.parseInt(request.getParameter("id"));
enrollmentDAO.delete(id); 
response.sendRedirect("index.jsp");
}
%>