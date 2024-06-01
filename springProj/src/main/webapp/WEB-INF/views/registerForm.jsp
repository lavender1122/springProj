<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
요청URI : /registerFile01
요청파라미터 : {picture=파일객체}
요청방식 : post
-->
<form action="/registerFile01" method="post" enctype="multipart/form-data">
        <p><input type="file" name="picture"/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>
<hr/>
<!-- 
요청URI : //registerFile02
요청파라미터 : {userId = a001,password=1234,picture=파일객체}
요청방식 : post
-->
<form action="/registerFile02" method="post" enctype="multipart/form-data">
        <p>userId: <input type="text" name="userId" value="hongkd"/></p>
        <p>password: <input type="password" name="password" value="1234"/></p>
        <p><input type="file" name="picture"/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>
<hr/>
<!-- 
요청URI : //registerFile03
요청파라미터 : {userId = a001,password=1234,picture=파일객체}
요청방식 : post
-->
<form action="/registerFile03" method="post" enctype="multipart/form-data">
        <p>userId: <input type="text" name="userId" value="hongkd"/></p>
        <p>password: <input type="password" name="password" value="1234"/></p>
        <p><input type="file" name="picture"/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>
<!-- 
요청URI : //registerFile04
요청파라미터 : {userId = a001,password=1234,picture=파일객체}
요청방식 : post
-->
<h3>registerFile04</h3>
<form action="/registerFile04" method="post" enctype="multipart/form-data">
        <p>userId: <input type="text" name="userId" value="hongkd"/></p>
        <p>password: <input type="password" name="password" value="1234"/></p>
        <p><input type="file" name="picture"/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>
<!-- 
요청URI : //registerFile04
요청파라미터 : {userId = a001,password=1234,picture=파일객체}
요청방식 : post
-->
<h3>registerFile05</h3>
<form action="/registerFile05" method="post" enctype="multipart/form-data">
        <p>userId: <input type="text" name="userId" value="hongkd"/></p>
        <p>password: <input type="password" name="password" value="1234"/></p>
        <p><input type="file" name="picture"/></p>
        <p><input type="file" name="picture2"/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>
<!-- 
요청URI : //registerFile08
요청파라미터 : {userId = a001,password=1234,pictureㄴ=파일객체들}
요청방식 : post
-->
<h3>registerFile08</h3>
<form action="/registerFile08" method="post" enctype="multipart/form-data">
        <p>userId: <input type="text" name="userId" value="hongkd"/></p>
        <p>password: <input type="password" name="password" value="1234"/></p>
        <p><input type="file" name="pictures" multiple/></p>
        <p><input type="submit" value="파일업로드"/></p>
</form>