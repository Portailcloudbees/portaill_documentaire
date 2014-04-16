package AdminServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import connexion.authentification;
import entities.client;
import entities.societe;
import adminDAO.gerer_Client_societe;

/**
 * Servlet implementation class listclients
 */
@WebServlet("/listclients")
public class list_ajout_update_client extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_ajout_update_client() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String connected = authentification.c;
		gerer_Client_societe gc = new gerer_Client_societe();
		List l = new ArrayList<client>();
		l= gc.ListClient();
		
		List s = new ArrayList<societe>();
		s= gc.ListSoc();
		request.setAttribute("list_de_client", l);
		request.setAttribute("list_de_soc", s);
		System.out.println(connected);
		if (connected==null){
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}else
		if (connected.equals("super")){
			this.getServletContext().getRequestDispatcher("/WEB-INF/super_admin_table_clients.jsp").forward(request, response);
		}else{
			gererHistorique gh = new gererHistorique();
			gh.Task("à consulter la table des clients", request.getRemoteAddr(), "administrateur", authentification.email);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/admin_table_clients.jsp").forward(request, response);
		}
		
	}
	
	public Date formatdate(String d){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String string = d;
		//Date date;
		try {
			
			//date = formatter.parse(string);
			
			java.sql.Date date = new java.sql.Date(formatter.parse(string).getTime());
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			client cl= new client();
			
			String ligneJson = request.getParameter("ligne");
			ligneJson=ligneJson.substring(1, ligneJson.length()-1);
			JSONObject ligne = new JSONObject(ligneJson);
			
			String string = ligne.getString("fullname");
            if (string.contains(" ")){
            	String[] parts = string.split(" ");
            	cl.setNom_resp(parts[0]);
				cl.setPrenom_resp(parts[1]);
            }else{
            	cl.setNom_resp(string);
				cl.setPrenom_resp(" ");
            }
			
            cl.setMatricule_soc((String) ligne.getString("company"));
			cl.setEmail_resp((String) ligne.getString("login"));
			cl.setMot_de_pass_resp((String) ligne.getString("motdepasse"));
			Date d = formatdate(ligne.getString("dateadded"));
			
			cl.setDate_ajout_resp(d);
			
			
			
			gerer_Client_societe gc = new gerer_Client_societe();
			if (gc.ajouterClient(cl)){
				gererHistorique gh = new gererHistorique();
				gh.Task("à ajouter un client", request.getRemoteAddr(), "administrateur", authentification.email);
				
				
			}else{
				gc.updateClient(cl);
				gererHistorique gh = new gererHistorique();
				gh.Task("à mis à jours un client", request.getRemoteAddr(), "administrateur", authentification.email);
				
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
