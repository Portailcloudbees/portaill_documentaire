package adminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.administrateur;
import entities.client;

public class gerer_admin {

	public gerer_admin(){
		
	}
	
	public boolean ajouterAdmin(administrateur ad){
		String req ="insert into admin values (?,?,?,?)";
		 gerer_privilege_admin ga = new gerer_privilege_admin();
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,ad.getEmail_admin());
         ps.setString(2,ad.getNom_admin());
         ps.setString(3,ad.getPrenom_admin());
         ps.setString(4,ad.getMot_de_passe());
         ps.executeUpdate();
         ga.resetPriv(ad.getEmail_admin());
         System.out.println("Ajout admin effectuée avec succès");
         return true;
     } catch (SQLException ex) {
        //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
         System.out.println("erreur lors de l'insertion admin"+ex.getMessage());
         return false;
     }
	}
	
	public void updateAdmin(administrateur ad){
		String mail =ad.getEmail_admin();
		String requete = "update admin set email_admin=?,nom_admin=?, prenom_admin=?, pass_admin=? where email_admin='"+mail+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1,ad.getEmail_admin());
            ps.setString(2,ad.getNom_admin());
            ps.setString(3,ad.getPrenom_admin());
            ps.setString(4,ad.getMot_de_passe());
            ps.executeUpdate();
            System.out.println("Mise à jour admin effectuée avec succès");
        } catch (SQLException ex) {
           //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erreur lors de la mise à jour admin "+ex.getMessage());
        }
	}
	
	public void deleteAdmin(String mail){
		String requete = "delete from admin where email_admin=?";
        gerer_privilege_admin ga = new gerer_privilege_admin();
		try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, mail);
            ga.deletePriv(mail);
            ps.executeUpdate();
            
            System.out.println("Suppression admin effectuée avec succès");
        } catch (SQLException ex) {
           //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erreur lors de la suppression admin "+ex.getMessage());
        }
		
	}
	
public List<administrateur> ListAdmin(){
		
		List<administrateur> listeadmin = new ArrayList<administrateur>();

		String req="Select * from admin";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	administrateur ad = new administrateur();
            	ad.setEmail_admin(resultat.getString(1));
            	ad.setNom_admin(resultat.getString(2));
            	ad.setPrenom_admin(resultat.getString(3));
            	ad.setMot_de_passe(resultat.getString(4));
            	     
                listeadmin.add(ad);
            }
            return  listeadmin;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des admins "+ex.getMessage());
            return null;
        }
		
	}
	
}
