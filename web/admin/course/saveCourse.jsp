<%@page import="com.prad.webapp.dao.impl.CourseDAOImpl"%>
<%@page import="com.prad.webapp.dao.CourseDAO"%>
<%@page import="com.prad.webapp.entity.Course"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Course course= new Course();
    course.setName(request.getParameter("course_name"));
    course.setFees(Integer.parseInt(request.getParameter("course_fees")));
    course.setStatus(request.getParameter("course_status")!=null);
    CourseDAO courseDAO = new CourseDAOImpl();
    if(request.getParameter("course_id")==null){
    
    courseDAO.insert(course);
    }else{
    int id=Integer.parseInt(request.getParameter("course_id"));
    course.setId(id);
    courseDAO.update(course);    }
    response.sendRedirect("index.jsp");
    } else{
    out.println("<h1> Error saving directly. </h1>" );
    }
%>