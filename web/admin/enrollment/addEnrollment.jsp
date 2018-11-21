<%@page import="com.prad.webapp.entity.Enrollment"%>
<%@page import="com.prad.webapp.dao.impl.EnrollmentDAOImpl"%>
<%@page import="com.prad.webapp.dao.EnrollmentDAO"%>
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.entity.Student"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%@page import="com.prad.webapp.entity.Course"%>
<%@page import="com.prad.webapp.dao.impl.CourseDAOImpl"%>
<%@page import="com.prad.webapp.dao.CourseDAO"%>
<%@include file="../header.jsp" %>
<%
if(request.getMethod().equalsIgnoreCase("post")){
EnrollmentDAO enrollDAO = new EnrollmentDAOImpl();
Enrollment enroll= new Enrollment();
int cid=Integer.parseInt(request.getParameter("course_id"));
enroll.setCourse(new Course(cid));
int sid=Integer.parseInt(request.getParameter("student_id"));
enroll.setStudent(new Student(sid));
enroll.setFees( Integer.parseInt(request.getParameter("fees")) );
enroll.setDiscount( Integer.parseInt(request.getParameter("discount")));
enroll.setStatus(request.getParameter("status"));

enrollDAO.insert(enroll);
response.sendRedirect("index.jsp");

}

%>
<h1>Enroll Student </h1>
<form method="post" action="">
    <div class="form-group">
        
        <label>Course</label>
        <select name="course_id" required="required" class="form-control">
            <option value="">Select Course</option>
            <%
                CourseDAO courseDAO = new CourseDAOImpl();
                for (Course c : courseDAO.getAll()) {
            %>
            <option value="<%=c.getId()%>"> <%=c.getName()%> </option>

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
        <input type="text" name="fees" required="required" class="form-control">
    </div>    
    <div class="form-group">
        <label>Discount</label>
        <input type="text" name="discount" required="required" default="0" class="form-control">(%)
    </div> 
    <div class="form-group">
        <label>Status</label>
        <select name="status" required="required" class="form-control">
        <option value="blank">Select Status</option>
        <option value="Enrolled">Enrolled</option>
        <option value="Defered">Defered</option>
        </select>
    </div> 
        
        <button type="submit" class="btn btn-success">Save</button>

</form>
<%@include file="../footer.jsp" %>
