package project.JanJan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.JanJan.DAO.BagDao;
import project.JanJan.VO.Bag;
import project.JanJan.VO.Member;

/**
 * Servlet implementation class SnackServlet
 */
@WebServlet("/SnackServlet")
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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String al_name = request.getParameter("al_name");
		String re_priS = request.getParameter("re_pri");
		int re_pri = 0;
		if(re_priS!=null) {
			re_pri = Integer.parseInt(re_priS);
		}
		String resultS = request.getParameter("result");
		int result = 0;
		if(resultS!=null) {
			result = Integer.parseInt(resultS);
		}
		
		Member m1 = (Member)session.getAttribute("member");
		String memId = (String)session.getAttribute(m1.getId());
		
		String prn = "N";
		if(al_name!=null) {
			Bag b = new Bag (
				result,
				re_pri,
				al_name,
				memId
			);
			BagDao dao = new BagDao();
			dao.insBag(b);
			prn = "Y";
		}
		response.getWriter().print(prn);
	}

}
