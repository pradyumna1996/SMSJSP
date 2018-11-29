<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    
response.sendRedirect("../../index.jsp");
    }
%>

<%@page import="com.prad.webapp.entity.Student"%>
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%
    StudentDAO studentDAO = new StudentDAOImpl();
    Student student = new Student();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        student = studentDAO.getById(id);
        if(student==null){
            student=new Student();
        response.sendRedirect("index.jsp");
        }
    }else{
    response.sendRedirect("index.jsp");
    }
%>
<%@include file="../../header.jsp" %>
<h1>Edit Student Details</h1>

<form method="post" action="saveStudent.jsp">
    <div class="form-group"> 

        <label>First Name</label>
        <input type="text" name="first_name" required="required" 
               class="form-control" value="<%=student.getFirstName()%>" />
    </div>
    <div class="form-group"> 

        <label>Last Name</label>
        <input type="text" name="last_name" required="required" 
               class="form-control" value="<%=student.getLastName() %>">
    </div>
     <div class="form-group"> 

        <label> Email Address</label>
        <input type="text" name="email" required="required" 
               class="form-control" value="<%=student.getEmail() %>" >
    </div>
    <div class="form-group"> 

        <label> Contact Number</label>
        <input type="text" name="contact_no" required="required" 
               class="form-control" value="<%=student.getContactNo() %>">
    </div>
    <div class="form-inline"> 

        <label>Status</label>
        <label>
            <input type="checkbox" name="student_status" class=""            
                   <% out.println((student.isStatus()) ? "checked='checked'" : "");%>/>
            Active
        </label>
    </div>
    <input type="hidden" name="student_id" value="<%=student.getId()%>"/>
    <button type="submit" class="btn btn-success">Update</button>
    <a href="index.jsp"class="btn btn-danger">Back</a>
</form>

<%@include file="../../footer.jsp" %>