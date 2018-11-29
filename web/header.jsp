<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMS App</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js" type="text/javascript"></script>
    </head>
    
    <body>
        <nav class = "navbar navbar-default" role = "navigation">
   
   <div class = "navbar-header">
      <a class = "navbar-brand" href = "${pageContext.request.contextPath}/#">Student Management System</a>
   </div>
   
   <div>
      <ul class = "nav navbar-nav">
          <li><a href = "${pageContext.request.contextPath}/admin/student/index.jsp">Students</a></li>
          <li><a href = "${pageContext.request.contextPath}/admin/course/index.jsp">Courses</a></li>
          <li><a href = "${pageContext.request.contextPath}/admin/enrollment/index.jsp">Enrollments</a></li>
          <li><a href = "${pageContext.request.contextPath}/admin/payment/index.jsp">Payments</a></li>
          <li><a href = "${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
      </ul>
   </div>
   
</nav>
        <div class="container">
            