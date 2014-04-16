package historiqueServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.authentification;
import responsableDAO.gerer_xml;
import entities.historique;

/**
 * Servlet implementation class list_getlast_client_historique
 */
@WebServlet("/list_getlast_client_historique")
public class list_getlast_client_historique extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_getlast_client_historique() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gererHistorique gh = new gererHistorique();
		gerer_xml gx = new gerer_xml();
		List user = new ArrayList<historique>();
		user = gh.Listhistorique("utilisateur",authentification.email);
		
		request.setAttribute("list_de_user", user);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/client_historique.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
