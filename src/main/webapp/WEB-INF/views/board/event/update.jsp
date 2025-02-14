<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">
<title>이벤트 수정하기</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="../css/tableRadius.css" />
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="eventVO" method="post" id="addForm" enctype="multipart/form-data">
				<form:hidden path="eventNum" />
				<div class="row mt-4">
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> 
						<form:input path="title" cssClass="form-control" id="title"/>
						<div>
							<form:errors path="title"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="id" class="form-label">Writer</label> 
						<input name="id" class="form-control" id="id" readonly="readonly" value="${member.id}">
						<div>
							<%-- <form:errors path="id"></form:errors> --%>
						</div>
					</div>
					<div class="mb-3">
						<label for="contents" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>

					</div>
					<div class="mb-3">
						
						<label for="couponName" class="form-label">쿠폰</label>
						<!-- Button trigger modal -->
						<span id="modalStartBtn">
							<button style="margin: 0 auto; font-weight: 500;" type="button" id="modalBtn" class="modalBtn btn btn-primary" data-toggle="modal" data-target="#modal">
							  선택
							</button>
						</span>	
						<button style="margin: 0 auto; font-weight: 500;" type="button" id="resetBtn" class="btn btn-danger">
						  초기화
						</button>
						<div style="height: 5px;"></div>
						<input id="couponName" class="form-control" readonly="readonly" type="text" value="${eventVO.couponVO.couponName}"> 
					</div>
					<input id="couponId" name="couponId" class="form-control" hidden type="text" value="${eventVO.ecVO.couponId}"> 
					
					<div id="es">
						<c:if test="${eventVO.ecVO.eventSchedule != null}">
							<input id="eventSchedule" name="eventSchedule" class="form-control" hidden type="text" value="${eventVO.ecVO.eventSchedule}">
						</c:if>
					</div>
					<c:forEach items="${thumbFilesVO}" var="i">
						<input class="thumbCount" hidden>
					</c:forEach>
 					<c:forEach items="${eventVO.filesVO}" var="i">
						<input class="fileCount" hidden>
					</c:forEach>
					<div class="mb-3">
						<!-- 썸네일 -->
						<c:forEach items="${thumbFilesVO}" var="i">
							<h4>${i.oriName}<button class="del btn btn-danger thumbDel" type="button" id="fileDel${i.fileNum}" data-num="${i.fileNum}" data-name="${i.fileName}" >삭제</button></h4>
		 				</c:forEach>
						<div id="thumbFileResult"></div>
						<div style="margin-bottom: 10px;">
							<button id="thumbFileAdd" type="button" class="col-2 btn btn-outline-success">썸네일 추가</button>
						</div>	
					</div>
					<div class="mb-3">
						<!-- 내용이미지 -->
						<c:forEach items="${eventVO.filesVO}" var="i">
							<h4>${i.oriName}<button class="del btn btn-danger" type="button" id="fileDel${i.fileNum}" data-num="${i.fileNum}" data-name="${i.fileName}" >삭제</button></h4>
		 				</c:forEach>
						<div id="fileResult"></div>
						<div>
							<button id="fileAdd" type="button" class="col-2 btn btn-outline-success">내용이미지 추가</button>
						</div>
					</div>
				</div>
		<div class="row justify-content-end">
			<button type="button" id="addBtn" class="col-1 btn btn-outline-success" style="margin-right: 10px;">수정</button>
		</div>
		</form:form>
		</div>
	</div>
	
<div id="modalWrap">
	<!-- Modal -->
	<div class="modal  fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">쿠폰 선택</h5>
	        <button type="button" id="modalHideX" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<div class="container" style="">
					<div class="d-flex mb-3">
						<input hidden name="category" type="text" id="categoryResult" value="1">
						<span class="col-4  mt-2">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> ${count}개의</span> 쿠폰</legend>
						</span>
						<span class="col-6 mt-2"  style="margin-right:10px;">
							<input id="event_coupon_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-2 mt-2">
							<button class="btn btn-outline-success rounded-pill" id="event_coupon_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					<div id="couponListSelect"></div>
<!-- 					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default4">매장전화번호</span>
					  </div>
					  <input type="text" id="shop_phone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div> -->
					
				</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" id="modalSave" class="btn btn-primary">다음</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal2 -->
	<div class="modal  fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">이벤트 기간</h5>
	        <button type="button" id="modalHideX2" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<div class="container" style="">	      		
		      		<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default3">발급기간</span>
					  </div>
					  <input type="text" id="datepicker" placeholder="미선택시 무기한" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>			
				</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="modalHide2" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" id="modalSave2" class="btn btn-primary">선택</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>	
	
	<script type="text/javascript" src="../js/file.js"></script>
	<c:import url="../../temp/footer.jsp"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
	<script src="../resources/js/eventUpdate.js"></script>
	<script src="../../resources/js/addBoard.js"></script>
<script>
var picker = new Pikaday({
    field: document.getElementById('datepicker'),
    format: 'YYYY-MM-DD',
    toString(date, format) {
        // you should do formatting based on the passed format,
        // but we will just return 'D/M/YYYY' for simplicity
        const day = CF_leftPad(date.getDate());
        const month = CF_leftPad(date.getMonth() + 1);
        const year = date.getFullYear();
        return year+"-"+month+"-"+day;
    },
/*     parse(dateString, format) {
        // dateString is the result of `toString` method
        const parts = dateString.split('/');
        const day = parseInt(parts[0], 10);
        const month = parseInt(parts[1], 10) - 1;
        const year = parseInt(parts[2], 10);
        return new Date(year, month, day);


    } */
    
});
function CF_leftPad(value){
	if (Number(value) >= 10) {
		return value;
	}
	return "0" + value;
}
</script>	
<script type="text/javascript">

	//summernote
	$('#contents').summernote({
		height : 400
	});

</script>
</body>
</html>
