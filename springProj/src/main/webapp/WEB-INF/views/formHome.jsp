<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
method 생략 시 get방식이 기본임
method="get"이 생략됨
 -->
<form action="/board/register">
	<input type = "submit" value="register(GET)"/>
</form>
<hr/>
<!-- 
요청 URL : /board/register
요청파라미터 : 
요청방식 : post
 -->
<form action="/board/register" method="post">
	<input type = "submit" value="register(POST)"/>
</form>
<hr />
<!-- 
요청URI : /board/modify
요청파라미터 : 
요청방식 : get
-->
<form action="modify">
   <input type="submit" value="modify(GET)" />
</form>
<hr />
<!-- 
요청URI : /board/modify
요청파라미터 : 
요청방식 : post
-->
<form action="/board/modify" method="post">
   <input type="submit" value="modify(POST)" />
</form>
<hr/>
<!-- 
요청URI : /register01
요청파라미터 : {userId=hongkd,password=1234,coin=100}
요청방식 : post
-->
<form action="/registerUserId" method="post">
	<p>userId:<input type="text" name ="userId" value="" required/></p>
	<p>userName:<input type="text" name ="userName" value=""required/></p>
	<p>passwoad:<input type="passwoad" name ="password" value="1234"required/></p>
	<p>coin :<input type="text" name ="coin" value="100"/></p>
	<p>regist Date : <input type="date" name="regDate" value=""></p>
	<p>gender : <br/>
	<!-- 
		radio/checkbox => checked 속성
		select => selected 속성
	 -->
	 <!-- 컨트롤러의 매개변수로 String gender -->
      <input type="radio" name="gender" id="gender1" value="male" checked />
      <label for="gender1">Male</label><br />
      <input type="radio" name="gender" id="gender2" value="female" />
      <label for="gender2">Female</label><br />
      <input type="radio" name="gender" id="gender3" value="other" />
      <label for="gender3">Other</label><br />
   </p>
   <p>
   <!-- 컨트롤러의 매개변수로 String nationality -->
   	nationality :<br/>
      <select name="nationality">
         <option value="Korea" selected>대한민국</option>
         <option value="Germany" >독일</option>
         <option value="Australia" >호주</option>
         <option value="Canada" selected>캐나다</option>
      </select>
   </p>
   <p>
   	<!-- 
   	문자열 배열 타입 매개변수로 처리
   	multiple : 다중 선택 가능
   	 -->
   	<!-- 컨트롤러의 매개변수로 String cars -->
      car :<br/>
      <select name="cars" multiple>
         <option value="volvo" selected>Volvo</option>
         <option value="saab">Saab</option>
         <option value="opel">Opel</option>
         <option value="audi">Audi</option>
      </select>
   </p>
   <p>
   	<!-- 
   	문자열 배열 타입 매개변수로 처리
   	multiple : 다중 선택 가능
   	 -->
   	<!-- 컨트롤러의 매개변수로 String[] carArray -->
      car :<br/>
      <select name="carArray" multiple>
         <option value="volvo" selected>Volvo</option>
         <option value="saab">Saab</option>
         <option value="opel">Opel</option>
         <option value="audi">Audi</option>
      </select>
   </p>
   <p>
   	<!-- 
   	문자열 배열 타입 매개변수로 처리
   	multiple : 다중 선택 가능
   	 -->
   	<!-- 컨트롤러의 매개변수로 ArrayList<String> carArray -->
      car :<br/>
      <select name="carList" multiple>
         <option value="volvo" selected>Volvo</option>
         <option value="saab">Saab</option>
         <option value="opel">Opel</option>
         <option value="audi">Audi</option>
      </select>
   </p>
   <hr/>
   <p>
   <!-- 컨트롤러에서 매개변수로 String hobby  -->
      hobby : <br/>
      <input type="checkbox" name="hobby" value="Sports">Sports<br />
      <input type="checkbox" name="hobby" value="Music">Music<br />
      <input type="checkbox" name="hobby" value="Movie">Movie<br />
   </p>
   <p>
   <!-- 컨트롤러에서 매개변수로 String[] hobbyArray  -->
      hobbyArray : <br/>
      <input type="checkbox" name="hobbyArray" value="Sports">Sports<br />
      <input type="checkbox" name="hobbyArray" value="Music">Music<br />
      <input type="checkbox" name="hobbyArray" value="Movie">Movie<br />
   </p>
   <p>
   	<!-- 컨트롤러에서 매개변수로 List<String> hobbyList  -->
      hobbyList : <br/>
      <input type="checkbox" name="hobbyList" value="Sports">Sports<br />
      <input type="checkbox" name="hobbyList" value="Music">Music<br />
      <input type="checkbox" name="hobbyList" value="Movie">Movie<br />
   </p>
   <p>
      <!-- 문자열 타입 매개변수로 처리 => String developer -->
      developer : 
      <input type="checkbox" name="developer" value="Y" />
   </p>
   <p>
      <!-- 불리언 타입 매개변수로 처리 => boolean foreigner -->
      <!-- value를 true로 초기화 해야 함 -->
      foreigner : 
      <input type="checkbox" name="foreigner" value="true" />
   </p>
   <p>
   	postCode :<input type="text" name="postCode">
   	<br/>
   	location :<input type="text" name="location">
   </p>
   <p>
   	postCode :<input type="text" name="address.postCode">
   	<br/>
   	location :<input type="text" name="address.location">
   </p>
   <p>
      <input type="text" name="cardList[0].no" placeholder="카드1-번호"> <br>
      <input type="text" name="cardList[0].validMonth" placeholder="카드1-유효연월"> <br>
      <input type="text" name="cardList[1].no" placeholder="카드2-번호"> <br>
      <input type="text" name="cardList[1].validMonth" placeholder="카드2-유효연월"> <br>
   </p>
   <p>
      <textarea name="introduction" cols="50" rows="60" placeholder="자기소개"></textarea>
   </p>
	<p><input type="submit" value="register01"/></p>
</form>
<hr/>
<!-- 
요청URㅑ :/registerUserId
요청파라미터:{userId=honggd}
요청방식 :post
 -->
<form action="/registerUserId" method="post">
	<p>userId : <input type="text" name="userId"/></p>
	<p>password : <input type="password" name="password"/></p>
	<p> <input type="submit" value="registerUserId"/></p>
</form>
<script>
function getToday(){
	let today = new Date();
	let year= today.getFullYear();
	let month = ('0' +(today.getMonth()+1)).slice(-2);
	let day= ('0' + today.getDate()).slice(-2);
	
	let dateString = year+"-"+month+"-"+day;
	
	console.log("dateString",dateString);
	let obj =document.querySelector("input[name='regDate']")
	obj.value=dateString
}
getToday(); 
</script>