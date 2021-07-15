<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
	table{border-collapse: collapse;}
	td {border:1px solid black; padding:5px;}
	.title{background:gray;color:white;}
	.row{cursor:pointer;}
</style>
<h2>직원목록</h2>
<div id="divCondition" style="display:none">
	<div style="float:left;">
		<select id="key">
			<option value="ecode">직원번호</option>
			<option value="eid">직원아이디</option>
			<option value="ename">직원이름</option>
			<option value="edep">소속부서</option>
			<option value="ejobtitle">직원직위</option>
		</select>
		<input type="text" id="word" placeholder="검색어"/>
		<select id="perpage">
			<option value="4">4개씩출력</option>
			<option value="8">8개씩출력</option>
			<option value="12">12개씩출력</option>
		</select>
		<span id="count"></span>
	</div>
	<div style="float:right;">
		<select id="order">
			<option value="ecode">직원번호</option>
			<option value="eid">직원아이디</option>
			<option value="ename">직원이름</option>
			<option value="edep">직원부서</option>
			<option value="ejobtitle">직원직위</option>
		</select>
		<select id="desc">
			<option value="desc">내림차순</option>
			<option value="asc">오름차순</option>
		</select>
	</div>
</div>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=50>사번</td>
		<td width=100>이름</td>
		<td width=100>소속부서</td>
		<td width=100>직위</td>
	</tr>
	{{#each array}}
	<tr class="row">
		<td class="ecode">{{ecode}}</td>
		<td class="ename">{{ename}}</td>
		<td class="edep">{{edep}}</td>
		<td class="ejobtitle">{{ejobtitle}}</td>
	</tr>
	{{/each}}
</script>
<div id="pagination">
	<button id="btnPre">◀</button>
	<span id="pageInfo"></span>
	<button id="btnNext">▶</button>
</div>
<button id="btnClose">닫기</button>
<script>
	var url="/emp/list.json";
	$("#btnClose").on("click", function(){
		window.close();
	});
	
	$("#tbl").on("click", ".row", function(){
		var ecode=$(this).find(".ecode").html();
		var ename=$(this).find(".ename").html();
		var edep=$(this).find(".edep").html();
		var ejobtitle=$(this).find(".ejobtitle").html();
		$(opener.frm.aecode).val(ecode);
		$(opener.frm.ename).val(ename);
		$(opener.frm.edep).val(edep);
		$(opener.frm.ejobtitle).val(ejobtitle);
	});
</script>
<script src="/script.js"></script>