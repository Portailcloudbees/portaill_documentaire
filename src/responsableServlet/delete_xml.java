package responsableServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connexion.authentification;
import responsableDAO.gerer_xml;

/**
 * Servlet implementation class delete_xml
 */
@WebServlet("/delete_xml")
public class delete_xml extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_xml() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path= request.getParameter("path");
		gerer_xml gx = new gerer_xml();
		gx.deletefile(path);
		if (authentification.c.equals("responsable")){
			gererHistorique gh = new gererHistorique();
			gh.Task("à supprimer un document xml", request.getRemoteAddr(), "responsable", authentification.email);
			
		}else if (authentification.c.equals("utilisateur")){
			gererHistorique gh = new gererHistorique();
			gh.Task("à supprimer un document xml", request.getRemoteAddr(), "utilisateur", authentification.email);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
