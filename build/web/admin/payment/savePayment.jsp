<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>

<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.PaymentDAOImpl"%>
<%@page import="com.prad.webapp.dao.PaymentDAO"%>
<%@page import="com.prad.webapp.entity.Payment"%>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        Payment payment = new Payment();
        PaymentDAO paymentDAO = new PaymentDAOImpl();
        int eid = Integer.parseInt(request.getParameter("enrollment_id"));
        payment.setEnrollment(new Enrollment(eid));
        payment.setPaymentAmount(Integer.parseInt(request.getParameter("amount")));
        if (request.getParameter("payment_id") == null) {
            paymentDAO.insert(payment);
        } else {
            int id = Integer.parseInt(request.getParameter("payment_id"));
            payment.setId(id);
            paymentDAO.update(payment);
        }
        response.sendRedirect("index.jsp");
    } else {
        out.println("<h1> Saving Directly Prohibhited !! </h1>");
    }
%>