<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Add Course</h1>

<form method="post" action="saveCourse.jsp">
    <div class="form-group"> 

        <label>Course Name</label>
        <input type="text" name="course_name" required="required" placeholder="Enter Course Name"
               class="form-control">
    </div>
    <div class="form-group"> 

        <label>Course Fees</label>
        <input type="number" name="course_fees" required="required" placeholder="Enter Course Fees"
               class="form-control">
    </div>
    <div class="form-inline"> 

        <label>Status</label>
        <label>
        <input type="checkbox" name="course_status" class="">
        Active
        </label>
        </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="index.jsp"class="btn btn-danger">Back</a>
</form>

<%@include file="../../footer.jsp" %>