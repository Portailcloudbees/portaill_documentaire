package statistiqueDAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.statistique;

public class gererstatistique {

	

	public gererstatistique(){
		
	}



public List<statistique> Doc_Traite(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="SELECT count(`id_doc`),date(`date_ajout_doc`) FROM `xml_doc` group by date(`date_ajout_doc`)";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_doc_traité(resultat.getInt(1));
        	 s.setDate_doc(resultat.getDate(2));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}

public List<statistique> notif_traite(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="SELECT count(`id_rec`),date(`date`) FROM `reclamation` where `traiter`=true group by date(`date`)";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_notif_traite(resultat.getInt(1));
        	 s.setDate_notif(resultat.getDate(2));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}


public List<statistique> doc_size(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="select date(`date_ajout_doc`),sum(`taille_doc`) from xml_doc group by month(`date_ajout_doc`)";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setSize_doc(resultat.getInt(2));
        	 s.setDate_size(resultat.getDate(1));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}

public List<statistique> docs_price(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="SELECT DATE(  `date_ajout_doc` ) , SUM(  `taille_doc` ) * p.price FROM xml_doc, statistique p GROUP BY MONTH(  `date_ajout_doc` )";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setPrice_oct(resultat.getInt(2));
        	 s.setDate_price(resultat.getDate(1));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}

public List<statistique> users_count(){
	
	String req="select (select count(*) from admin),(select count(*) from client_soc),(select count(*) from utilisateur )";
	List<statistique> list = new ArrayList<statistique>();
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);
        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_admin(resultat.getInt(1));
        	s.setNbr_client(resultat.getInt(2));
        	s.setNbr_utilisateur(resultat.getInt(3));    
            list.add(s);
           
        }
        return  list;
    } catch (SQLException ex) {
       System.out.print("ooooo");
        return null;
    }
	
}

public List<statistique> client_stat(String email){
	
	String req="SELECT count(*),`type_doc`,date(`date_ajout_doc`) FROM `xml_doc` where `email_client`='"+email+"' group by `type_doc`";
	List<statistique> list = new ArrayList<statistique>();
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);
        
        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_doc_traite_client(resultat.getInt(1));
        	s.setType_doc(resultat.getString(2));
        	s.setDate_doc_client(resultat.getDate(3));    
            list.add(s);
           System.out.println("----"+resultat.getInt(1));
        }
        return  list;
    } catch (SQLException ex) {
       System.out.print("probleme avec stat client"+ex);
        return null;
    }
	
}


}