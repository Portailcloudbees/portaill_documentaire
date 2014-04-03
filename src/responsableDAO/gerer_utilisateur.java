package responsableDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.utilisateur_entities;

public class gerer_utilisateur {
	public gerer_utilisateur() {
		
	}
	
	public boolean ajouterUtilisateur (utilisateur_entities ut){
		gerer_privilege_ut gp = new gerer_privilege_ut();
		
		String req ="insert into utilisateur values (?,?,?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,ut.getEmail_ut());
         ps.setString(2,ut.getNom_ut());
         ps.setString(3,ut.getPrenom_ut());
         ps.setDate(4,ut.getDate_ajout_ut());
         ps.setString(5,ut.getMot_de_passe_ut());
         ps.setString(6,ut.getEmail_resp());
         
         ps.executeUpdate();
         gp.resetPriv(ut.getEmail_ut());
         System.out.println("Ajout utilisateur effectuée avec succès");
         return true;
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'insertion utilisateur"+ex.getMessage());
         return false;
     }
	}
		
	public void updateUt(utilisateur_entities ut){
		String mail =ut.getEmail_ut();
		String requete = "update utilisateur set email_ut=?,nom_ut=?, prenom_ut=?, pass_ut=?, date_ajout_ut=?, email_resp=? where email_ut='"+mail+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1,ut.getEmail_ut());
            ps.setString(2,ut.getNom_ut());
            ps.setString(3,ut.getPrenom_ut());
            ps.setString(4,ut.getMot_de_passe_ut());
            ps.setDate(5,ut.getDate_ajout_ut());
            ps.setString(6,ut.getEmail_resp());
            ps.executeUpdate();
            System.out.println("Mise à jour utilisateur effectuée avec succès");
        } catch (SQLException ex) {
           System.out.println("erreur lors de la mise à jour utilisateur "+ex.getMessage());
        }
	}
	
	public void deleteUtilisateur(String mail){
		String requete = "delete from utilisateur where email_ut=?";
        
		gerer_privilege_ut gu = new gerer_privilege_ut();
		try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, mail);
            gu.deletePriv(mail);
            
            ps.executeUpdate();
            
            System.out.println("Suppression utilisateur effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la suppression utilisateur "+ex.getMessage());
        }
		
	}
	
public List<utilisateur_entities> ListUtilisateur(String email){
		
		List<utilisateur_entities> ListUtilisateur = new ArrayList<utilisateur_entities>();

		String req="Select * from utilisateur where email_resp='"+email+"'";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	utilisateur_entities ut = new utilisateur_entities();
            	ut.setEmail_ut(resultat.getString(1));
            	ut.setNom_ut(resultat.getString(2));
            	ut.setPrenom_ut(resultat.getString(3));
                ut.setMot_de_passe_ut(resultat.getString(5));
                ut.setDate_ajout_ut(resultat.getDate(4));
               
                ut.setEmail_resp(resultat.getString(6));
            	     
                ListUtilisateur.add(ut);
            }
            return  ListUtilisateur;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des utilisateurs "+ex.getMessage());
            return null;
        }
		
	}




}
