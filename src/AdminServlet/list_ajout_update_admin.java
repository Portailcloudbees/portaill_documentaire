package AdminServlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import adminDAO.gerer_Client_societe;
import adminDAO.gerer_admin;
import entities.administrateur;
import entities.client;
import entities.societe;

/**
 * Servlet implementation class list_ajout_update_admin
 */
@WebServlet("/list_ajout_update_admin")
public class list_ajout_update_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_ajout_update_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		gerer_admin ga = new gerer_admin();
		
		List l = new ArrayList<administrateur>();
		
		l= ga.ListAdmin();
		
		request.setAttribute("list_de_admin", l);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/super_admin_table_admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			administrateur ad= new administrateur();
			
			String ligneJson = request.getParameter("ligne");
			ligneJson=ligneJson.substring(1, ligneJson.length()-1);
			JSONObject ligne = new JSONObject(ligneJson);
			
			String string = ligne.getString("Email");
            ad.setEmail_admin(string);
            ad.setNom_admin((String) ligne.getString("Nom"));
			ad.setPrenom_admin((String) ligne.getString("Prenom"));
			ad.setMot_de_passe((String) ligne.getString("motdepasse"));
			
			gerer_admin ga = new gerer_admin();
			if (ga.ajouterAdmin(ad)){
				
			}else{
				ga.updateAdmin(ad);
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
