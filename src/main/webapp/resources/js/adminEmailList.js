console.log("hi");
const admin_email_search_btn = document.querySelector("#admin_email_search_btn");
const admin_email_search = document.querySelector("#admin_email_search");



getList();

function getList(){
	console.log("start");
	$.ajax({
		type:"POST",
		url:"./email",
 		data:{
			kind : $("#admin_email_kind option:selected").val(),
            search : admin_email_search.value
		}, 
		success:function(data){
			$("#adminEmailListReusult").html(data.trim());
            category_count.innerText = document.querySelector("#admin_email_count").getAttribute("value");
		}
	});
    
}


$('#adminEmailListReusult').click(function(event){

	// if(event.target.classList.contains('modalBtn')){		
		
	// 	//$('#modal_emailID').text(event.target.getAttribute("id").substr(8));
	// 	//$('#modal_emailNAME').text(event.target.getAttribute("data-name"));
	// 	//let cate = event.target.getAttribute("data-type");
	// 	//console.log(cate);
		
	// 	//$("#inputGroupSelect01").val(cate).prop("selected", true);
		
	// 	$('#modal').modal("show");
	// }

    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./email");
    
        //요청 header 정보
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
        //요청 전송
        //post 요청시 파라미터
        //send("이름=값&이름2=값2...")
        xhttp.send("search="+event.target.getAttribute("data-search")+"&pn="+event.target.getAttribute("data-page")+"&kind="+event.target.getAttribute("data-kind"));
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
     //           console.log(this.responseText);
                $("#adminEmailListReusult").html(this.responseText.trim());
                category_count.innerText = document.querySelector("#admin_email_count").getAttribute("value");
            }
        }

    }

}); 
function getCouponEmail(){
	$.ajax({
		type:"GET",
		url:"./couponEmail",
		success:function(data){
			return data.trim();
		}
	});
}
function getCouponEmail1(couponEmail){
	
}
$('#modalBtn').click(function(e){

let couponMail1 = '<div><table width="600" cellpadding="0" cellspacing="0" border="0" style=" margin: 0 auto; background-color: #f3f3f3;"><tbody><tr><td align="left" colspan="3" height="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="1" height="1" style="display: block; border:none;" loading="lazy"></td></tr><tr><td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td><td align="left" width="572"><table width="572" cellpadding="0" cellspacing="0" border="0"> <tbody><tr><td align="left" height="75" style="background:#3d3d3d;"><img src="https://www.mcdelivery.co.kr/edm/82/logo_ko.png" height="75" style="display: block; border:none;" alt="McDelivery™" loading="lazy"></td><td height="75" width="572" style="background:#3d3d3d; color:#ffffff; font-family: Helvetica, Arial, sans-serif; font-size: 22px; font-weight: bold; padding:0 20px;">맥딜리버리 특별 혜택 안내</td></tr><tr><td align="left" colspan="2"><table width="572" cellpadding="0" cellspacing="0" border="0"> <tbody> <tr> <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td><td align="left" width="522"><table width="522" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td align="left" height="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="40" style="display: block; border:none;" loading="lazy"></td></tr>';
let couponMail2 = '<tr><td style="color: #000001; font-size: 20px; font-family: Helvetica, Arial, sans-serif;">안녕하세요<br>OOO 고객님!</td></tr> <tr><td align="left" height="15"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td></tr><tr><td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">맥딜리버리 사이트에 이용해 주셔서 감사합니다. 기존 가입자 분들께 혜택을 제공해드리고자 합니다.<br><br>쿠폰코드 : OOOOOOOO<br><br></td></tr><tr><td align="left" height="30"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="30" style="display: block; border:none;" loading="lazy"></td></tr><tr><td height="25"><a style="font-size: 14px; font-family: Helvetica, Arial, sans-serif;" href="http://localhost/member/cpRegister" target="_blank" rel="noreferrer noopener"><img src="https://ifh.cc/g/tpoYol.png" style="display: block; border:none; border-radius: 5px;" alt="쿠폰 등록 바로가기" loading="lazy"></a></td></tr><tr><td align="left" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td></tr><tr><td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">감사합니다,<br>맥딜리버리 팀.</td></tr><tr><td align="left" height="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="25" style="display: block; border:none;" loading="lazy"></td></tr>';
let couponMail3 = '<tr style="vertical-align: top;"><td style="padding: 25px 0 0 0; border-top: 1px dashed #a2a1a1;"><img src="https://www.mcdelivery.co.kr/edm/82/banner_ko.png" width="522" height="159" style="display: block; border:none;" alt="McDelivery Promotions" loading="lazy"></td></tr><tr><td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td></tr><tr><td style="font-family: Helvetica, Arial, sans-serif; font-size: 10px; color: #000001; font-family: Helvetica, Arial, sans-serif;">본 메일은 발신 전용 메일이므로 회신이 불가능합니다.</td></tr><tr><td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td></tr></tbody></table></td><td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td></tr></tbody></table></td></tr></tbody></table></td><td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td></tr><tr><td colspan="3" style="background-color: #3d3d3d;"><table cellpadding="0" cellspacing="0" border="0" width="600"><tbody><tr><td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td></tr><tr><td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy">';
let couponMail4 = '</td><td width="358" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;"><a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-tnc.html" target="_blank" rel="noreferrer noopener">이용약관</a>| <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-privacy.html?locale=ko" target="_blank" rel="noreferrer noopener">개인정보 처리방침</a>| <a style="color: #ffffff; text-decoration: none;" href="http://localhost/faq/list" target="_blank" rel="noreferrer noopener">자주 묻는 질문</a>| <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/kor/news/detail.do?page=1&amp;seq=517&amp;rnum=1&amp;temp_seq=&amp;searchWord=" target="_blank" rel="noreferrer noopener">과일 칠러 판매 제외 매장</a><a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/uploadFolder/page/p_menu.jsp" target="_blank" rel="noreferrer noopener">영양정보/원산지 정보/기타 정보</a></td><td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td><td width="122" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">팔로우: <table cellpadding="0" cellspacing="0" border="0" width="122"><tbody><tr><td><a style="text-decoration: none;" href="https://www.facebook.com/McDonaldsKorea" target="_blank" rel="noreferrer noopener">';
let couponMail5 = '<img src="https://www.mcdelivery.co.kr/edm/82/icon-fb.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td><td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td><td><a style="text-decoration: none;" href="https://instagram.com/McDonalds_kr" target="_blank" rel="noreferrer noopener"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e7/Instagram_logo_2016.svg" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td><td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td><td><a style="text-decoration: none;" href="https://www.youtube.com/user/McDonaldsKor" target="_blank" rel="noreferrer noopener"> <img src="https://www.mcdelivery.co.kr/edm/82/icon-yt.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td><td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td><td><img width="23" height="24" style="display: block; border:none;" src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" loading="lazy"></td></tr></tbody></table></td><td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td></tr><tr><td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy">';
let couponMail6 = '</td></tr></tbody> </table></td></tr><tr><td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td></tr><tr><td colspan="3" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; color: #000001; text-align: center; background:#ffffff; text-transform:uppercase;">Copyright © 2014 All Rights Reserved By McDonalds™<br>The Golden Arches Logo and "im lovin it" are trademarks of <br>McDonalds Corporation and its affiliates.</td></tr><tr><td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td></tr></tbody></table></div>';
//	$("#contents").val(couponMail1+couponMail2+couponMail3+couponMail4+couponMail5+couponMail6);
document.getElementsByClassName("note-editable")[0].innerHTML = couponMail1+couponMail2+couponMail3+couponMail4+couponMail5+couponMail6;
//	console.log($("#contents").val());
	$('#modal').modal("show");

}); 


$('#modalHide').click(function(e){
	$('#modal').modal("hide");
}); 
$('#modalHideX').click(function(e){
	$('#modal').modal("hide");
}); 


$('#modalSave').click(function(e){
/* 	console.log($("#modal_emailID").text()); */


$("#receivers").val();
$("#title").val();
$("#contents").val();

let receiversCheck = false;
let titleCheck = false;
let contentsCheck = false;
if ($("#receivers").val() == "") { receiversCheck = true; }
if ($("#title").val() == "") { titleCheck = true; }
if ($("#contents").val() == "") { contentsCheck = true; }

if (receiversCheck||titleCheck||contentsCheck) {
	alert("정보를 입력하세요")
	return;
}


 		$.ajax({
			type:"POST",
			url:"./send",
/* 		    processData: false,
		    contentType: false, */
			data:{
				receiver_type: $(":input:radio[name=receiver_type]:checked").val(),
				receivers: $("#receivers").val(),
				title: $("#title").val(),
				contents: $("#contents").val()
			},
			success:function(data){
				if(data.trim()=='1'){
					alert("메일 발송 완료");
					getList();
				}else {
					alert("메일 방송 실패");
				}				
			},
			error:function(){
				alert("error 발생");
			}
		});

 	$('#modal').modal("hide"); 
});

//search submit 버튼 클릭시
admin_email_search_btn.addEventListener("click", function(event){
    getList();
});


let obj_count =0;
function getAddr_obj2(event){
	console.log(event.target.parentElement.parentElement.parentElement);
	console.log("0000");
	let obj1 = '';
	let obj2 = '';
	let obj3 = $("#edit").val().trim();
	console.log(obj3);
	const result = getSearchEmailMemberList(obj3);
	console.log(result);

	if(result=='1'){
		alert("성공");
		obj1 = '<li id="to$'+obj_count+'" class="addressObj draggable"><div class="_addressObjView"><div class="addr_obj blue" style="border: 3px solid #cbe6ff;  background-color: #e5f3ff; display: inline-block;"><span id="editSpan'+obj_count+'" class="blue_email" title="">';
		obj2 ='</span><button style="border: 0; padding:0; background-color:#e5f3ff; "><span id="edit'+obj_count+'" class="material-symbols-outlined edit" style="font-size: 18px; color: rgb(147,181,213);">edit</span></button><button style="border: 0; padding:0; background-color:#e5f3ff; "><span id="close'+obj_count+'"  class="material-symbols-outlined close" style="font-size: 18px; color: rgb(147,181,213);">close</span></button></div></li>';
		receivers.setAttribute("value", receivers.getAttribute("value")+obj3+",");
	}else {
		alert("실패");
		obj1 = '<li id="to$'+obj_count+'" class="addressObj draggable invalid"><div class="_addressObjView"><div class="addr_obj red" style="border: 3px solid #f8d5ce;  background-color: #fde3de; color: #d77965; display: inline-block;"><span id="editSpan'+obj_count+'" class="red_email" title="메일주소 형식이 올바르지 않습니다.">';
		obj2 ='</span><button style="border: 0; padding:0; background-color:#fde3de; "><span id="edit'+obj_count+'" class="material-symbols-outlined edit" style="font-size: 18px; color: #d77965;">edit</span></button><button style="border: 0; padding:0; background-color:#fde3de; "><span id="close'+obj_count+'"  class="material-symbols-outlined close" style="font-size: 18px; color: #d77965;">close</span></button></div></div></li>';
	}
	obj_count++;
	console.log("3333");
	$("#edit").parent().parent().parent().after(obj1+obj3+obj2);
	$("#edit").parent().parent().parent().remove();
	const $input = document.createElement("input");
	$input.hidden =true;
	$input.id = 'edit';
	$("#toUL").prepend($input);
//	event.target.parentElement.parentElement.parentElement.remove();
//	$("#toUL").append(obj1+obj3+obj2);
//	$("#toInput").val("");	
//	$("#toInput").parent().parent().parent().appendTo("#toUL");
	$("#toInput").focus();
}
const receivers = document.querySelector("#receivers");
function getAddr_obj(){
	console.log("0000");
	let obj1 = '';
	let obj2 = '';
	let obj3 = $("#toInput").val().trim();
	const result = getSearchEmailMemberList(obj3);
	console.log(result);

	if(result=='1'){
		alert("성공");
		obj1 = '<li id="to$'+obj_count+'" class="addressObj draggable"><div class="_addressObjView"><div class="addr_obj blue" style="border: 3px solid #cbe6ff;  background-color: #e5f3ff; display: inline-block;"><span id="editSpan'+obj_count+'" class="blue_email" title="">';
		obj2 ='</span><button style="border: 0; padding:0; background-color:#e5f3ff; "><span id="edit'+obj_count+'" class="material-symbols-outlined edit" style="font-size: 18px; color: rgb(147,181,213);">edit</span></button><button style="border: 0; padding:0; background-color:#e5f3ff; "><span id="close'+obj_count+'"  class="material-symbols-outlined close" style="font-size: 18px; color: rgb(147,181,213);">close</span></button></div></li>';
		receivers.setAttribute("value", receivers.getAttribute("value")+obj3+",");
	}else {
		alert("실패");
		obj1 = '<li id="to$'+obj_count+'" class="addressObj draggable invalid"><div class="_addressObjView"><div class="addr_obj red" style="border: 3px solid #f8d5ce;  background-color: #fde3de; color: #d77965; display: inline-block;"><span id="editSpan'+obj_count+'" class="red_email" title="메일주소 형식이 올바르지 않습니다.">';
		obj2 ='</span><button style="border: 0; padding:0; background-color:#fde3de; "><span id="edit'+obj_count+'" class="material-symbols-outlined edit" style="font-size: 18px; color: #d77965;">edit</span></button><button style="border: 0; padding:0; background-color:#fde3de; "><span id="close'+obj_count+'"  class="material-symbols-outlined close" style="font-size: 18px; color: #d77965;">close</span></button></div></div></li>';
	}
	
	obj_count++;
	console.log("3333");
	
	$("#toUL").append(obj1+obj3+obj2);
	$("#toInput").val("");	
	$("#toInput").parent().parent().parent().appendTo("#toUL");
	$("#toInput").focus();
}



function getSearchEmailMemberList(search){

		console.log(search);
		console.log(0000);
		let result;
		$.ajax({
			type:"POST",
			url:"./emailMCheck",
			data:{
				search : search
			},
			async: false,
			success:function(data){
				console.log(1111);
				console.log(data.trim());				
				result = data.trim();					
			},
			error:function(){
				console.log(2222);
				alert("error 발생");
				return;
			}
		});

		return result;
}
//////////////////////////////////////////////////////////////////////

const keyword = document.querySelector("#keyword");
const keywords = document.querySelector("#keywords");
const toInput = document.querySelector("#toInput");
const edit = document.querySelector("#edit");
function closeKeywords() {
	keywords.style.display = "none";
	keywords.innerHTML = "";


};
edit.addEventListener("keyup", function(e) {	
	getData(e);
});

toInput.addEventListener("keyup", function(e) {	
	getData(e);
});

function getData(e){
	if($("#toInput").val()==""){return;}
	$.ajax({
		type:"POST",
		url:"./emailM",
		data:{
			search : $("#toInput").val().trim()
		},
		success:function(data){
			console.log(data);	
			getMoon(e,data);
			return data;
		},
		error:function(){
			alert("error 발생");
			return;
		}
	});
};

function getData2(e){
	if($("#edit").val()==""){return;}
	$.ajax({
		type:"POST",
		url:"./emailM",
		data:{
			search : $("#edit").val().trim()
		},
		success:function(data){
			console.log(data);	
			getMoon_edit(e,data);
			return data;
		},
		error:function(){
			alert("error 발생");
			return;
		}
	});
};

function getMoon(e,list){
	console.log("원하는 것 : "+keywords.querySelector("li.selected"));
	const selectedKeyword = keywords.querySelector("li.selected");

	// li.selected 가 없는 경우에만 api에서 데이터를 가져옴
	if (toInput.value.length > 1 && !selectedKeyword && !(e.key === "ArrowUp" || e.key === "ArrowDown")) {
		console.log("=== API 호출 ===");

		keywords.innerHTML = "";

		const $div1 = document.createElement("div");
		$div1.setAttribute("class", "dh_layer");
		const $div2 = document.createElement("div");
		$div2.setAttribute("id", "atcp");
		$div2.setAttribute("class", "type_a autoBook atcp");
		const $ul = document.createElement("ul");
		$ul.setAttribute("class", "autoAddr");
		$ul.setAttribute("style", "height: 234px; padding: 0;")
		console.log("hi");
		$.each(list,function(idx, item){
			console.log(item);
			const $li = document.createElement("li");
			const $span = document.createElement("span");
			$span.textContent = `${item.name} ${item.email}`;
			$li.append($span);
			$ul.append($li);
		});
		console.log("bye");

		$div2.append($ul);
		$div1.append($div2);
		keywords.append($div1);
		keywords.style.display = "block";
		
	}
	if (toInput.value.length === 0) {
		keywords.innerHTML = "";
	}

	// 요구사항 1 - esc를 누르면 추천 검색어 창이 닫여야 합니다.
	if (e.key === "Escape") {
		closeKeywords();
	}

	// console.log(e.key)

	// 요구사항 2 - 키보드의 위, 아래 키를 누르면 추천 검색어 하이라이트가 옮겨지고 엔터를 누르면 하이라이트가 위치한 검색어가 입력창에 반영되어야 합니다.

	const keywordsList = keywords.querySelectorAll("li");

	if ((e.key === "ArrowUp" || e.key === "ArrowDown") && keywords.style.display === "block") {
		let target;
		const initIndex = e.key === "ArrowUp" ? keywordsList.length - 1 : 0;
		const adjacentSibling = selectedKeyword && (e.key === "ArrowUp" ? selectedKeyword.previousElementSibling : selectedKeyword.nextElementSibling);
		if (adjacentSibling) {
			target = adjacentSibling;
		} else {
			target = keywordsList.item(initIndex);
		}
		selectedKeyword && selectedKeyword.classList.remove("selected");
		target.classList.add("selected");
		toInput.value = target.textContent.split(" ")[1];
	}
};

function getMoon_edit(e,list){
	console.log("원하는 것 : "+keywords.querySelector("li.selected"));
	const selectedKeyword = keywords.querySelector("li.selected");

	// li.selected 가 없는 경우에만 api에서 데이터를 가져옴
	if (edit.value.length > 1 && !selectedKeyword && !(e.key === "ArrowUp" || e.key === "ArrowDown")) {
		console.log("=== API 호출 ===");

		keywords.innerHTML = "";

		const $div1 = document.createElement("div");
		$div1.setAttribute("class", "dh_layer");
		const $div2 = document.createElement("div");
		$div2.setAttribute("id", "atcp");
		$div2.setAttribute("class", "type_a autoBook atcp");
		const $ul = document.createElement("ul");
		$ul.setAttribute("class", "autoAddr");
		$ul.setAttribute("style", "height: 234px; padding: 0;")
		console.log("hi");
		$.each(list,function(idx, item){
			console.log(item);
			const $li = document.createElement("li");
			const $span = document.createElement("span");
			$span.textContent = `${item.name} ${item.email}`;
			$li.append($span);
			$ul.append($li);
		});
		console.log("bye");

		$div2.append($ul);
		$div1.append($div2);
		keywords.append($div1);
		keywords.style.display = "block";
		
	}
	if (edit.value.length === 0) {
		keywords.innerHTML = "";
	}

	// 요구사항 1 - esc를 누르면 추천 검색어 창이 닫여야 합니다.
	if (e.key === "Escape") {
		closeKeywords();
	}

	// console.log(e.key)

	// 요구사항 2 - 키보드의 위, 아래 키를 누르면 추천 검색어 하이라이트가 옮겨지고 엔터를 누르면 하이라이트가 위치한 검색어가 입력창에 반영되어야 합니다.

	const keywordsList = keywords.querySelectorAll("li");

	if ((e.key === "ArrowUp" || e.key === "ArrowDown") && keywords.style.display === "block") {
		let target;
		const initIndex = e.key === "ArrowUp" ? keywordsList.length - 1 : 0;
		const adjacentSibling = selectedKeyword && (e.key === "ArrowUp" ? selectedKeyword.previousElementSibling : selectedKeyword.nextElementSibling);
		if (adjacentSibling) {
			target = adjacentSibling;
		} else {
			target = keywordsList.item(initIndex);
		}
		selectedKeyword && selectedKeyword.classList.remove("selected");
		target.classList.add("selected");
		edit.value = target.textContent.split(" ")[1];
	}
};
 
document.addEventListener("click", (e) => {
	console.log(e.target);
	// 요구사항 3 - 마우스로 다른 곳을 클릭하여 input이 focus를 잃어버리는 경우 추천 검색어 창이 닫여야 합니다.
	const closestKeywords = e.target.closest(".keywords"); // 부모 요소 중에 keywords 클래스를 가진 부모가 있는지 확인
	if (!closestKeywords && keywords.style.display === "block") {
		closeKeywords();
//		getAddr_obj();
	}
});
  
keywords.addEventListener("click", (e) => {
	// 요구사항 4 - 마우스로 추천 검색어를 누르면 커서가 위치한 검색어가 입력창에 반영되어야 합니다.
	toInput.value = e.target.textContent.split(" ")[1];
	closeKeywords();
	getAddr_obj();
});

$("#toDiv").click(function(event) {
	console.log($(this).closest('div').attr('id'));
	console.log(event.target);

	if(event.target.classList.contains('edit')){
		$("#edit").remove();
		 console.log(event.target.parentElement.parentElement);
		// console.log(event.target.getAttribute("id"));
		// console.log("to$"+event.target.getAttribute("id").substr(4));		
		// const to$ = document.getElementById("to$"+event.target.getAttribute("id").substr(4));
		// console.log(event.target.parentElement.previousElementSibling.innerText);
		const em = event.target.parentElement.previousElementSibling.innerText;
//		receivers.setAttribute("value", receivers.getAttribute("value")+obj3+",");
		let arr = receivers.getAttribute("value").split(",");
		let receivers2 ='';
		let deleteOne = 1;//
		for(let i=0;i<arr.length-1;i++){			
			if(arr[i]==(em)&&deleteOne==1){
				deleteOne--;
			}else{
				receivers2 = receivers2 +arr[i]+',';
			}
		}
		receivers.setAttribute("value", receivers2);
		const $textarea = document.createElement("textarea");
		$textarea.id = 'edit';
		$textarea.autocomplete='off';
		$textarea.setAttribute("onKeypress","javascript:if(event.keyCode==13) {getAddr_obj2(event);closeKeywords();}");
		$textarea.setAttribute("onclick","event.stopPropagation();");
		if(event.target.parentElement.parentElement.classList.contains("blue")){
			$textarea.style='width:180px; border: 0px; overflow: hidden; resize: none; display: inline;background-color: #e5f3ff;';
		}else{
			$textarea.style='width:180px; border: 0px; overflow: hidden; resize: none; display: inline;background-color: #fde3de;';
		}		
		$textarea.innerText=em;
		$textarea.rows='1';
		$textarea.tabIndex='1';
		event.target.parentElement.parentElement.prepend($textarea);
		event.target.parentElement.previousElementSibling.remove();
		$("#edit").focus();
//		<textarea id="edit" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getAddr_obj();closeKeywords();}" onclick="event.stopPropagation();" style="width: 74px; border: 0px; overflow: hidden; resize: none; display: inline;background-color: #e5f3ff;" rows="1" tabindex="1" sn="" officer="" grouptype=""></textarea>
		
		// event.target.parentElement.parentElement.innerHTML = '<div class="addr_input"><label for="edit" class="blind"></label><textarea id="edit" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getAddr_obj();closeKeywords();}" onclick="event.stopPropagation();" style="width: 74px; border: 0px; overflow: hidden; resize: none; display: inline;background-color: #e5f3ff;" rows="1" tabindex="1" sn="" officer="" grouptype=""></textarea></div>'
		// console.log(event.target.parentElement.parentElement);


//		const $div = document.createElement("div");
		// $div.innerText="hihi"
		// let asd = "#to$"+event.target.getAttribute("id").substr(4);
		// console.log(asd);
		// to$.after($div);
		
		// console.log(to$);
		// console.log(to$.parentElement);
//		to$.remove();
	}

	if(event.target.classList.contains('close')){
		// console.log(event.target.getAttribute("id"));
		// console.log("to$"+event.target.getAttribute("id").substr(5));
		// console.log(receivers.getAttribute("value"));
		let arr = receivers.getAttribute("value").split(",");
		let receivers2 ='';
		let deleteOne = 1;//
		console.log(event.target.parentElement.parentElement.childNodes[0]);
		for(let i=0;i<arr.length-1;i++){			
			if(arr[i]==(event.target.parentElement.parentElement.childNodes[0].innerText)&&deleteOne==1){
				deleteOne--;
			}else{
				receivers2 = receivers2 +arr[i]+',';
			}
		}
		receivers.setAttribute("value", receivers2);
		document.getElementById("to$"+event.target.getAttribute("id").substr(5)).remove();
	}

});

// keyword.addEventListener("click", function(event){
// 	event.target.child.previousElementSibling.childElement.
// });