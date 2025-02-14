<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="faqVO" method="post" id="addForm" enctype="multipart/form-data">
				<form:hidden path="num" />
				<div class="row mt-4">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">Title</label> 
						<form:input path="title" cssClass="form-control" id="title"/>
						<div>
							<form:errors path="title"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput2" class="form-label">Writer</label>
						<input name="id" class="form-control" id="id" readonly="readonly" value="${member.id}">
						<div>
<%-- 							<form:errors path="id"></form:errors> --%>
						</div>
					</div>


					<div  id="faqCategoryBtn">
						
						  <input class="form-check-input" type="radio" name="category" id="category1" value="1" hidden>
						  <input class="form-check-input" type="radio" name="category" id="category2" value="2" hidden>
						  <input class="form-check-input" type="radio" name="category" id="category3" value="3" hidden>
						  <input class="form-check-input" type="radio" name="category" id="category4" value="4" hidden>
						  <input class="form-check-input" type="radio" name="category" id="category5" value="5" hidden>
						  <input class="form-check-input" type="radio" name="category" id="category6" value="6" hidden>

					</div>
					<form:hidden id="preCategory" path="category" disabled="disabled"/>
					<div class="mb-3">
						<label for="exampleFormControlInput2" class="form-label" readonly="readonly">Category</label>
						<table class="table" style="">
						  <tbody>
						    <tr style="border: hidden;">
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category1" autocomplete="off">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category1">주문접수</label>		
								</td>
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category2" autocomplete="off">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category2">주문확인</label>		
								</td>
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category3" autocomplete="off">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category3">주문취소/변경</label>		
								</td>
						    </tr>
						    <tr style="border: hidden;">
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category4" autocomplete="off">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category4">서비스 이용</label>		
								</td>
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category5" autocomplete="off">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category5">결제</label>			
								</td>
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category6" value="6">
									<label style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category6">가맹 및 기타</label>			
								</td>				
						    </tr>
						  </tbody>
						</table>
						<input id="faqCategoryBtnResult" readonly="readonly" class="form-control">
					</div>

					

			

			

					

					
					
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>
					</div>
				</div>
	
				<div class="row justify-content-end">
					<c:if test="${member.userType == 0}">
						<button type="button" id="addBtn" class="col-1 btn btn-outline-success" style="margin-right: 10px;">수정</button>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="../resources/js/faqCategory.js"></script>
	<script src="../resources/js/addBoard.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
<script type="text/javascript">

	//summernote
	$('#contents').summernote({
		height : 400
	});
	
</script>
</body>
</html>
