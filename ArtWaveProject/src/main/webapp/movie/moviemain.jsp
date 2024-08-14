<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
<link rel='stylesheet' href='https://unpkg.com/flickity@2/dist/flickity.min.css'>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	  const target = document.getElementById('flickity');
	  const videos = target.getElementsByTagName('video');
	  const videosLength = videos.length;

	  const flickity = new Flickity(target,{
	    wrapAround:true,
	    autoPlay:false,
	    on: {
	      ready: function() {
	        console.log('Flickity ready');
	        videos[0].play();
	      }
	    }
	  });

	  for(let i = 0;i < videosLength; i++){
	    videos[i].addEventListener('loadedmetadata',function(){
	      console.log("Video Duration_" + i + " : "+ videos[i].duration);
	    },false);
	    videos[i].addEventListener('ended',function(){
	      flickity.next('true');
	    },false);
	  }

	  flickity.on('change',changeSlide);
	  function changeSlide(index) {
	    for(let i = 0;i < videosLength; i++){
	      videos[i].currentTime = 0;
	      videos[index].play();
	    }
	  }
	})
</script>
</head>
<body>

			<!-- ***** 예고편 동영상 시작 ***** -->
		<div class="carousel" id="flickity" data-flickity>
    		<div class="carousel-cell">
      		<video muted controls preload="metadata" poster="" >
        		<source src="https://cf2.lottecinema.co.kr/lotte_image/2024/Pilot/Pilot_128072099.mp4" type="video/mp4" />
     		</video>
    		</div>
   		<div class="carousel-cell">
      		<video muted controls preload="metadata" poster="">
        		<source src="https://adimg.cgv.co.kr/images/202407/LandofHappiness/LandofHappiness_1080x608.mp4" type="video/mp4" />
      		</video>
    	</div>
    	<div class="carousel-cell">
      		<video muted controls preload="metadata" poster="">
        		<source src="https://adimg.cgv.co.kr/images/202407/10Lives/10Lives_PC_1080x608.mp4" type="video/mp4" />
      		</video>
    	</div>
    	<div class="carousel-cell">
      		<video muted controls preload="metadata" poster="">
        		<source src="https://adimg.cgv.co.kr/images/202408/victory/0809_victory_1080x608.mp4" type="video/mp4" />
      		</video>
    	</div>
  		</div>
  <!-- ***** 예고편 동영상 끝 ***** -->
  <div class="page-content">
  	<div class="heading-section">
        <h4><em>#</em> 박스오피스</h4>
      </div>
      
  <div class="most-popular">
  <div class="featured-games">
            <div class="row">
            <div class="col-lg-8">
            <h3>  <br></h3>
                <div class="owl-features owl-carousel">
                  <c:forEach var="vo" items="${tList }">
				 <div class="item">
				 <div class="thumb">
                <img src="https://www.kobis.or.kr${vo.mposter }"  alt="">
                 <div class="hover-effect">
                      <h6><a href="#" title="화면이동">상세정보</a></h6>
                      </div>
                    
                <h4 id="text">${vo.num }<br> <span>${vo.mtitle }</span></h4>
                <ul>
                	<li>예매율</li>
                    <li><i class="fa fa-ticket"></i>  ${vo.mrate }</li>
                </ul>
            </div>
        </div>
          </c:forEach>
        </div>
        </div>
       
	<!-- ***** Most Popular End ***** -->

	<!-- ***** 실시간 예매율 차트 시작 ***** -->
					
						<div class="col-lg-4">
							 <div class="top-downloaded">	
							</div>
						</div>
				</div>
					<!-- ***** 실시간 예매율 차트 끝  ***** -->
			</div>
        </div>
     </div>
</body>
	<script src="../assets/js/isotope.min.js"></script>
	<script src="../movie/owl2-carousel.js"></script>
	<script src="../assets/js/tabs.js"></script>
	<script src="../assets/js/popup.js"></script>
	<script src="../assets/js/custom.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.0/flickity.pkgd.min.js'></script>
</html>
