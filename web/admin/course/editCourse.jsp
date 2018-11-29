<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>
<%@page import="com.prad.webapp.entity.Course"%>
<%@page import="com.prad.webapp.dao.impl.CourseDAOImpl"%>
<%@page import="com.prad.webapp.dao.CourseDAO"%>
<%
    CourseDAO courseDAO = new CourseDAOImpl();
    Course course = new Course();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        course = courseDAO.getById(id);
        if(course==null){
            course=new Course();
        response.sendRedirect("index.jsp");
        }
    }else{
    response.sendRedirect("index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Edit Course</h1>

<form method="post" action="saveCourse.jsp">
    <div class="form-group"> 

        <label>Course Name</label>
        <input type="text" name="course_name" required="required" placeholder="Enter Course Name"
               class="form-control" value="<%=course.getName()%>" />
    </div>
    <div class="form-group"> 

        <label>Course Fees</label>
        <input type="number" name="course_fees" required="required" placeholder="Enter Course Fees"
               class="form-control" value="<%=course.getFees()%>">
    </div>
    <div class="form-inline"> 

        <label>Status</label>
        <label>
            <input type="checkbox" name="course_status" class=""            
                   <% out.println((course.isStatus()) ? "checked='checked'" : "");%>/>
            Active
        </label>
    </div>
    <input type="hidden" name="course_id" value="<%=course.getId()%>"/>
    <button type="submit" class="btn btn-success">Update</button>
    <a href="index.jsp"class="btn btn-danger">Back</a>
</form>

<%@include file="../../footer.jsp" %>