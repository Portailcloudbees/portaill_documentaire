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

import responsableDAO.gerer_utilisateur;
import connexion.authentification;
import entities.historique;
import entities.utilisateur_entities;

/**
 * Servlet implementation class list_getlast_historique
 */
@WebServlet("/list_getlast_historique")
public class list_getlast_historique extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_getlast_historique() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gererHistorique gh = new gererHistorique();
		List admin = new ArrayList<historique>();
		List client = new ArrayList<historique>();
		admin = gh.Listhistorique("administrateur",null);
		client = gh.Listhistorique("responsable",null);
		request.setAttribute("list_de_client", client);
		request.setAttribute("list_de_administrateur", admin);
		System.out.println(admin.size()+"--"+client.size());
		if(authentification.c.equals("admin")){
			this.getServletContext().getRequestDispatcher("/WEB-INF/admin_historique.jsp").forward(request, response);
			
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/super_historique.jsp").forward(request, response);
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
