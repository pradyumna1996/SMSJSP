<%@page import="com.prad.webapp.entity.Student"%>
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>
<%@include file="../header.jsp" %>
<%
    EnrollmentDAO enrollmentDAO = new EnrollmentDAOImpl();
    Enrollment enrollment = new Enrollment();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        enrollment = enrollmentDAO.getById(id);
        if(enrollment==null){
            enrollment=new Enrollment();
        response.sendRedirect("index.jsp");
        }
    }else{
    response.sendRedirect("index.jsp");
    }
%>

<h1>Edit Enroll Student </h1>
<form method="post" action="">
    <div class="form-group">
        
        <label>Course</label>
        <select name="course_id" required="required" class="form-control" >
            <option value="<%=enrollment.getCourse().getName() %>" ></option>
            <%
                
                for (Enrollment e : enrollmentDAO.getAll()) {
            %>
            <option value="<%=e.getId()%>"> <%=e.getCourse().getName() %> </option>

            <% } %>
        </select>
    </div>
    <div class="form-group"> 
        <label>Student</label>
        <select name="student_id" required="required" class="form-control">
            <option value="">Select Student</option>
            <%
                StudentDAO studentDAO = new StudentDAOImpl();
                for (Student s : studentDAO.getAll()) {
            %>
            <option value="<%=s.getId()%>"> <%=s.getFirstName()%> <%=s.getLastName()%>  </option>
            <% }%>
        </select>
    </div>
    <div class="form-group">
        <label>Fees</label>
        <input type="text" name="fees" required="required" class="form-control" value
               ="<%=enrollment.getFees()
              %>" >
    </div>    
    <div class="form-group">
        <label>Discount</label>
        <input type="text" name="discount" required="required" class="form-control" 
               value="<%=enrollment.getDiscount() %>" >(%)
    </div> 
    <div class="form-group">
        <label>Status</label>
        <select name="status" required="required" class="form-control">
        <option value="blank">Select Status</option>
        <option value="Enrolled">Enrolled</option>
        <option value="Defered">Defered</option>
        </select>
    </div> 
        
        <input type="hidden" name="course_id" value="<%=enrollment.getId() %>"/>
    <button type="submit" class="btn btn-success">Update</button>
    <a href="index.jsp"class="btn btn-danger">Back</a>

</form>
<%@include file="../footer.jsp" %>


