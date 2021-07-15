<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2>신규입사자등록</h2>
<form name="frm" method="post" action="insert">
	<table>
		<tr>
			<td width=100 class="title">사번</td>
			<td width=200><input type="text" name="ecode" size=20 value="${ecode}"/></td>
			<td width=100 class="title">이름</td>
			<td width=200><input type="text" name="ename" size=20/></td>
		</tr>
		<tr>
			<td width=100 class="title">아이디</td>
			<td width=200><input type="text" name="eid" size=20/></td>
			<td width=100 class="title">비밀번호</td>
			<td width=200><input type="text" name="epass" size=20/></td>
		</tr>
		<tr>
			<td width=100 class="title">부서</td>
			<td width=200><input type="text" name="edep" size=20/></td>
			<td width=100 class="title">직위</td>
			<td width=200><input type="text" name="ejobtitle" size=20/></td>
		</tr>		
		<tr>
			<td width=100 class="title">전화번호</td>
			<td width=200><input type="text" name="etel" size=20/></td>
			<td width=100 class="title">이메일</td>
			<td width=200><input type="text" name="eemail" size=20/></td>
		</tr>			
	</table>
<div style="width:900px;margin-top:10px;text-align:center">
	<input type="submit" value="입사등록"/>
	<input type="reset" value="등록취소"/>
</div>
</form>
<script>
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("신규입사 등록하실래요?")) return;
		frm.submit();
	});
</script>