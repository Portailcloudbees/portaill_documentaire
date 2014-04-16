package responsableServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import responsableDAO.gerer_utilisateur;
import responsableDAO.gerer_xml;
import connexion.authentification;
import entities.utilisateur_entities;
import entities.xml;

/**
 * Servlet implementation class list_xml_up
 */
@WebServlet("/list_xml_up")
public class list_xml_up extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_xml_up() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gerer_xml gx = new gerer_xml();
		List l = new ArrayList<xml>();
		String email="";
		if (authentification.c.equals("responsable")){
			email=authentification.email;
		}else{
			email=gx.getEmail_client(authentification.email);
		}
		
		l= gx.ListXml(email);
		System.out.println(l.size());
		request.setAttribute("list_de_xml", l);
		
		if (authentification.c.equals("responsable")){
			this.getServletContext().getRequestDispatcher("/WEB-INF/client_cons_up.jsp").forward(request, response);
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/user_cons_upload.jsp").forward(request, response);
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
