
<%@page import="com.prad.webapp.dao.impl.PaymentDAOImpl"%>

<%@page import="com.prad.webapp.dao.PaymentDAO"%>
<%
PaymentDAO paymentDAO= new PaymentDAOImpl();
if(request.getParameter("id")!=null){
    int id= Integer.parseInt(request.getParameter("id"));
paymentDAO.delete(id); 
response.sendRedirect("index.jsp");
}
%>