<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="project.JanJan.VO.Snack"
    import = "project.JanJan.DAO.ItemDao"
    import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/global.css">    <title>잔잔</title>
    <link rel="stylesheet" href="./css/item.css">
    <script>
    	function ajaxCart(){
    		var result = document.querySelector(".cnt #result").innerText
    		var repri = document.querySelector(".box_pri #re_pri").innerText
    		var s_name = document.querySelector("#s_name").innerText
    		console.log(s_name);
    		var qStr = "result="+result+"&re_pri="+repri+"&s_name="+s_name
    		
    		var xhr = new XMLHttpRequest()
    		xhr.open("post","bagData2.jsp",true)
    		xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded")
			xhr.send(qStr)
    		xhr.onreadystatechange = function(){
    			if(xhr.readyState==4&&xhr.status==200) {
    				var result = (xhr.responseText).trim()
    				console.log(result)
    				if(result=="Y") {
    					alert("장바구니 등록 성공")
    				}
    			}
    		}		
    	}
    	function warning(check){
    		if(check==''){
    			if(confirm("로그인이 필요합니다. 로그인 하시겠습니까?")){
    				location.href="login.jsp"
    			}
    		}else{
    			location.href="bag.jsp"
    		}
    	}
    </script>
</head>
<body>
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
                            <c:set var="mem" value="${member}"/>
							<li><img src="./img/bag.png" onclick="warning('${mem.id}')"
									class="bag"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <div class="inner">
            <section> <!--여기에 콘텐츠 넣으시면 됩니다.-->               
                <div class = "pro_info_all">
                <%
                   request.setCharacterEncoding("UTF-8");
                   String s_name = request.getParameter("s_name");
                   ItemDao dao = new ItemDao();
                   List<Snack> slist = dao.snList(s_name);
                   for(Snack s:slist){%>
                    <div> <!--제품 대표 이미지-->
                        <img alt ="제품 대표 이미지" src = "<%=s.getSnack_img() %>" class = "pro_main">
                    </div>
                    <div class = "pro_info"><!--제품 설명-->
                        <div>
                            <div class="pro_name">
                                <p id="s_name" name="s_name"><%=s.getSnack_name()%></p> 
                            </div>
                            <div class="pro_info02">
                            	<p><%=s.getSnack_des()%></p> 
                            </div>
                            <div class = "pro_info_detail_allx">
                                <div class = "pro_info_detail">
                                    <label>카테고리:</label>
                                    <span><%=s.getCategory_name()%></span>
                                </div>
                            <br><br><br>
                            <div class = "price">
                                <label class = "price01">판매가격:</label>
                                <div>
                                    <span class = "price02"><%=s.getSnack_price()%>원</span>
                                </div>
                                <br>
                                <div class = "use">
                                    <label>유통기한:</label>
                                    <span><%=s.getExpdate() %>까지</span>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
                <div class = "box_all"><%-- 
                    <div class = "box_opt">
                        <label>옵션</label>
                    </div>
                    <div class = "box_sel"><select id = "opt" class = "select01">
                        <option>어떤 옵션을 원하시나요?</option>
                        <option value = "2000">옵션1</option>
                        <option value = "5000">옵션2</option>
                    </select></div>--%>
                    <div class = "box_opt">
                        <div class="cnt_f ">
                            <label>수량</label>
                        </div>
                        <br>
                        <%for(Snack s:slist) { %>
                        <script type="text/javascript">
	                    	function count(action) {
	                      	  var resultElement = document.getElementById('result');
	                      	  var result = parseInt(resultElement.innerText);
	
	                      	  if (action === 'plus') {
	                      	    result += 1;
	                      	  } else if (action === 'minus') {
	                      	    result -= 1;
	                      	    if (result < 0) {
	                      	      result = 0;
	                      	    }
	                      	  }
	
	                      	  resultElement.innerText = result;
	
	                      	  calculateTotalPrice(); // 수량 변경 후 가격 계산
	                      	}
	                        function calculateTotalPrice() {
	                        	  var quantity = parseInt(document.getElementById('result').innerText); // 수량 가져오기
	                        	  var unitPrice = <%=s.getSnack_price()%>; // 단위 가격 설정
	
	                        	  var totalPrice = quantity * unitPrice; // 총 가격 계산
	
	                        	  document.getElementById('re_pri').innerText = numberWithCommas(totalPrice); // 총 가격을 요소에 표시
	
	                        	  if (quantity === 0) {
	                        	    document.getElementById('re_pri').innerText = 0; // 수량이 0인 경우 가격을 0으로 설정
	                        	  }
	                        	}
	                        function numberWithCommas(x) {
	                            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	                        }
                        </script>
                        <%} %>
						<div class="cnt">
						    <div class="cnt_opt" onclick='count("minus")'>
						        <img class="pm" src="./img/item/minus.png">
						    </div>
						    <div class="cnt_opt2" id="result" name="result">0</div>
						    <div class="cnt_opt" onclick='count("plus")'>
						        <img class="pm" src="./img/item/plus.png">
						    </div>
						</div>
						<div class="box_opt">
						    <label>총 상품가격</label>
						</div>
						<div class="box_pri">
						    <span id="re_pri" name="re_pri">0</span>
						    <span>원</span>
						</div>
						<script type="text/javascript">
						    // 초기 가격 업데이트
						    calculateTotalPrice();
	
						    function numberWithCommas(x) {
						        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						    }
						</script>
                    <div>
                        <img class = "del_img" src = "./img/item/delivery.png">
                    </div>
                    <div class = "but01">
                        <button class = "but_det01" type="button" onclick="ajaxCart(); warning('${mem.id}');">
                        <img class = "but_img" src = "./img/item/bag_full.png">장바구니</button>
                    </div>
                    <div class = "but01">
                        <button class = "but_det02">
                        <img class = "but_img" src = "./img/item/gift.png">선물하기</button>
                    </div>
                    <div>
                        <button class = "but_det03">바로 구매하기</button>
                    </div>
                    <br>
                </div>
            </section>
        </div>
    </div>
</body>
</html>