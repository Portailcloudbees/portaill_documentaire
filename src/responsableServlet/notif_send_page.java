package responsableServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminDAO.gerer_reclamation;
import connexion.authentification;
import entities.reclamation;

/**
 * Servlet implementation class notif_send_page
 */
@WebServlet("/notif_send_page")
public class notif_send_page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public notif_send_page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gerer_reclamation gr = new gerer_reclamation();
		String email=authentification.email;
		String company= gr.getCompanyName(email, authentification.c);
		request.setAttribute("email", email);
		request.setAttribute("company", company);
		
		if (authentification.c.equals("responsable")){
			this.getServletContext().getRequestDispatcher("/WEB-INF/client_notification.jsp").forward(request, response);
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/user_notification.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req="";
		if (authentification.c.equals("responsable")){
			req="select * from societe s,client_soc c where s.mat_soc=c.mat_soc and c.email_resp='"+authentification.email+"'";
		}else{
			req="select * from societe s,utilisateur u,client_soc c where s.mat_soc=c.mat_soc and c.email_resp=u.email_resp and u.email_ut='"+authentification.email+"'";
		}
		gerer_reclamation gr = new gerer_reclamation();
		reclamation rec = new reclamation();
		rec.setCompany(gr.getCompany(req));
		rec.setEmail_sender(authentification.email);
		rec.setObjet_rec(request.getParameter("objet"));
		rec.setSujet_rec(request.getParameter("message"));
		rec.setTraiter(false);
		
		gr.ajouterRec(rec);
		
		
		if (authentification.c.equals("responsable")){
			gererHistorique gh = new gererHistorique();
			gh.Task("à envoyer une reclamation", request.getRemoteAddr(), "responsable", authentification.email);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/index_client.jsp").forward(request, response);
		}else{
			gererHistorique gh = new gererHistorique();
			gh.Task("à envoyer une reclamation", request.getRemoteAddr(), "utilisateur", authentification.email);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/index_user.jsp").forward(request, response);
		}
		
	}

}
