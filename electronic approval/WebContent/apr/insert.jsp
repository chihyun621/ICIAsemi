<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>기안</h2>
<form name="frm"  enctype="multipart/form-data">
	<table>
		<tr>
			<td width=100 class="title">기안번호</td>
			<td width=200 colspan="3"><input type="text" name="acode" size=20 value="${acode}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">사번</td>
			<td width=200><input type="text" name="aecode" size=20/></td>
			<td width=100 class="title">작성자</td>
			<td width=200><input type="text" name="ename" size=20/></td>
		</tr>	
		<tr>
			<td width=100 class="title">부서</td>
			<td width=200><input type="text" name="edep" size=20/></td>
			<td width=100 class="title">직위</td>
			<td width=200><input type="text" name="ejobtitle" size=20/></td>
		</tr>
		<tr>
			<td width=100 class="title">제목</td>
			<td width=200 colspan="3"><input type="text" name="atitle" size=60/></td>
		</tr>
		<tr>
			<td width=100 class="title">내용</td>
			<td width=200 colspan="3"><textarea cols="90" rows="30" name="acontent"></textarea></td>
		</tr>
		<tr>
			<td width=100 class="title">첨부파일</td>
			<td width=200 colspan="3"><input type="file" name="afile" size=20/></td>
		</tr>		
	</table>
	<div style="width:900px;margin-top:10px;text-align:center">
		<input type="submit" value="상신"/>
		<input type="reset" value="취소"/>
	</div>
</form>
<script>
$(frm.aecode).on("click", function(){
	window.open("/emp/elist.jsp","ecode","width=350,height=500,top=200,left=500");	
});

$(frm).on("submit", function(e){
	e.preventDefault();
	if(!confirm("기안을 상신하실래요?")) return;
	frm.action="/apr/insert";
	frm.method="post",
	frm.submit();
});
</script>
