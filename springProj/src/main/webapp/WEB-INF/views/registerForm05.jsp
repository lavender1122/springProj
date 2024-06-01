<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h2>Spring Form05</h2>
<!-- modelAttribute 속성에 폼 객체의 속성명을 지정함 -->
<form:form modelAttribute="user" method="post"
	action="/registerForm01Post">
	<p> <form:label path="userId">유저ID:  </form:label> 
		<input type="text" name="userId"
			placeholder="아이디" value="${user.userId}"/>
<%-- 		<form:input path="userId" --%>
<%-- 			placeholder="아이디" disabled="true" readonly="true "/>	 --%>
		<font color="red"><form:errors path="userId"/></font>
	</p>
	<p> <form:label path="userName">이름: </form:label> 
<!-- 		<input type="text" name="userName" -->
<!-- 		placeholder="이름"/>	 -->
		<form:input path="userName"
			placeholder="이름"/>
			<font color="red"><form:errors path="userName"/></font>
	</p>
	<!-- 
	12. 숨겨진 필드 요소
		HTML 숨겨진 필드를 출력할려면 hidden 요소를 사용
	 -->
	 <p>
<!-- 	 	<input type="hidden" id="coin" name="coin"> 아래 코드랑 같은 의미 -->
	 	<form:hidden path="coin"/>
	 </p>
	<p> <form:label path="password">패스워드 :  </form:label> 
<!-- 		<input type="password" id="password" name="password"> -->
		<!-- 값을 설정해서 뷰에 전달하더라도 패스워드 필드에 반영안됨 -->
		<form:password path="password"/>
	
	</p>
	<p>
<!-- 		<input type="submit" value="등록"/> -->
<!-- 		<button id="register" name="register" type="submit" value="Submit">등록</button>	 -->
		<form:button name="register">등록</form:button>
	</p>
	<p> 소개글:
		<form:textarea path="introduction" rows="6" cols="30"/>
	</p>
	<p> 개발자여부:(String)
		<form:checkbox path="developer" value="Y"
		label="Y/없음"/>
	</p>
	<p> 외국인여부:(boolean)
		<form:checkbox path="foreigner" value="false"
		label="true/false"/>
	</p>
	<p><form:label path="email">이메일 주소 :</form:label>
	<!-- <input type="text" id="email" name="email" -->
		<form:input path="email"/>
		<font color="red"><form:errors path="email"/></font>
		
	</p>
	<p> <form:label path="dateOfBirth">생일 : </form:label>
		<form:input path="dateOfBirth" placeholder="ex)2020-03-01"/>
		<font color="red"><form:errors path="dateOfBirth"/></font>		
	</p>
	
	<p>취미:
		<form:checkboxes items="${user.hobbyMap}" path="hobbyArray"/>
		<p></p>
		<form:checkbox path="hobby" value="kmj"
			label="Music"/> &nbsp;
		<form:checkbox path="hobby" value="ksy"
		label="FootBall"/> &nbsp;
		<form:checkbox path="hobby" value="jmj"
		label="Book"/>
		<p />
		<!-- Controller => String[] hobbyArray ->["kmj","jmj"]  -->
		<form:checkbox path="hobbyArray" value="kmj"
			label="Music"/> &nbsp;
		<form:checkbox path="hobbyArray" value="ksy"
		label="FootBall"/> &nbsp;
		<form:checkbox path="hobbyArray" value="jmj"
		label="Book"/>
	</p>
	<p> 성별:(String gender)
		<form:radiobuttons items="${user.genderCodeMap}" path="gender"/>
	<p/>
		<form:radiobutton path="gender" value="Male"
		label="남성"/> &nbsp;
		<form:radiobutton path="gender" value="FeMale"
		label="여성"/> &nbsp;
		<form:radiobutton path="gender" value="etc"
		label="기타"/> &nbsp;
	
	</p>
	<p>국적 :(String nationality)
<%-- 		<form:select path="nationality"  --%>
<%-- 			items="${user.nationalityCodeMap}"> --%>
<%-- 		</form:select> --%>
		<!-- 국적을 공통코드로 부터 가져와 보자  
		List<ComCodeDetailVO> comCodeDetailVOList-->
<%-- 		${comCodeVO}<br> --%>
<%-- 		${comCodeVO.comCodeDetailVOList}	 --%>
		<select id="nationality" name="nationality">
			<c:forEach var="comCodeDetailVO" items="${comCodeVO.comCodeDetailVOList}" varStatus="stat">
				<option value="${comCodeDetailVO.comCodeDetail}">${comCodeDetailVO.comCodeDetailNm}</option>
			</c:forEach>
		</select>
	</p>
	<p>보유자동차:
		<form:checkboxes items="${user.carMap}" path="carArray"/>
	</p>
	<p>주소:
		1)우편번호 :<form:input path="address.postCode"/> 
			<font color="red"><form:errors path="address.postCode"/></font>		
		<br/>
		2) 주소 : <form:input path="address.location"/>
			<font color="red"><form:errors path="address.location"/></font>		
	</p>
   <p>카드 : 
      <form:input path="cardList[0].no" placeholder="카드번호"/>
         <font color="red"><form:errors path="cardList[0].no" /></font>
      <form:input path="cardList[0].validMonth"  placeholder="ex)20240517"/>
         <font color="red"><form:errors path="cardList[0].validMonth" /></font>
      <br />
      <form:input path="cardList[1].no" placeholder="카드번호"/>
         <font color="red"><form:errors path="cardList[1].no" /></font>
      <form:input path="cardList[1].validMonth"  placeholder="ex)20240517"/>
         <font color="red"><form:errors path="cardList[1].validMonth" /></font>
   </p>
	
</form:form>