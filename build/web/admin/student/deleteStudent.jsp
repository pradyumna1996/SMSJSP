<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%
StudentDAO studentDAO= new StudentDAOImpl();
if(request.getParameter("id")!=null){
    int id= Integer.parseInt(request.getParameter("id"));
studentDAO.delete(id); 
response.sendRedirect("index.jsp");
}
%>