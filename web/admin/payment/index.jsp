<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.entity.Payment"%>
<%@page import="com.prad.webapp.dao.impl.PaymentDAOImpl"%>
<%@page import="com.prad.webapp.dao.PaymentDAO"%>
<%@include file="../../header.jsp" %>
<h1>Payment Details</h1>
<div class="pull-right">
    <p>
        <a href="addPayment.jsp" class="btn btn-success btn-xs"><span class="gyphicon glyphicon-plus"></span></a>
        
    </p>
</div>
<table class="table table-bordered table-striped table-hover">

    <tr>
        <th>Payment ID</th>
        <th>Enrollment ID</th>
        <th>Payment Date</th>
        <th>Amount</th>
        <th>Action</th>
    </tr>
    <%
        PaymentDAO paymentDAO = new PaymentDAOImpl();
        for (Payment p : paymentDAO.getAll()) {

    %>
    <tr> 
        <td> <%=p.getId()%> </td>
        <td> <%=p.getEnrollment().getId() %> </td>
        <td> <%=p.getPaymentDate()%> </td>
        <td> <%=p.getPaymentAmount() %> </td>
        
        <td>
            <a href="editPayment.jsp?id=<%=p.getId() %> " class="btn btn-success btn-xs">
                <span class="glyphicon glyphicon-pencil" </span>
            </a>    
            <a href="deletePayment.jsp?id=<%=p.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete ?')" >
                <span class="glyphicon glyphicon-trash"> </span>
            </a>

        </td>

    </tr>
    <% }%>
</table>
<%@include file="../../footer.jsp" %>
