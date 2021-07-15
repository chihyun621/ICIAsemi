<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2>직원목록</h2>
<div id="divCondition">
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
<a href="/emp/insert">신규입사</a>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=50>사번</td>
		<td width=100>아이디</td>
		<td width=100>이름</td>
		<td width=100>소속부서</td>
		<td width=100>직위</td>
		<td width=100>전화번호</td>
		<td width=200>이메일</td>
		<td width=50>🔎</td>
	</tr>
	{{#each array}}
	<tr class="row">
		<td>{{ecode}}</td>
		<td>{{eid}}</td>
		<td>{{ename}}</td>
		<td>{{edep}}</td>
		<td>{{ejobtitle}}</td>
		<td>{{etel}}</td>
		<td>{{eemail}}</td>
		<td><button onClick="location.href='/emp/read?ecode={{ecode}}'">🔎</button></td>
	</tr>
	{{/each}}
</script>
<div id="pagination">
	<button id="btnPre">◀</button>
	<span id="pageInfo"></span>
	<button id="btnNext">▶</button>
</div>
<script>
	var url="/emp/list.json";
</script>
<script src="/script.js"></script>