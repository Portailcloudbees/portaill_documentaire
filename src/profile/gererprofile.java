package profile;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.sql.Statement;

import connexion.ConnectionBD;
import entities.utilisateur_entities;

public class gererprofile {
	
	public gererprofile(){
		
	}
	
	public void updateInfo(String type,String nom,String prenom,String tel,String email){
		String req;
		if (type.equals("super")){
			req="update superadministrateur set nom_sup='"+nom+"',prenom_sup='"+prenom+"',num_tel='"+tel+"' where email_sup='"+email+"'";
		}else if (type.equals("admin")){
			req="update admin set nom_admin='"+nom+"',prenom_admin='"+prenom+"',num_tel='"+tel+"' where email_admin='"+email+"'";
		}else if (type.equals("responsable")){
			req="update client_soc set nom_resp='"+nom+"',prenom_resp='"+prenom+"',num_tel='"+tel+"' where email_resp='"+email+"'";
		}else{
			req="update utilisateur set nom_ut='"+nom+"',prenom_ut='"+prenom+"',num_tel='"+tel+"' where email_ut='"+email+"'";
		}
		  try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
           
            ps.executeUpdate();
            System.out.println("Mise à jour info effectuée avec succès");
        } catch (SQLException ex) {
           System.out.println("erreur lors de la mise à jour info "+ex.getMessage());
        }
		
	}
	
	public String updatePass(String type,String current,String newp, String email){
		String req;
		if (type.equals("super")){
		
			req="update superadministrateur set mot_pass_sup='"+newp+"' where email_sup='"+email+"' and mot_pass_sup='"+current+"'";
		}else if (type.equals("admin")){
			
			req="update admin set pass_admin='"+newp+"' where email_admin='"+email+"' and pass_admin='"+current+"'";
		}else if (type.equals("responsable")){
		
			req="update client_soc set pass_resp='"+newp+"' where email_resp='"+email+"' and pass_resp='"+current+"'";
		}else{
			
			req="update utilisateur set pass_ut='"+newp+"' where email_ut='"+email+"' and pass_ut='"+current+"'";
		}
		  try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
           
            int rows = ps.executeUpdate();
            if (rows==0){
            	return ("check your current password");
            }else{
            	return("Update completed successfully");
            }
            
        } catch (SQLException ex) {
           System.out.println("erreur lors de la mise à jour info "+ex.getMessage());
           return null;
        }
	}
	
	
	public String[] getInfo(String email,String type){
		String req="";
		int i=0;
		if (type.equals("super")){
			req="Select * from superadministrateur where email_sup='"+email+"'";
			i=6;
		}else if (type.equals("admin")){
			req="Select * from admin where email_admin='"+email+"'";
			i=5;
		}else if (type.equals("responsable")){
			req="Select * from client_soc where email_resp='"+email+"'";
			i=7;
		}else if (type.equals("utilisateur")){
			req="Select * from utilisateur where email_ut='"+email+"'";
			i=7;
		}
		
         String nom="";
         String prenom="";
         String tel="";
         try {
             Statement statement = ConnectionBD.getInstance()
                     .createStatement();
              ResultSet resultat = statement.executeQuery(req);
              while(resultat.next()){
              	nom=resultat.getString(2);
              	prenom=resultat.getString(3);
              	tel=resultat.getString(i);
              } 
          System.out.println(nom+"--"+prenom+"--"+tel);
              return  new String[] {nom,prenom,tel};
          } catch (SQLException ex) {
             
              System.out.println("erreur recperation info "+ex.getMessage());
              return null;
          }
         
		
		
	}
	
	
	
	public String updatePrice(double price){
		
			String req="update statistique set price='"+price+"'";
		
			try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
           
             ps.executeUpdate();
            
            	return("Update completed successfully");
            
            
        } catch (SQLException ex) {
           System.out.println("erreur lors de la mise à jour price "+ex.getMessage());
           return null;
        }
	}
	

}
