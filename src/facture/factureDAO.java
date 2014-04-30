package facture;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connexion.ConnectionBD;
import entities.client;
import entities.facture;
import entities.reclamation;

public class factureDAO {
	
	public factureDAO(){
		
	}
	
	public void addFacture(facture f){
		String req ="insert into facture(date_start,date_end,societe,email_client) values (?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setDate(1,f.getDate_start());
         ps.setDate(2,f.getDate_end());
         ps.setString(3, f.getSociete());
         ps.setString(4, f.getEmail_client());
       
         
         ps.executeUpdate();
         System.out.println("Ajout facture effectuée avec succès");
         
     } catch (SQLException ex) {
        
         System.out.println("erreur lors de l'insertion facture"+ex.getMessage());
         
     }
	}
	
public List<facture> Listfacture_super(String email){
		
		List<facture> fact = new ArrayList<facture>();
		String req="";
		if (email!=null){
			req="select * from facture where email_client='"+email+"'";
		}else{
			req="Select * from facture";
		}
		
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
            	facture f= new facture();
            	f.setId(resultat.getInt(1));
            	f.setDate(resultat.getDate(2));
            	f.setDate_start(resultat.getDate(3));
            	f.setDate_end(resultat.getDate(4));
            	f.setSociete(resultat.getString(5));
            	f.setEmail_client(resultat.getString(6));
            	     
            	fact.add(f);
            }
            return  fact;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des facture pour super admin "+ex.getMessage());
            return null;
        }
}

public List<facture> getFactureInfo(String email,Date date_start,Date date_end){
	
	List<facture> fact = new ArrayList<facture>();
	
	String req="SELECT count(*),`type_doc`,sum(`taille_doc`) FROM `xml_doc` WHERE `email_client`='"+email+"' and (`date_ajout_doc` BETWEEN '"+date_start+"' AND '"+date_end+"') group by `type_doc`";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	facture f= new facture();
        	f.setQuantite(resultat.getInt(1));
        	f.setType(resultat.getString(2));
        	f.setSize(resultat.getInt(3));      	     
        	fact.add(f);
        }
        return  fact;
    } catch (SQLException ex) {
       
        System.out.println("erreur recperation info facture "+ex.getMessage());
        return null;
    }
}
	


public List<client> getInfoClient(String email){
List<client> cl = new ArrayList<client>();
	
	String req="SELECT * FROM `client_soc` WHERE `email_resp`='"+email+"'";
    try {
       Statement statement = ConnectionBD.getInstance()
               .createStatement();
        ResultSet resultat = statement.executeQuery(req);

        while(resultat.next()){
        	client c= new client();
        	System.out.println("**"+resultat.getString(1));
        	c.setEmail_resp(resultat.getString(1));
        	c.setMatricule_soc(resultat.getString(6));
        	c.setNom_resp(resultat.getString(2));
        	c.setPrenom_resp(resultat.getString(3));
        	c.setNumtel(resultat.getString(7));
        
        	cl.add(c);
       
        }
        return  cl;
    } catch (SQLException ex) {
       
        System.out.println("erreur recperation info client "+ex.getMessage());
        return null;
    }
}

}
