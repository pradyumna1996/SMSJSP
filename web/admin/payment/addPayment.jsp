<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>
<%@page import="com.prad.webapp.entity.Payment"%>
<%@page import="com.prad.webapp.dao.impl.PaymentDAOImpl"%>
<%@page import="com.prad.webapp.dao.PaymentDAO"%>
<%@include file="../../header.jsp" %>

<h1 class="text-center">Add a Payment for Enrolled Student</h1>
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
        <input type="text" name="amount" required="required" placeholder="Enter Amount To Be Paid" class="form-control" >
    </div>
        
        <button type="submit" class="btn btn-success">Save</button>
        <a href="index.jsp" class="btn btn-danger ">Back</a>
</form>
<%@include file="../../footer.jsp" %>
