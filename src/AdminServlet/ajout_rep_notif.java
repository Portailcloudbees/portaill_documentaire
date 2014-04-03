package AdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminDAO.gerer_reclamation;
import connexion.authentification;
import entities.reclamation_rep;

/**
 * Servlet implementation class ajout_rep_notif
 */
@WebServlet("/ajout_rep_notif")
public class ajout_rep_notif extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajout_rep_notif() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("////"+request.getParameter("id"));
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("nomprenom", authentification.nomprenom);
		request.setAttribute("email", authentification.email);
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin_create_notif.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println();
		reclamation_rep rep = new reclamation_rep();
		rep.setNom_prenom_rep(authentification.nomprenom);
		rep.setEmail_rep(authentification.email);
		rep.setContenue_rep(request.getParameter("content"));
		rep.setDate_rep(null);
		rep.setId_rec(Integer.parseInt(request.getParameter("id")));
		gerer_reclamation gr = new gerer_reclamation();
		gr.ajouterRep(rep);
		this.getServletContext().getRequestDispatcher("/list_delete_reclamation").forward(request, response);
		
	}

}
