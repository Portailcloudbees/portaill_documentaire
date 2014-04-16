package AdminServlet;

import historiqueDAO.gererHistorique;

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

import connexion.authentification;
import adminDAO.gerer_Client_societe;
import entities.client;
import entities.societe;

/**
 * Servlet implementation class insert_affiche_soc
 */
@WebServlet("/insert_affiche_soc")
public class ajout_modif_soc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajout_modif_soc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			societe so = new societe();
			
			String ligneJson = request.getParameter("soc");
			ligneJson=ligneJson.substring(1, ligneJson.length()-1);
			JSONObject ligne = new JSONObject(ligneJson);
			
			so.setMat_société(ligne.getString("mat_soc"));
			so.setNom_société(ligne.getString("nom_soc"));
			so.setAdress_société(ligne.getString("adres_soc"));
			so.setTel_soc(ligne.getString("tel_soc"));
            
			
			gerer_Client_societe gc = new gerer_Client_societe();
			
			if (gc.ajouterSoc(so)){
				System.out.println("operation dajout");
				gererHistorique gh = new gererHistorique();
				gh.Task("à ajouter une societe", request.getRemoteAddr(), "administrateur", authentification.email);
				
			}else{
				gc.updateSoc(so);
				System.out.println("operation de modification");
				gererHistorique gh = new gererHistorique();
				gh.Task("à mis à jours une societe", request.getRemoteAddr(), "administrateur", authentification.email);
				
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
