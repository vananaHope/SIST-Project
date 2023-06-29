<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.JanJan.VO.*"
    import="project.JanJan.DAO.*"
    %>
<%
/* session.setAttribute("member",new Member("vanana","!Rho7777")); */
Member m1 = (Member)session.getAttribute("member");

String al_name = request.getParameter("al_name");
if(al_name==null) al_name="";

String re_priS = request.getParameter("re_pri");
int re_pri = 0;
if(re_priS!=null && re_priS.equals("")) {
	re_pri = Integer.parseInt(re_priS);
}
String resultS = request.getParameter("result");
int result = 0;
if(resultS!=null && resultS.equals("")) {
	result = Integer.parseInt(resultS);
}
String prn = "N";
log(al_name);

if(al_name!=null && !al_name.equals("")) {
	Bag b = new Bag (
		result,
		re_pri,
		al_name,
		m1.getId()
	);
	BagDao dao = new BagDao();
	dao.insBag(b);
	prn = "Y";
}
%>
<%=prn%>