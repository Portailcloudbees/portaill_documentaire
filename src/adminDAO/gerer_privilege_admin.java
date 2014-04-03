
package adminDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.administrateur;
import entities.privilege_admin;

public class gerer_privilege_admin {

	public gerer_privilege_admin(){
		
	}
	
	public void resetPriv(String email){
		
		String req ="insert into privilege_admin(add_client,delete_client,view_client,update_client,view_notif,answer_notif,export,view_stat,view_historic,email_admin) values (?,?,?,?,?,?,?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         
         ps.setBoolean(1,false);
         ps.setBoolean(2,false);
         ps.setBoolean(3,false);
         ps.setBoolean(4,false);
         ps.setBoolean(5,false);
         ps.setBoolean(6,false);
         ps.setBoolean(7,false);
         ps.setBoolean(8,false);
         ps.setBoolean(9,false);
         ps.setString(10,email);
         ps.executeUpdate();
         System.out.println("privilege admin initialisé avec succès");
        
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'initialisation de privilege admin"+ex.getMessage());
         
     }
	}
	
	public void updatePriv(privilege_admin pa,String email){
		
		String requete = "update privilege_admin set add_client=?,"
				+ " delete_client=?,"
				+ " view_client=?,"
				+ " update_client=?,"
				+ " view_notif=?,"
				+ " answer_notif=?,"
				+ " export=?,"
				+ " view_stat=?,"
				+ " view_historic=? where email_admin='"+email+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setBoolean(1,pa.isAddClient());
            ps.setBoolean(2,pa.isDeleteClient());
            ps.setBoolean(3,pa.isViewClient());
            ps.setBoolean(4,pa.isUpdateClient());
            ps.setBoolean(5,pa.isViewNotif());
            ps.setBoolean(6,pa.isAnswerNotif());
            ps.setBoolean(7,pa.isExport());
            ps.setBoolean(8,pa.isViewStat());
            ps.setBoolean(9,pa.isViewHistoric());
            
            ps.executeUpdate();
            System.out.println("Mise à jour privilege admin effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la mise à jour privilege admin "+ex.getMessage());
        }
	}
	
	public void deletePriv(String email){
		String requete = "delete from privilege_admin where email_admin=?";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, email);
            ps.executeUpdate();
            System.out.println("Suppression privilege admin effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la suppression privilege admin "+ex.getMessage());
        }
	}
	
	public List<privilege_admin>ListPrivilege(String email){
		
		List<privilege_admin> listepriv = new ArrayList<privilege_admin>();

		String req="Select * from privilege_admin where email_admin='"+email+"'";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	privilege_admin pa = new privilege_admin();
            	pa.setAddClient(resultat.getBoolean(2));
            	pa.setDeleteClient(resultat.getBoolean(3));
            	pa.setViewClient(resultat.getBoolean(4));
            	pa.setUpdateClient(resultat.getBoolean(5));
            	pa.setViewNotif(resultat.getBoolean(6));
            	pa.setAnswerNotif(resultat.getBoolean(7));
            	pa.setExport(resultat.getBoolean(8));
            	pa.setViewStat(resultat.getBoolean(9));
            	pa.setViewHistoric(resultat.getBoolean(10));
            	     
            	listepriv.add(pa);
            }
            return  listepriv;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des privilege admin "+ex.getMessage());
            return null;
        }
	}
	
	
}
