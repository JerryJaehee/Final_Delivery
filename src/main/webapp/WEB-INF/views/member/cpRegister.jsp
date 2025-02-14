<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>쿠폰등록</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="container" style=" border: 1px solid gray; padding-bottom: 50px; margin-top: 50px;">
		<div class="row mt-4"  style="width: 55rem; margin:0 auto;">

				
				<div class="mb-3">
					<label for="couponNum" class="form-label">쿠폰번호</label> 
	 				<input type="text" name="couponNum" class="form-control" id="couponNum">
					<div id="couponNumError"></div>
					<div>
						<form:errors path="couponNum"></form:errors>
					</div>
				</div>
								
				<div class="row justify-content-end">
					<button type="button" id="cpRegisterBtn" class="col-2 btn btn-outline-success" class="btn btn-primary">등록</button>
				</div>
				

		</div>
	</div>
	<div class="container mt-5">
		<div class="mb-3 container" id="userCouponResult">

		</div>					
	</div>			
		<div>
			<article class="bbsCon">
				<div class="bannerImg" style="text-align: center;">
				    <c:forEach items="${vo.filesVO}" var="i">
				    	<img src="/resources/upload/board/event/${i.fileName}" class="img-thumbnail" alt="...">
				    </c:forEach>
				    <div></div>
				    
				    <c:choose>
				    	<c:when test="${compare != null}">
				    		<input id="eventScheduleCompare" value="${compare}" hidden>
				    	</c:when>
				    	<c:otherwise>
				    		<input id="eventScheduleCompare" value="" hidden>
				    	</c:otherwise>
				    </c:choose>
				    
					<c:if test="${vo.ecVO.couponId != null}">
						<div class="" style="display:inline-block; width: 30%; min-width:300px; height: 180px; border: rgb(224,228,232) solid 2px; line-height: 66px; border-radius :5px; ">
							<div class="d-flex justify-content-around" style="line-height: 60px;">
								<input hidden id="couponId" value="${vo.couponVO.couponId}">
								<strong style="width: 50%; text-align: left; margin: 0 20px; ">${vo.couponVO.couponName}</strong>
								<div>~${vo.ecVO.eventSchedule}</div><!-- 이벤트 스케줄러 -->
							</div>
							<div class="d-flex justify-content-start mb-4" style="">
								<div style="display: block; text-align:left; line-height: 33px;">
									<p style=" margin: -10px 25px;">할인금액 : ${vo.couponVO.discount}원</p>
									<p style=" margin: -10px 25px;">유효기간 : ${vo.couponVO.activeDate}일 (발급날로 부터) </p>
									
								</div>

							</div>
							<div class="d-flex justify-content-end">								
								<button id="couponClick" class="btn btn-light" style="margin: 0 25px; border: 1px solid rgb(221,59,74); color: rgb(221,59,74);">발급받기</button>
							</div>
						</div>
					</c:if>	
				</div>
			</article>
		</div>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/cpRegister.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>