package adminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.administrateur;
import entities.reclamation;
import entities.reclamation_rep;


public class gerer_reclamation {

	public gerer_reclamation(){
		
	}
	
	public String getCompanyName(String email,String type){
		String req="";
		String nom_soc="";
		if (type.equals("responsable")){
			req="SELECT s.`nom_soc` from societe s,client_soc c where s.`mat_soc`=c.`mat_soc` and c.email_resp='"+email+"'";
		}else{
			req="SELECT s.`nom_soc` from societe s,client_soc c, utilisateur u where s.`mat_soc`=c.`mat_soc` and c.email_resp=u.email_resp and u.email_ut='"+email+"'";
		}
		
		 try {
	           Statement statement = ConnectionBD.getInstance()
	                   .createStatement();
	            ResultSet resultat = statement.executeQuery(req);

	            while(resultat.next()){
	            	nom_soc=resultat.getString("nom_soc");
	            	
	            }
	            return  nom_soc;
	        } catch (SQLException ex) {
	           
	            System.out.println("erreur recperation nom du societe "+ex.getMessage());
	            return null;
	        }
	}
	
	public String getCompany(String req){
		String mat_soc="";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	mat_soc=resultat.getString("mat_soc");
            	
            }
            return  mat_soc;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des reclamation "+ex.getMessage());
            return null;
        }
	
	}
	
	public boolean ajouterRec(reclamation rec){
		String req ="insert into reclamation(objet_rec,sujet_rec,traiter,email_sender,mat_soc) values (?,?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,rec.getObjet_rec());
         ps.setString(2,rec.getSujet_rec());
         ps.setBoolean(3,rec.isTraiter());
         ps.setString(4,rec.getEmail_sender());
         ps.setString(5, rec.getCompany());
         ps.executeUpdate();
         System.out.println("Ajout reclamation effectuée avec succès");
         return true;
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'insertion reclamation"+ex.getMessage());
         return false;
     }
	}
	
	public boolean ajouterRep(reclamation_rep rep){
		
		String req ="insert into reclamation_rep(email_rep,date_rep,nom_prenom_rep,contenue_rep,id_rec) values (?,?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,rep.getEmail_rep());
         ps.setDate(2,rep.getDate_rep());
         ps.setString(3,rep.getNom_prenom_rep());
         ps.setString(4,rep.getContenue_rep());
         ps.setInt(5,rep.getId_rec());
         ps.executeUpdate();
         System.out.println("Ajout reponse effectuée avec succès");
         updateRec(rep.getId_rec());
         return true;
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'insertion reponse"+ex.getMessage());
         return false;
     }
	}
	
	
	
	public void updateRec(int id){
		
		String requete = "update reclamation set traiter=1 where id_rec='"+id+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            
            ps.executeUpdate();
            System.out.println("Mise à jour reclamation effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la mise à jour reclamation "+ex.getMessage());
        }
	}
	
	public void deleteRec(int id){
		String requete = "delete from reclamation where id_rec=?";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setInt(1, id);
            ps.executeUpdate();
            System.out.println("Suppression reclamation effectuée avec succès");
        } catch (SQLException ex) {
           
            System.out.println("erreur lors de la suppression reclamation "+ex.getMessage());
        }
		
	}
	
public List<reclamation> ListReclamation(){
		
		List<reclamation> listeRec = new ArrayList<reclamation>();
		String comp="";
		String req="Select * from reclamation";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	reclamation rec= new reclamation();
            	rec.setId_rec(resultat.getInt(1));
            	rec.setObjet_rec(resultat.getString(2));
            	rec.setSujet_rec(resultat.getString(3));
            	rec.setDate(resultat.getDate(4));
            	rec.setTraiter(resultat.getBoolean(5));
            	rec.setEmail_sender(resultat.getString(6));
            	String req1="Select * from utilisateur where email_ut='"+resultat.getString(6)+"'";
        		String req2="Select * from client_soc where email_resp='"+resultat.getString(6)+"'";
            	if (getCompany(req1)==null){
            		comp=getCompany(req1);
            		System.out.println("req1");
            	}else{
            		comp=getCompany(req2);
            		System.out.println("req2");
            	}
            	rec.setCompany(comp);     
            	listeRec.add(rec);
            }
            return  listeRec;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des reclamation "+ex.getMessage());
            return null;
        }
}    


public List<reclamation> ListReclamationClient(String mat){
	
	List<reclamation> listeRec = new ArrayList<reclamation>();
	String comp="";
	String req="Select * from reclamation where mat_soc='"+mat+"'";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	reclamation rec= new reclamation();
        	rec.setId_rec(resultat.getInt(1));
        	rec.setObjet_rec(resultat.getString(2));
        	rec.setSujet_rec(resultat.getString(3));
        	rec.setDate(resultat.getDate(4));
        	rec.setTraiter(resultat.getBoolean(5));
        	rec.setEmail_sender(resultat.getString(6));
        	String req1="Select c.mat_soc from utilisateur u,client_soc c where u.email_ut='"+resultat.getString(6)+"'";
    		String req2="Select * from client_soc where email_resp='"+resultat.getString(6)+"'";
        	if (getCompany(req1)==null){
        		comp=getCompany(req1);
        		System.out.println("req1");
        	}else{
        		comp=getCompany(req2);
        		System.out.println("req2");
        	}
        	rec.setCompany(comp);     
        	listeRec.add(rec);
        }
        return  listeRec;
    } catch (SQLException ex) {
       
        System.out.println("erreur recperation list des reclamation "+ex.getMessage());
        return null;
    }
} 

        
        public List<reclamation_rep> ListRep(){
    		
    		List<reclamation_rep> listeRep = new ArrayList<reclamation_rep>();
    		
    		String req="Select * from reclamation_rep";
            try {
               Statement statement = ConnectionBD.getInstance()
                       .createStatement();
                ResultSet resultat = statement.executeQuery(req);

                while(resultat.next()){
                	reclamation_rep rep= new reclamation_rep();
                	rep.setEmail_rep(resultat.getString(2));
                	rep.setDate_rep(resultat.getDate(3));
                	rep.setNom_prenom_rep(resultat.getString(4));
                	rep.setContenue_rep(resultat.getString(5));
                	rep.setId_rec(resultat.getInt(6));
                	listeRep.add(rep);
                }
                return  listeRep;
            } catch (SQLException ex) {
               
                System.out.println("erreur recperation list des reponses "+ex.getMessage());
                return null;
            }
        
        }
	
	
	
	
}
