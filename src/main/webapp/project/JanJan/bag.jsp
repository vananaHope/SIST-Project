<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.JanJan.DAO.*"
    import="project.JanJan.VO.*"
    import="java.util.List"
    %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/bag.css">
    <title>잔잔</title>
</head>
<%
BagDao dao = new BagDao();
Member m = (Member)session.getAttribute("member");
%>
<body>
    <script src="./js/bag.js"></script>
    <div class="wrap">
        <header>
            <!--gnb-->
            <div class="inner">
                <div class="gnb">
                    <div class="gnbL">
                        <ul>
                            <li><a href="index.html"><img src="./img/logo.png" class="logo"></a></li>
                            <li><a href="sub.html">구독</a></li>
                            <li><a href="store.jsp">스토어</a></li>
                        </ul>
                    </div>
                    <div class="gnbR">
                        <ul>
                            <li><a href="login.jsp">로그인/회원가입</a></li>
                            <li><a href="bag.jsp"><img src="./img/bag.png" class="bag"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <div class="inner">
            <section><!--여기에 콘텐츠 넣으시면 됩니다.-->
                <div class="bagInner">
                    <h1>장바구니에 담긴 상품들이에요</h1>
                    <h2>담긴 상품</h3>
                    <div> <!--제품선택-->
                        <input type="checkbox" name="check_all"> 전체선택
                    </div>
                    <hr>
<%
int tot = 0;
for (Bag b : dao.getBags(m.getId())) {
	 tot += b.getTotalPrice();
	 if(b.getAlcoholName()!=null){
%>
<div class="prod">
	<input type="checkbox" class="prodCh" name="agree">
	<p id="prodName" >
		<%=b.getAlcoholName()%>
		</p>
	<!--b.name-->
</div>
<div class="bill">
	<input type="button" value="－" onclick='count("minus")'>
	<p id="result"><%=b.getCnt()%></p>
	<!--b.cnt%>-->
	<input type="button" value="＋" onclick='count("plus")'>
	<p class="price"><%=b.getTotalPrice()%>원</p>
	<!--<b.price%>-->
</div>

<!-- tot += b.price*b.cnt -->
<!-- %> 닫힘 -->
<%
}else if(b.getSnackName()!=null) {%>
<div class="prod">
	<input type="checkbox" class="prodCh" name="agree">
	<p id="prodName" >
		<%=b.getAlcoholName()%>
		</p>
	<!--b.name-->
</div>
<div class="bill">
	<input type="button" value="－" onclick='count("minus")'>
	<p id="result"><%=b.getCnt()%></p>
	<!--b.cnt%>-->
	<input type="button" value="＋" onclick='count("plus")'>
	<p class="price"><%=b.getTotalPrice()%>원</p>
	<!--<b.price%>-->
</div>
<%} 
}%>

                    <div>
                        <h2>결제 정보</h2>
                    </div>
                    <div class="payInfo">
                        <div class="payInfoTot">
                            <p>총 주문 금액</p>
                            <p class="payTot2"><%=tot %>원</p>
                        </div>
                    </div>
                    <div class="done">
                        <input type="submit" value="주문하기">
                    </div>
                </div>
            </section>
        </div>
    </div>
<script src="./js/index.js"></script>
</body>
</html>