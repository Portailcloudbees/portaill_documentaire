package responsableDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.privilege_utilisateur;
import entities.utilisateur_entities;
import entities.xml;

public class gerer_xml {

	public gerer_xml(){
		
	}
	
	public String getEmail_client(String email_user){
		String req="select email_resp from utilisateur where email_ut='"+email_user+"'";
		String email="";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            
            	email=resultat.getString(1);
           }
            return  email;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation email responsable de l'utilisateur"+ex.getMessage());
            return null;
        }
		
	}
	
	public void addfile(xml x){
		String req="insert into xml_doc (nom_doc,path_doc,type_doc,taille_doc,email_user,email_client,etat_doc) values (?,?,?,?,?,?,?)";
		 try { 
	         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
	         
	         ps.setString(1,x.getNom_doc());
	         ps.setString(2,x.getPath_doc());
	         ps.setString(3, x.getType_doc());
	         ps.setLong(4,x.getTaille_doc());
	         ps.setString(5,x.getEmail_user());
	         ps.setString(6,x.getEmail_client());
	         ps.setString(7, x.getEtat_doc());
	         ps.executeUpdate();
	         System.out.println(" ajout de xml est terminé avec succes");
	        
	     } catch (SQLException ex) {
	        
	         System.out.println("erreur lors de l'ajout du xml "+ex.getMessage());
	         
	     }
	}
	
	public void deletefile(String path_doc){
		String req="delete from xml_doc where path_doc='"+path_doc+"'";
		System.out.println("path doc delete"+path_doc);
		try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
            ps.executeUpdate();
            System.out.println("Suppression xml effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la suppression du xml "+ex.getMessage());
        }
	}
	
	
public List<xml> ListXml(String email){
		
		List<xml> ListXml = new ArrayList<xml>();

		String req="Select * from xml_doc where email_client='"+email+"'";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	xml x = new xml();
            	x.setNom_doc(resultat.getString(2));
            	x.setPath_doc(resultat.getString(3));
            	x.setTaille_doc(resultat.getLong(5));
            	x.setType_doc(resultat.getString(4));
            	x.setDate_ajout(resultat.getDate(6));
            	x.setEmail_user(resultat.getString(7));
            	x.setEmail_client(resultat.getString(8));
            	x.setEtat_doc(resultat.getString(9));
            	ListXml.add(x);
            }
            return  ListXml;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des doc xml "+ex.getMessage());
            return null;
        }
		
	} 
	
	
}
