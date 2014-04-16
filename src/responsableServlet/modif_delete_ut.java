package responsableServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.authentification;
import responsableDAO.gerer_utilisateur;


	/**
	 * Servlet implementation class modif_delete_admin
	 */
	@WebServlet("/modif_delete_ut")
	public class modif_delete_ut  extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public modif_delete_ut() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String mail=request.getParameter("mail");
			gerer_utilisateur gu = new gerer_utilisateur();
			gu.deleteUtilisateur(mail);
			gererHistorique gh = new gererHistorique();
			gh.Task("à supprimer un utilisateur", request.getRemoteAddr(), "responsable", authentification.email);
			
		}

	}


