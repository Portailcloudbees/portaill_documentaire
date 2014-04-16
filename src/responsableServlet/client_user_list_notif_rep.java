package responsableServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminDAO.gerer_reclamation;
import connexion.authentification;
import entities.reclamation;
import entities.reclamation_rep;

/**
 * Servlet implementation class client_user_list_notif_rep
 */
@WebServlet("/client_user_list_notif_rep")
public class client_user_list_notif_rep extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public client_user_list_notif_rep() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=authentification.c;
		String mat="";
		gerer_reclamation gr = new gerer_reclamation();
		if (type.equals("responsable")){
			mat=gr.getCompany("select * from client_soc where email_resp='"+authentification.email+"'");
		}else{
			mat=gr.getCompany("Select c.mat_soc from utilisateur u,client_soc c where u.email_ut='"+authentification.email+"' AND u.`email_resp` = c.`email_resp` ");
			System.out.println("-"+mat);
		}
		
		List l = new ArrayList<reclamation>();
		List l1 = new ArrayList<reclamation_rep>();
		l1=gr.ListRep();
		l= gr.ListReclamationClient(mat);
		
		request.setAttribute("list_de_rep", l1);
		request.setAttribute("list_de_rec", l);
		
		if (authentification.c.equals("responsable")){
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/client_list_notif.jsp").forward(request, response);
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/user_list_notif.jsp").forward(request, response);
		}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
