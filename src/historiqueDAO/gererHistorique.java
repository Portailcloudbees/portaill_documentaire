package historiqueDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.historique;
import entities.xml;
import responsableDAO.gerer_xml;

public class gererHistorique {

	

	public gererHistorique(){
		
	}
	
	public void Task(String tache, String ip,String type, String email){
		String emailuser="";
		String valeur[];
		
		historique h = new historique();
		gerer_xml gx = new gerer_xml();
		if (type.equals("utilisateur")){
			emailuser=gx.getEmail_client(email);
			System.out.println("iciii");
			
		}
		if (emailuser.length()>2){
			
			valeur = getNomPrenomUt(email);
			h.setType("utilisateur");
			h.setEmail(email);
			h.setIpAdresse(ip);
			h.setNom(valeur[0]);
			h.setPrenom(valeur[1]);
			h.setEmail_resp(emailuser);
			h.setTache(tache);
		}else if (type.equals("responsable")){
			valeur= getNomPrenomResp(email);
			h.setType("responsable");
			h.setEmail(email);
			h.setIpAdresse(ip);
			h.setNom(valeur[0]);
			h.setPrenom(valeur[1]);
			h.setTache(tache);
		}else if (type.equals("administrateur")){
			valeur= getNomPrenomAdmin(email);
			h.setType("administrateur");
			h.setEmail(email);
			h.setIpAdresse(ip);
			h.setNom(valeur[0]);
			h.setPrenom(valeur[1]);
			h.setTache(tache);
		}
		System.out.println("11"+h.getNom()+"--"+h.getPrenom());
		addTask(h);
	}
	
	public void addTask(historique h){
		String req="insert into historique (nom,prenom,ip,tache,email,type,email_resp) values (?,?,?,?,?,?,?)";
		 try { 
	         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
	         
	         ps.setString(1,h.getNom());
	         ps.setString(2,h.getPrenom());
	         ps.setString(3, h.getIpAdresse());
	         ps.setString(4,h.getTache());
	         ps.setString(5,h.getEmail());
	         ps.setString(6,h.getType());
	         ps.setString(7, h.getEmail_resp());
	         ps.executeUpdate();
	         System.out.println(" ajout de historique est terminé avec succes");
	        
	     } catch (SQLException ex) {
	        
	         System.out.println("erreur lors de l'ajout du historique "+ex.getMessage());
	         
	     }
	}
	
	public String[] getNomPrenomUt(String email){
		String req="select * from utilisateur where email_ut='"+email+"'";
		
		String nom="";
		String prenom="";
		try {
	           Statement statement = ConnectionBD.getInstance()
	                   .createStatement();
	            ResultSet resultat = statement.executeQuery(req);

	            while(resultat.next()){
	            	nom=resultat.getString(2);
	            	System.out.println("ici"+nom);
	            	prenom=resultat.getString(3);
	            
	            }
	            return  new String[]{nom,prenom};
	        } catch (SQLException ex) {
	           
	            System.out.println("erreur nom prenom utilisateur "+ex.getMessage());
	            return null;
	        }
		
	}
	
	public String[] getNomPrenomResp(String email){
		String req="select * from client_soc where email_resp='"+email+"'";
		String[] valeur = null;
		String nom="";
		String prenom="";
		try {
	           Statement statement = ConnectionBD.getInstance()
	                   .createStatement();
	            ResultSet resultat = statement.executeQuery(req);

	            while(resultat.next()){
	            	nom=resultat.getString(2);
	            	prenom=resultat.getString(3);
	            
	            }
	            return  new String[]{nom,prenom};
	        } catch (SQLException ex) {
	           
	            System.out.println("erreur nom prenom responsable "+ex.getMessage());
	            return null;
	        }
		
	}
	
	public String[] getNomPrenomAdmin(String email){
		System.out.println(email);
		String req="select * from admin where email_admin='"+email+"'";
		
		String nom="";
		String prenom="";
		try {
	           Statement statement = ConnectionBD.getInstance()
	                   .createStatement();
	            ResultSet resultat = statement.executeQuery(req);

	            while(resultat.next()){
	            	nom=resultat.getString(2);
	            	prenom=resultat.getString(3);
	            
	            }
	            
	            return  new String[]{nom,prenom};
	        } catch (SQLException ex) {
	           
	            System.out.println("erreur nom prenom administrateur "+ex.getMessage());
	            return null;
	        }
		
	}
	
public List<historique> Listhistorique(String type,String email){
		String req=null;
		List<historique> Listhistorique = new ArrayList<historique>();
		if (email.length()>2){
			req="Select * from historique where type='"+type+"' and email_resp='"+email+"'";
		}else{
			req="Select * from historique where type='"+type+"'";
	        
		}
		try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	historique h = new historique();
            	h.setId(resultat.getInt(1));
            	h.setNom(resultat.getString(2));
            	h.setPrenom(resultat.getString(3));
            	h.setTache(resultat.getString(6));
            	h.setIpAdresse(resultat.getString(4));
            	h.setEmail(resultat.getString(7));
            	h.setType(resultat.getString(8));
            	h.setDate(resultat.getDate(5));
            	Listhistorique.add(h);
            }
            return  Listhistorique;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list historique "+ex.getMessage());
            return null;
        }
		
	} 
	
public historique getLast(String type){
	
	

	String req="Select * from historique where type='"+type+"' and id=(select max(id) from historique)";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

     
        	historique h = new historique();
        	h.setNom(resultat.getString(2));
        	h.setPrenom(resultat.getString(3));
        	h.setTache(resultat.getString(6));
        	h.setIpAdresse(resultat.getString(4));
        	h.setEmail(resultat.getString(7));
        	h.setType(resultat.getString(8));
        	h.setDate(resultat.getDate(5));
        
        return  h;
    } catch (SQLException ex) {
       
        System.out.println("erreur recperation last historique "+ex.getMessage());
        return null;
    }
	
} 

public void deleteHistorique(int id){
	String req="delete from historique where id="+id+"";
	try {
        PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
        ps.executeUpdate();
        System.out.println("Suppression historique effectuée avec succès");
    } catch (SQLException ex) {
       
        System.out.println("erreur lors de la suppression du historique "+ex.getMessage());
    }
}
	
	
}
