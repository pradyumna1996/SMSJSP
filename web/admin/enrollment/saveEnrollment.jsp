<%@page import="com.prad.webapp.entity.Enrollment"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Enrollment enrollment= new Enrollment();
    Course course= new Course();
    enrollment.setCourse();
    
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
    out.println("<h1> Baatho Hunchhas Jaatha  !! </h1>" );
    }
%>