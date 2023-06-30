package project.JanJan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.JanJan.DAO.AdminDao;
import project.JanJan.VO.Admin;

import java.io.IOException;

/**
 * Servlet implementation class SnackServlet
 */
public class SnackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SnackServlet() {
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
			dao.insertSnack(adm);
			prn = "Y";
		}
		response.getWriter().print(prn);
	}

}
