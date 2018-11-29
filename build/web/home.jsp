<%@include file="header.jsp" %>
<%@include file="test.jsp" %>
<div id = "myCarousel" class = "carousel slide">
   
   <!-- Carousel indicators -->
   <ol class = "carousel-indicators">
      <li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
      <li data-target = "#myCarousel" data-slide-to = "1"></li>
      <li data-target = "#myCarousel" data-slide-to = "2"></li>
   </ol>   
   
   <!-- Carousel items -->
   <div class = "carousel-inner">
      <div class = "item active">
          <img src = "${pageContext.request.contextPath}/assets/images/slide1.jpg" alt = "First slide">
      </div>
      
      <div class = "item">
         <img src = "${pageContext.request.contextPath}/assets/images/slide2.jpg" alt = "Second slide">
      </div>
      
      <div class = "item">
         <img src = "${pageContext.request.contextPath}/assets/images/slide3.jpg" alt = "Third slide">
      </div>
   </div>
   
   <!-- Carousel nav -->
   <a class = "carousel-control left" href = "#myCarousel" data-slide = "prev">&lsaquo;</a>
   <a class = "carousel-control right" href = "#myCarousel" data-slide = "next">&rsaquo;</a>
   
</div> 


<%@include file="footer.jsp" %>