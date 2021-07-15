<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2>기안목록</h2>
<style>
	.prod_name{font-size:12px; width:170px; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;}
	.del0 {color:orange;}
	.del1 {color:green;}
	.del2 {color:red; }
</style>
<div id="divCondition">
	<div style="float:left;">
		<select id="key">
			<option value="acode">기안번호</option>
			<option value="aecode">사번</option>
			<option value="atitle">제목</option>
			<option value="ename">이름</option>
			<option value="edep">부서</option>
			<option value="ejobtitle">직위</option>
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
			<option value="acode">기안번호</option>
			<option value="aecode">사번</option>
			<option value="atitle">제목</option>
			<option value="ename">이름</option>
			<option value="edep">부서</option>
			<option value="ejobtitle">직위</option>
			<option value="astate">상태</option>
		</select>
		<select id="desc">
			<option value="desc">내림차순</option>
			<option value="asc">오름차순</option>
		</select>
	</div>
</div>
<a href="/apr/insert">신규기안</a>
<!--<b style="float: right;">완료기안 숨기기</b><input type="checkbox" id="hchk" style="float: right;"/> -->
<table id="tbl" style="table-layout:fixed"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=80>기안번호</td>
		<td width=50>사번</td>
		<td width=200>기안제목</td>
		<td width=100>작성자</td>
		<td width=100>소속부서</td>
		<td width=100>직위</td>
		<td width=100>첨부파일</td>
		<td width=50>상태</td>
		<td width=50>🔎</td>
	</tr>
	{{#each array}}
	<tr class="row">
		<td>{{acode}}</td>
		<td>{{aecode}}</td>
		<td>{{atitle}}</td>
		<td>{{ename}}</td>
		<td>{{edep}}</td>
		<td>{{ejobtitle}}</td>
		<td>{{afile}}</td>
		<td class="del{{astate}}">{{state astate}}</td>
		<td><button onClick="location.href='/apr/read?acode={{acode}}'">🔎</button></td>
	</tr>
	{{/each}}
</script>
<script>
Handlebars.registerHelper("state", function(astate){
	if(astate==0){
		return "처리중";
	}else if(astate==1){
		return "처리완료";
	}else if(astate==2){
		return "반려";
	}
});

</script>
<div id="pagination">
	<button id="btnPre">◀</button>
	<span id="pageInfo"></span>
	<button id="btnNext">▶</button>
</div>
<script>
	var url="/apr/list.json";
	
</script>
<script src="/script.js"></script>