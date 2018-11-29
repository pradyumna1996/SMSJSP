<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Add Student</h1>

<form method="post" action="saveStudent.jsp">
    <div class="form-group"> 

        <label> First Name</label>
        <input type="text" name="first_name" required="required" placeholder="Enter First Name"
               class="form-control">
    </div>
    
    <div class="form-group"> 

        <label> Last Name</label>
        <input type="text" name="last_name" required="required" placeholder="Enter Last Name"
               class="form-control">
    </div>
    
    <div class="form-group"> 

        <label> Email Address</label>
        <input type="text" name="email" required="required" placeholder="Enter email here"
               class="form-control">
    </div>
    <div class="form-group"> 

        <label> Contact Number</label>
        <input type="text" name="contact_no" required="required" placeholder="Enter Contact Number"
               class="form-control">
    </div>
    <div class="form-inline"> 

        <label>Status</label>
        <label>
        <input type="checkbox" name="student_status" class="">
        Active
        </label>
        </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="${pageContext.request.contextPath}/admin/student/index.jsp" class="btn btn-danger">Back</a>
</form>

<%@include file="../../footer.jsp" %>