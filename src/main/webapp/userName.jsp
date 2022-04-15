<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style1_bar.css"/>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
        <header>
          <div class="headbar_logo">
            <a href="index.jsp"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="headbar_search">
            <input type="text" name="검색">
            <input type="button" name="search" value="검색" style="width: 10%; height: 46%; float: left; margin-top: 5%; background: rgb(216,190,228);"  >
          </div>
          <div class="headbar_login">
            <input type="button" name="회원가입" value="회원가입" >
            <input type="button" name="로그인" value="로그인">
          </div>              
        </header>

        <!-- -->
        <div class="menu_box">
          <ul class="menu_box_list">
    				<li>
              <a href="#">장르</a>
              <ul class="sub01">
                  <li ><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                </ul>
            </li>
            <li>
              <a href="#">장르</a>
              <ul class="sub01">
                  <li ><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                </ul>
            </li>
            <li>
              <a href="#">장르</a>
              <ul class="sub01">
                  <li ><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                </ul>
            </li>
        		<li>
              <a href="#">장르</a>
              <ul class="sub01">
                  <li ><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                </ul>
            </li>
    			</ul>
        </div>

        <div class="side_bar">
            <p>회원가입</p>
            <p>로그인</p>

        </div>

        <div class="main">
            <p><center><h1> 별명을 입력해 주세요 <br> SB의 닉네임으로 사용됩니다 </h1></center></p>
            <br>
            <hr color="blue" size="5"> <br>
            <form action="">
              <center>
              <input type="text" placeholder="별명입력" name="id" maxlength="10" size="25"/>
              <button type="submit" name="check">중복확인</button> <br>
              <button type="submit">SB시작하기 </button> </p>
              </center>
          </form>

        </div>


    </div>
</body>
</html>