package responsableServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import connexion.authentification;
import adminDAO.gerer_Client_societe;
import responsableDAO.gerer_utilisateur;
import entities.client;
import entities.utilisateur_entities;
/**
	 * Servlet implementation class list_ajout_update_ut
	 */
	@WebServlet("/list_ajout_update_ut")
	public class list_ajout_update_ut extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public list_ajout_update_ut() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			gerer_utilisateur gu = new gerer_utilisateur();
			List l = new ArrayList<utilisateur_entities>();
			String email = authentification.email;
			l= gu.ListUtilisateur(email);
			System.out.println("--->"+l.size());
			request.setAttribute("list_de_utilisateur", l);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/table_user.jsp").forward(request, response);
		}
		public Date formatdate(String d){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String string = d;
			//Date date;
			try {
				
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
			
			try {
				
				utilisateur_entities ut = new utilisateur_entities();
				
				String ligneJson = request.getParameter("ligne");
				ligneJson=ligneJson.substring(1, ligneJson.length()-1);
				JSONObject ligne = new JSONObject(ligneJson);
				
				String string = ligne.getString("Email");
	            ut.setEmail_ut(string);
	            ut.setNom_ut((String) ligne.getString("Nom"));
				ut.setPrenom_ut((String) ligne.getString("Prenom"));
				ut.setMot_de_passe_ut((String) ligne.getString("motdepasse"));
				Date d = formatdate(ligne.getString("Date"));
				ut.setDate_ajout_ut(d);
				ut.setEmail_resp(authentification.email);
				
				gerer_utilisateur gu = new gerer_utilisateur();
				if (gu.ajouterUtilisateur(ut)){
					gererHistorique gh = new gererHistorique();
					gh.Task("à ajouter un utilisateur", request.getRemoteAddr(), "responsable", authentification.email);
					
				}else{
					gu.updateUt(ut);
					gererHistorique gh = new gererHistorique();
					gh.Task("à mis à jours un utilisateur", request.getRemoteAddr(), "responsable", authentification.email);
					
				}
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

	}
