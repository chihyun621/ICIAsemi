<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>μ§μμ λ³΄π</h2>
<form name="frm" method="post" action="update">
	<table>
		<tr>
			<td width=100 class="title">μ¬λ²</td>
			<td width=200><input type="text" name="ecode" size=20 value="${vo.ecode}"/></td>
			<td width=100 class="title">μ΄λ¦</td>
			<td width=200><input type="text" name="ename" size=20 value="${vo.ename}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">μμ΄λ</td>
			<td width=200><input type="text" name="eid" size=20 value="${vo.eid}"/></td>
			<td width=100 class="title">λΉλ°λ²νΈ</td>
			<td width=200><input type="text" name="epass" size=20 value="${vo.epass}"/></td>
		</tr>
		<tr>
			<td width=100 class="title">λΆμ</td>
			<td width=200><input type="text" name="edep" size=20 value="${vo.edep}"/></td>
			<td width=100 class="title">μ§μ</td>
			<td width=200><input type="text" name="ejobtitle" size=20 value="${vo.ejobtitle}"/></td>
		</tr>		
		<tr>
			<td width=100 class="title">μ νλ²νΈ</td>
			<td width=200><input type="text" name="etel" size=20 value="${vo.etel}"/></td>
			<td width=100 class="title">μ΄λ©μΌ</td>
			<td width=200><input type="text" name="eemail" size=20 value="${vo.eemail}"/></td>
		</tr>			
	</table>
	<div style="width:900px;margin-top:10px;text-align:center">
		<input type="submit" value="μ λ³΄μμ "/>
		<input type="button" value="μ­μ νκΈ°" id="btnDelete"/>
		<input type="reset" value="μμ μ·¨μ"/>
	</div>
<script>
	var ecode="${vo.ecode}";
	//μ­μ νκΈ°
	$("#btnDelete").on("click", function(){
		if(!confirm("μ­μ νμ€λμ?")) return;
		frm.method="get";
		location.href="/emp/delete?ecode=" + ecode;
		alert("μ­μ μλ£");
	});
	
	//μνμμ νκΈ°
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!(confirm("μ λ³΄λ₯Ό μμ νμ€λμ?"))) return;
		frm.submit();
	});
</script>
<script>
	var url="/apr/list.json";
</script>
<script src="/script.js"></script>
