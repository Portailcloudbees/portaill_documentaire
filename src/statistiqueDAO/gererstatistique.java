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

public List<statistique> test(){
		
		List<statistique> list = new ArrayList<statistique>();

		String req="SELECT count(*),`date_ajout_resp` FROM `client_soc` group by `date_ajout_resp`";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	statistique s = new statistique();
            	s.setNbr_client(resultat.getInt(1));
            	 s.setDate(resultat.getDate(2));    
                list.add(s);
            }
            return  list;
        } catch (SQLException ex) {
           
            return null;
        }
		
	}

public List<statistique> Doc_Traite(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="SELECT count(*),`date_ajout_resp` FROM `client_soc` group by `date_ajout_resp`";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_client(resultat.getInt(1));
        	 s.setDate(resultat.getDate(2));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}

public List<statistique> doc_non_traite(){
	
	List<statistique> list = new ArrayList<statistique>();

	String req="SELECT count(*),`date_ajout_resp` FROM `client_soc` group by `date_ajout_resp`";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	statistique s = new statistique();
        	s.setNbr_client(resultat.getInt(1));
        	 s.setDate(resultat.getDate(2));    
            list.add(s);
        }
        return  list;
    } catch (SQLException ex) {
       
        return null;
    }
	
}



}