
<%@page import="com.prad.webapp.dao.impl.CourseDAOImpl"%>
<%@page import="com.prad.webapp.dao.CourseDAO"%>
<%
CourseDAO courseDAO= new CourseDAOImpl();
if(request.getParameter("id")!=null){
    int id= Integer.parseInt(request.getParameter("id"));
courseDAO.delete(id); 
response.sendRedirect("index.jsp");
}
%>