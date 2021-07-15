<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>기안</h2>
<form name="frm" enctype="multipart/form-data">
	<table>
		<tr>
			<td width=100 class="title">기안번호</td>
			<td width=200 colspan="3"><input type="text" name="acode" size=20 value="${vo.acode}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">사번</td>
			<td width=200><input type="text" name="aecode" size=20 value="${vo.aecode}"/></td>
			<td width=100 class="title">작성자</td>
			<td width=200><input type="text" name="ename" size=20 value="${vo.ename}"/></td>
		</tr>	
		<tr>
			<td width=100 class="title">부서</td>
			<td width=200><input type="text" name="edep" size=20 value="${vo.edep}"/></td>
			<td width=100 class="title">직위</td>
			<td width=200><input type="text" name="ejobtitle" size=20 value="${vo.ejobtitle}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">상태</td>
			<td width=200 colspan="3">
				<select name="astate">
					<option value="0" >처리중</option>
					<option value="1" >처리완료</option>
					<option value="2" >반려</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width=100 class="title">제목</td>
			<td width=200 colspan="3"><input type="text" name="atitle" size=60 value="${vo.atitle}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">내용</td>
			<td width=200 colspan="3"><textarea cols="90" rows="30" name="acontent">${vo.acontent}</textarea></td>
		</tr>
		<tr>
			<td width=100 class="title">첨부파일</td>
			<td width=200 colspan="3"><input type="file" name="afile" size=20 value="${vo.afile}"/></td>
		</tr>		
	</table>
	<div style="width:900px;margin-top:10px;text-align:center">
		<input type="submit" value="기안수정"/>
		<input type="button" value="삭제하기" id="btnDelete"/>
		<input type="reset" value="수정취소"/>
	</div>
</form>
<script>
	var acode="${vo.acode}";
	
	//삭제하기
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하실래요?")) return;
		frm.method="get";
		location.href="/apr/delete?acode=" + acode;
		alert("삭제완료");
	});
	
	//상품수정하기
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!(confirm("정보를 수정하실래요?"))) return;
		frm.action="/apr/update";
		frm.method="post",
		frm.submit();
	});
</script>
