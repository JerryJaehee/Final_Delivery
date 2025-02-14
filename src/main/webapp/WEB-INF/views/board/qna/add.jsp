<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">

</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<div
		class="my-5 container border rounded justify-content-center d-flex">
		<form:form modelAttribute="qnaVO" action="./add" method="post" cssStyle="width:60%" enctype="multipart/form-data">
			<h1 class="my-5">1:1 문의</h1>
			<div class="my-3 row">
				<label class="col-3">고객명</label>
				<form:input path="id" id="id" cssClass="col form-control" />
				<div>
				<form:errors path="id"></form:errors>
				</div>
				<div class="col-5"></div>
			</div>
			<div class="my-3 row">
				<label class="col-3">매장위치</label>
				<form:input path="location" id="location"
					cssClass="col form-control" />
				<form:errors path="location"/>
				<div class="col-5"></div>
			</div>
			<div class="my-3 row d-flex justify-content-between">
				<label class="col-3">문의종류</label>
				<div class="form-check col-2">
					<form:radiobutton path="kind" id="kind1" value="1"
						cssClass="form-check-input" />
					<label id="kind1" class="form-check-label" for="flexRadioDefault1">청결/위생</label>
				</div>
				<div class="form-check col-2">
					<form:radiobutton path="kind" id="kind2" value="2"
						cssClass="form-check-input" />
					<label id="kind2" class="form-check-label" for="flexRadioDefault1">품질</label>
				</div>
				<div class="form-check col-2">
					<form:radiobutton path="kind" id="kind3" value="3"
						cssClass="form-check-input" />
					<label id="kind3" class="form-check-label" for="flexRadioDefault1">서비스</label>
				</div>
				<div class="form-check col-2">
					<form:radiobutton path="kind" id="kind4" value="4"
						cssClass="form-check-input" />
					<label id="kind4" class="form-check-label" for="flexRadioDefault1">기타</label>
				</div>

				<form:errors path="kind"/>
			</div>

			<div class="row my-5">
				<label class="col-3">이메일</label>
				<form:input path="email" id="email" cssClass="col form-control" />
				<form:errors path="email"/>
				<div class="col-5"></div>
			</div>
			<div class="row my-5">
				<label class="col-3">전화번호</label>
				<form:input path="phone" id="phone" cssClass="col form-control" />
				<form:errors path="phone"/>
				<div class="col-5"></div>
			</div>
			<div class="row my-5">
				<label class="col-3">제목</label>
				<form:input path="title" id="title" cssClass="col form-control" />
				<form:errors path="title"/>
			</div>

			<div class="row my-3">
				<label class="col-3">내용</label>
				<form:textarea path="contents" id="contents"
					cssClass="col form-control" />
				<form:errors path="contents"/>
			</div>
			 <div class="justify-content-end my-3 d-block">
						<button id="fileAdd" type="button" class="btn btn-danger d-block">FILE-ADD</button>
					</div>
						<div id="fileResult">
						</div>
			
			<button type="button" class="btn btn-primary my-5" id="add">ADD</button>
		</form:form>
	</div>
			<c:import url="../../temp/footer.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	<script src="../js/file.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript">
		$('#contents').summernote({
			height : 400
		});
		
		$('#add').click(function(){
			
			let formData = new FormData();
			let id = $('#id').val();
			let location = $('#location').val();
			let kind = 0;
			$('.form-check-input').each(function(idx,item){
				if(item.checked){
					kind = $(item).val();
				}
			});
			let email = $('#email').val();
			let phone = $('#phone').val();
			let title = $('#title').val();
			let contents = $('#contents').summernote("code");
			
			formData.append("id",id);
			formData.append("location",location);			
			formData.append("kind",kind);			
			formData.append("email",email);			
			formData.append("phone",phone);			
			formData.append("title",title);			
			formData.append("contents",contents);
			$('.form-control-lg').each(function(idx,item){
				formData.append("files",item.files[0]);
			})
					
			console.log(formData);
			
			$.ajax({
				method:"POST",
				url:"./add",
				processData:false,
				contentType:false,
				data:formData,
				success:function(data){
					if(data.trim()=='1'){
						alert("문의를 접수했습니다.");
						window.location.assign("./addSuccess");
					}
				},
				error:function(){
					alert("다시 시도해주세요.");
				}
			})
			
		});
	</script>

</body>
</html>
