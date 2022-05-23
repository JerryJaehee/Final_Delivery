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
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="eventVO" method="post" enctype="multipart/form-data">
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
						<form:input path="id" cssClass="form-control" id="id" readonly="true" value="${member.id}"/> 
						<div>
							<form:errors path="id"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="contents" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>
					</div>
				</div>
				<div class="mb-3">
						<label for="couponName" class="form-label">쿠폰</label>
						<!-- Button trigger modal -->
						<span id="modalStartBtn">
							<button style="margin: 0 auto; font-weight: 500;" type="button" id="modalBtn" class="modalBtn btn btn-primary" data-toggle="modal" data-target="#modal">
							  ADD
							</button>
						</span>	
						<input id="couponName" class="form-control" readonly="readonly" type="text" value=""> 
				</div>
				<input id="couponId" name="couponId" class="form-control" hidden type="text" value=""> 

				<div id="fileResult"></div>
				<div>
					<button id="fileAdd" type="button" class="col-1 btn btn-outline-success">FileAdd</button>
				</div>
				<div class="row justify-content-end">
					<button type="submit" class="col-1 btn btn-outline-success">Add</button>
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
	        <h5 class="modal-title" id="exampleModalLabel">추가하기</h5>
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
	        <button type="button" id="modalSave" class="btn btn-primary">Add</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>	
	
	
	<script type="text/javascript" src="../js/file.js"></script>
	<script src="../resources/js/eventAdd.js"></script>
	<c:import url="../../temp/footer.jsp"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
<script type="text/javascript">

	//summernote
	$('#contents').summernote({
		height : 400
	});
	
</script>
</body>
</html>
