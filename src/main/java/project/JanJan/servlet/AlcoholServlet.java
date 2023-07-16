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
 * Servlet implementation class AlcoholServlet
 */
@WebServlet("/AlcoholServlet")
public class AlcoholServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlcoholServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String refno = request.getParameter("refno");
		String ordno = request.getParameter("ordno");
		String val = request.getParameter("val");
		String prn = "N";
		if(title!=null) {
			Admin adm = new Admin(
						0,
						title,
						val,
						Integer.parseInt(refno),
						Integer.parseInt(ordno));
			
			AdminDao dao = new AdminDao();
			dao.insertAlcohol(adm);
			prn = "Y";
		}
		response.getWriter().print(prn);
	}

}
