package AdminServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.authentification;
import entities.administrateur;
import entities.client;
import entities.privilege_admin;
import adminDAO.gerer_admin;
import adminDAO.gerer_privilege_admin;

/**
 * Servlet implementation class list_update_priv_admin
 */
@WebServlet("/list_update_priv_admin")
public class list_update_priv_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String email=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_update_priv_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("admin");
		list_update_priv_admin.email=email;
		gerer_privilege_admin gp = new gerer_privilege_admin();
		List l = new ArrayList<privilege_admin>();
		l = gp.ListPrivilege(email);
		
		request.setAttribute("list_de_priv", l);
		this.getServletContext().getRequestDispatcher("/WEB-INF/super_admin_privilege.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		privilege_admin pa = new privilege_admin();
		String c1 = request.getParameter("CHOIX1");
		String c2 = request.getParameter("CHOIX2");
		String c3 = request.getParameter("CHOIX3");
		String c4 = request.getParameter("CHOIX4");
		String c5 = request.getParameter("CHOIX5");
		String c6 = request.getParameter("CHOIX6");
		String c7 = request.getParameter("CHOIX7");
		String c8 = request.getParameter("CHOIX8");
		String c9 = request.getParameter("CHOIX9");
		if (c1==null){
			pa.setAddClient(false);
		}else{
			pa.setAddClient(true);
		}
		if (c2==null){
			pa.setDeleteClient(false);
		}else{
			pa.setDeleteClient(true);
		}
		if (c3==null){
			pa.setViewClient(false);
		}else{
			pa.setViewClient(true);
		}
		if (c4==null){
			pa.setUpdateClient(false);
		}else{
			pa.setUpdateClient(true);
		}
		if (c5==null){
			pa.setViewNotif(false);
		}else{
			pa.setViewNotif(true);
		}
		if (c6==null){
			pa.setAnswerNotif(false);
		}else{
			pa.setAnswerNotif(true);
		}
		if (c7==null){
			pa.setExport(false);
		}else{
			pa.setExport(true);
		}
		if (c8==null){
			pa.setViewStat(false);
		}else{
			pa.setViewStat(true);
		}
		if (c9==null){
			pa.setViewHistoric(false);
		}else{
			pa.setViewHistoric(true);
		}
		
		gerer_privilege_admin gp = new gerer_privilege_admin();
		gp.updatePriv(pa, list_update_priv_admin.email);
		this.getServletContext().getRequestDispatcher("/WEB-INF/index_super_admin.jsp").forward(request, response);
		
		
	}

}
