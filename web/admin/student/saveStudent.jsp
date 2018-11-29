
<%@page import="com.prad.webapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.prad.webapp.dao.StudentDAO"%>
<%@page import="com.prad.webapp.entity.Student"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Student student= new Student();
    student.setFirstName(request.getParameter("first_name"));
    student.setLastName(request.getParameter("last_name"));
    student.setEmail(request.getParameter("email"));
    student.setContactNo(request.getParameter("contact_no"));
    student.setStatus(request.getParameter("student_status")!=null);
    StudentDAO studentDAO = new StudentDAOImpl();
    if(request.getParameter("student_id")==null){
    
    studentDAO.insert(student);
    }else{
    int id=Integer.parseInt(request.getParameter("student_id"));
    student.setId(id);
    studentDAO.update(student);    }
    response.sendRedirect("index.jsp");
    } else{
    out.println("<h1> Baatho Hunchhas Jaatha  !! </h1>" );
    }
%>