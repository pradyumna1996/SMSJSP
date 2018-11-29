<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>
<%@page import="com.prad.webapp.dao.impl.PaymentDAOImpl"%>
<%@page import="com.prad.webapp.entity.Payment"%>
<%@page import="com.prad.webapp.dao.PaymentDAO"%>
<%
    PaymentDAO paymentDAO = new PaymentDAOImpl();
    Payment payment = new Payment();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        payment = paymentDAO.getById(id);
        if(payment==null){
            payment=new Payment();
        response.sendRedirect("index.jsp");
        }
    }else{
    response.sendRedirect("index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Edit Payment Detail</h1>

<form method="post" action="savePayment.jsp">
    <div class="form-group">
        
        <label>Enrollment ID</label>
        <select name="enrollment_id" required="required" class="form-control">
            <option value="">Select ID</option>
            <%
                EnrollmentDAO enrollmentDAO = new EnrollmentDAOImpl();
                for (Enrollment e : enrollmentDAO.getAll()) {
            %>
            <option value="<%=e.getId()%>"> <%=e.getId()%> </option>

            <% } %>
        </select>
    </div>
    <div class="form-group">
        
        <label> Amount</label>
        <input type="text" name="amount" required="required" placeholder="Enter Amount To Be Paid" class="form-control" 
               value="<%=payment.getPaymentAmount() %> " >
    </div>
    <input type="hidden" name="payment_id" value="<%=payment.getId()%>"/>
    <button type="submit" class="btn btn-success">Update</button>
    <a href="index.jsp"class="btn btn-danger">Back</a>
</form>

<%@include file="../../footer.jsp" %>