package project.JanJan.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.JanJan.DAO.AdminDao;
import project.JanJan.VO.Admin;

/**
 * Servlet implementation class SnackServlet
 */
@WebServlet("/SnackServletUdt")
public class SnackServletUdt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SnackServletUdt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		String title = request.getParameter("title");
		if(title==null)title="";
		String refno = request.getParameter("refno");
		if(refno==null)refno="0";
		String ordno = request.getParameter("ordno");
		if(ordno==null)ordno="0";
		String val = request.getParameter("val");
		if(val==null)val="";
		String prdno = request.getParameter("prdno");
		if(prdno==null)prdno="0";
		String prn = "N";
		if(title!=null) {
			Admin adm = new Admin(
					Integer.parseInt(prdno),
					title,
					val,
					Integer.parseInt(refno),
					Integer.parseInt(ordno)
			);
			AdminDao dao = new AdminDao();
			dao.updateAS(adm);
			prn = "Y";
		}
		response.getWriter().print(prn);
	}
}
