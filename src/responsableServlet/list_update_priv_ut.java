package responsableServlet;


	import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

	import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.privilege_utilisateur;
import responsableDAO.gerer_privilege_ut;

	

	/**
	 * Servlet implementation class list_update_priv_ut
	 */
	@WebServlet("/list_update_priv_ut")
	public class list_update_priv_ut  extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    private static String email=null;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public list_update_priv_ut() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String email=request.getParameter("user");
			list_update_priv_ut.email=email;
			gerer_privilege_ut gpu = new gerer_privilege_ut();
			List l = new ArrayList<privilege_utilisateur>();
			l = gpu.ListPrivilege(email);
			
			request.setAttribute("list_de_priv", l);
			this.getServletContext().getRequestDispatcher("/WEB-INF/priv_us.jsp").forward(request, response);
					
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			privilege_utilisateur pu = new privilege_utilisateur();
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
				pu.setUploadFile(false);
			}else{
				pu.setUploadFile(true);
			}
			if (c2==null){
				pu.setDeleteFile(false);
			}else{
				pu.setDeleteFile(true);
			}
			if (c3==null){
				pu.setSendFile(false);
			}else{
				pu.setSendFile(true);
			}
			if (c4==null){
				pu.setDownloadFile(false);
			}else{
				pu.setDownloadFile(true);
			}
			if (c5==null){
				pu.setSendSms(false);
			}else{
				pu.setSendSms(true);
			}
			if (c6==null){
				pu.setSendEmail(false);
			}else{
				pu.setSendEmail(true);
			}
			
			if (c7==null){
				pu.setAnswerNotif(false);
			}else{
				pu.setAnswerNotif(true);
			}
			
			if (c8==null){
				pu.setViewStat(false);
			}else{
				pu.setViewStat(true);
			}
			if (c9==null){
				pu.setExport(false);
			}else{
				pu.setExport(true);
			}
			gerer_privilege_ut gpu = new gerer_privilege_ut();
			gpu.updatePriv(pu, list_update_priv_ut.email);
			
			this.getServletContext().getRequestDispatcher("/index_client.jsp").forward(request, response);
			
			
		}

	}
