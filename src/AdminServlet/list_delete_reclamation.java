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
import adminDAO.gerer_Client_societe;
import adminDAO.gerer_admin;
import adminDAO.gerer_reclamation;
import entities.administrateur;
import entities.reclamation;
import entities.reclamation_rep;

/**
 * Servlet implementation class list_delete_reclamation
 */
@WebServlet("/list_delete_reclamation")
public class list_delete_reclamation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_delete_reclamation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=authentification.c;
		gerer_reclamation gr = new gerer_reclamation();
		List l = new ArrayList<reclamation>();
		List l1 = new ArrayList<reclamation_rep>();
		l1=gr.ListRep();
		l= gr.ListReclamation();
		
		request.setAttribute("list_de_rep", l1);
		request.setAttribute("list_de_rec", l);
		if (type.equals("super")){
			this.getServletContext().getRequestDispatcher("/WEB-INF/super_admin_table_notifications.jsp").forward(request, response);
				
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/admin_table_notifications.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id_rec")==null){
			doGet(request, response);
		}else{
			
		
		String id =request.getParameter("id_rec");
		System.out.println(id);
		int id_rec=Integer.parseInt(id);
		gerer_reclamation gr = new gerer_reclamation();
		gr.deleteRec(id_rec);
		
	}
	}
}
