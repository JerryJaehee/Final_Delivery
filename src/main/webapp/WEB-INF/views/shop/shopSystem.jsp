<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<c:import url="../temp/header_script.jsp"></c:import>
<title>매장 관리</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<style type="text/css">
	.flex-nowrap a {
		color:white;
	}
	.title {
		color: gray!important;
		font-weight: bolder;
	}
	
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
		  <c:import url="../temp/shopHeader.jsp"></c:import> 
		  <div class="container" style="width:100%; border:1px solid black;">
		         <div class="col-8 py-3">
		         <div class="row text-center" style="margin-left:340px;">
		         	<h1>해당 점포 정보</h1>
		         </div>
		         <div style="margin-left:180px; width:100%; text-align: center; background-color:#FFFAF0; height:800px; ">
		<div class="row">
			<h3 class="mt-4">맥도날드 [${vo.shopName}]점</h3>
			      <div class="row mt-4 col-5" style=" margin:0 auto;">
					<input type="hidden" id="shopNum" value="${vo.shopNum}" class="form-control" aria-label="Sizing example input">
				<div class="input-group mb-5">
				    <label for="id" class="form-label me-2">점주</label>
				  <input readonly type="text" id="id" value="${vo.id}" class="form-control" aria-label="Sizing example input">
				</div>
				
				<div class="input-group mb-5">
				   <label for="shopName" class="form-label me-2">점포명</label>
				  <input type="text" id="shopName" value="${vo.shopName}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
<%-- 				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default44">매장위치</span>
				  </div>
				  <input type="text" id="location" value="${vo.location}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div> --%>
				<div class="input-group mb-5">
				   <label for="shopPhone" class="form-label me-2">매장번호</label>
				  <input type="text" id="shopPhone" value="${vo.shopPhone}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				

				<%-- <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default77">운영여부</span>
				  </div>
				  	<div class="form-control">
				  		<div style="display: inline-block; width: 20%">
				  		운영</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_open2" value="0" name="shop_open2" aria-label="Radio button for following text input" <c:if test="${vo.open eq 0}">checked</c:if>>
				 		</div>
				 		<div style="display: inline-block; width: 20%">
				 		폐업</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_open2" value="1" name="shop_open2" aria-label="Radio button for following text input" <c:if test="${vo.open eq 1}">checked</c:if>>				  		
				  		</div>
				  	</div>
				</div>				 --%>
				
				<div class="input-group mb-5">
				   <label for="time" class="form-label me-2">매장 운영시간</label>
				 <select class="form-select" aria-label="Default select example" name="openTime" id="openTime">
				 	  <option>오픈시간</option>
				 	  <option value="0">00:00</option>
				 	  <option value="1">01:00</option>
				 	  <option value="2">02:00</option>
				 	  <option value="3">03:00</option>
				 	  <option value="4">04:00</option>
					  <option value="5">05:00</option>
					  <option value="6">06:00</option>
					  <option value="7">07:00</option>
					  <option value="8">08:00</option>
					  <option value="9">09:00</option>
					  <option value="10">10:00</option>
					  <option value="11">11:00</option>
					  <option value="12">12:00</option>
					  <option value="13">13:00</option>
					  <option value="14">14:00</option>
					  <option value="15">15:00</option>
					  <option value="16">16:00</option>
					  <option value="17">17:00</option>
					  <option value="18">18:00</option>
					  <option value="19">19:00</option>
					  <option value="20">20:00</option>
					  <option value="21">21:00</option>
					  <option value="22">22:00</option>
					  <option value="23">23:00</option>
					</select>
					<select class="form-select" aria-label="Default select example" name="closeTime" id="closeTime">
					 <option>마감시간</option>
				 	  <option value="0">00:00</option>
				 	  <option value="1">01:00</option>
				 	  <option value="2">02:00</option>
				 	  <option value="3">03:00</option>
				 	  <option value="4">04:00</option>
					  <option value="5">05:00</option>
					  <option value="6">06:00</option>
					  <option value="7">07:00</option>
					  <option value="8">08:00</option>
					  <option value="9">09:00</option>
					  <option value="10">10:00</option>
					  <option value="11">11:00</option>
					  <option value="12">12:00</option>
					  <option value="13">13:00</option>
					  <option value="14">14:00</option>
					  <option value="15">15:00</option>
					  <option value="16">16:00</option>
					  <option value="17">17:00</option>
					  <option value="18">18:00</option>
					  <option value="19">19:00</option>
					  <option value="20">20:00</option>
					  <option value="21">21:00</option>
					  <option value="22">22:00</option>
					  <option value="23">23:00</option>
					</select>
				</div>
				<div class="input-group mb-5">
				  <label for="distance" class="form-label me-2">배달거리(m)</label>
					<input type="text" id="distance" value="${vo.distance}" placeholder="m단위로 입력" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div id="distanceError"></div>
				
			</div>
				<div>
					<button type="button" id="updateBtn" class="btn btn-primary mt-4">변경하기</button>				
				</div>
				
				
			</div>
			</div>
			</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
		let openTime = ${vo.openTime};
		let closeTime = ${vo.closeTime};

		
		$("#openTime").val(openTime).attr("selected","selected");
		$("#closeTime").val(closeTime).attr("selected","selected");
		
		$("#updateBtn").click(function() {
			let distance = $("#distance").val();
			if(distance==""){
				alert("배달거리를 입력하세요.");
				return;
			}else if(isNaN(distance)){
				alert("배달거리는 숫자만 입력가능합니다.");
				return;
			}
			let formData = new FormData();
			let shopNum = $("#shopNum").val();
			let id = $("#id").val();
			let shopName = $("#shopName").val();
			let shopPhone = $("#shopPhone").val();

			openTime = $('select[name=openTime] option:selected').val();
			closeTime = $('select[name=closeTime] option:selected').val();
			formData.append("distance",distance);
			formData.append("shopNum",shopNum);
			formData.append("id",id);
			formData.append("shopName", shopName);
			formData.append("shopPhone", shopPhone);
			formData.append("openTime", openTime);
			formData.append("closeTime", closeTime);
			
			$.ajax({
				type:"post",
				url:"./setUpdateShopSystem",
				processData: false,
				contentType: false,
				data:formData,
				success:function(data) {
					if(data.trim() == '1') {
						Swal.fire({
		                    icon: 'success',
		                    text: '변경되었습니다.',
		                });
					}else {
						alert("변경 실패..");
					}
				},
				error:function() {
					alert("에러 발생!");
				}
			})
		})
	</script>
</body>
</html>