package responsableDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.privilege_admin;
import entities.privilege_utilisateur;

public class gerer_privilege_ut {

public gerer_privilege_ut(){
		
	}
	
	public void resetPriv(String email){
		String req ="insert into privilege_user(upload_file,delete_file,send_file,download_file,send_sms,send_email,"
				+ "answer_notif,view_stat,viewupload,viewhistorique,sendnotif,listnotif,export,email_ut)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
         ps.setBoolean(10,false);
         ps.setBoolean(11,false);
         ps.setBoolean(12,false);
         ps.setBoolean(13,false);
         ps.setString(14,email);
         ps.executeUpdate();
         System.out.println("privilege utilisateur initialisé avec succès");
        
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'initialisation de privilege utilisateur"+ex.getMessage());
         
     }
	}
	
	public void updatePriv(privilege_utilisateur pu,String email){
	
		String requete = "update privilege_user set upload_file=?,"
				+ " delete_file=?,"
				+ " send_file =?,"
				+ " download_file=?,"
				+ " send_Sms =?,"
				+ " send_Email =?,"
				+ " answer_notif=?,"
				+ " view_stat=?,"
				+"viewupload=?,"
				+"viewhistorique=?,"
				+"sendnotif=?,"
				+"listnotif=?,"
			
				+ "export=? where email_ut='"+email+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setBoolean(1,pu.isUploadFile());
            ps.setBoolean(2,pu.isDeleteFile());
            ps.setBoolean(3,pu.isSendFile());
            ps.setBoolean(4,pu.isDownloadFile());
            ps.setBoolean(5,pu.isSendSms());
            ps.setBoolean(6,pu.isSendEmail());
            ps.setBoolean(7,pu.isAnswerNotif());
            ps.setBoolean(8,pu.isViewStat());
            ps.setBoolean(9,pu.isViewUpload());
            ps.setBoolean(10, pu.isViewHistorique());
            ps.setBoolean(11, pu.isSendNotif());
            ps.setBoolean(12, pu.isListNotif());
            ps.setBoolean(13, pu.isExport());
            
            ps.executeUpdate();
            System.out.println("Mise à jour privilege utilisateur effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la mise à jour privilege utilisateur "+ex.getMessage());
        }
	}
	
	public void deletePriv(String email){
		String requete = "delete from privilege_user where email_ut=?";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, email);
            ps.executeUpdate();
            System.out.println("Suppression privilege utilisateur effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la suppression privilege utilisateur "+ex.getMessage());
        }
	}
	
	public List<privilege_utilisateur>ListPrivilege(String email){
		
		List<privilege_utilisateur> listepriv = new ArrayList<privilege_utilisateur>();

		String req="Select * from privilege_user where email_ut='"+email+"'";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){

            	privilege_utilisateur pu = new privilege_utilisateur();
            	pu.setUploadFile(resultat.getBoolean(2));
            	pu.setDeleteFile(resultat.getBoolean(3));
            	pu.setSendFile(resultat.getBoolean(4));
            	pu.setDownloadFile(resultat.getBoolean(5));
            	pu.setSendSms(resultat.getBoolean(6));
            	pu.setSendEmail(resultat.getBoolean(7));
            	pu.setAnswerNotif(resultat.getBoolean(8));
            	pu.setExport(resultat.getBoolean(14));
            	pu.setViewStat(resultat.getBoolean(9));
            	pu.setSendNotif(resultat.getBoolean(12));
            	pu.setViewHistorique(resultat.getBoolean(11));
            	pu.setViewUpload(resultat.getBoolean(10));
            	pu.setListNotif(resultat.getBoolean(13));
            	
            	     
            	listepriv.add(pu);
            }
            return  listepriv;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des privilege utilisateur"+ex.getMessage());
            return null;
        }
	}
	
	
}


