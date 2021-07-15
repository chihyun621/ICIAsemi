<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>직원정보🔎</h2>
<form name="frm" method="post" action="update">
	<table>
		<tr>
			<td width=100 class="title">사번</td>
			<td width=200><input type="text" name="ecode" size=20 value="${vo.ecode}"/></td>
			<td width=100 class="title">이름</td>
			<td width=200><input type="text" name="ename" size=20 value="${vo.ename}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">아이디</td>
			<td width=200><input type="text" name="eid" size=20 value="${vo.eid}"/></td>
			<td width=100 class="title">비밀번호</td>
			<td width=200><input type="text" name="epass" size=20 value="${vo.epass}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">부서</td>
			<td width=200><input type="text" name="edep" size=20 value="${vo.edep}"/></td>
			<td width=100 class="title">직위</td>
			<td width=200><input type="text" name="ejobtitle" size=20 value="${vo.ejobtitle}"/></td>
		</tr>		
		<tr>
			<td width=100 class="title">전화번호</td>
			<td width=200><input type="text" name="etel" size=20 value="${vo.etel}"/></td>
			<td width=100 class="title">이메일</td>
			<td width=200><input type="text" name="eemail" size=20 value="${vo.eemail}"/></td>
		</tr>			
	</table>
	<div style="width:900px;margin-top:10px;text-align:center">
		<input type="submit" value="정보수정"/>
		<input type="button" value="삭제하기" id="btnDelete"/>
		<input type="reset" value="수정취소"/>
	</div>
<script>
	var ecode="${vo.ecode}";
	//삭제하기
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하실래요?")) return;
		frm.method="get";
		location.href="/emp/delete?ecode=" + ecode;
		alert("삭제완료");
	});
	
	//상품수정하기
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!(confirm("정보를 수정하실래요?"))) return;
		frm.submit();
	});
</script>
<script>
	var url="/apr/list.json";
</script>
<script src="/script.js"></script>
