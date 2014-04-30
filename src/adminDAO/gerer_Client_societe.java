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
import entities.societe;

public class gerer_Client_societe {

	public gerer_Client_societe() {
	
	}
	
	public boolean ajouterClient(client cl){
		String req ="insert into client_soc values (?,?,?,?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,cl.getEmail_resp());
         ps.setString(2,cl.getNom_resp());
         ps.setString(3,cl.getPrenom_resp());
         ps.setDate(4,cl.getDate_ajout_resp());
         ps.setString(5,cl.getMot_de_pass_resp());
         ps.setString(6,cl.getMatricule_soc());
         ps.setString(7,cl.getNumtel());
         ps.executeUpdate();
         System.out.println("Ajout utilisateur effectuée avec succès");
         return true;
     } catch (SQLException ex) {
        //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
         System.out.println("erreur lors de l'insertion "+ex.getMessage());
         return false;
     }
	}
	
	public boolean ajouterSoc(societe so){
		String req ="insert into societe values (?,?,?,?)";
        try { 
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(req);
         ps.setString(1,so.getMat_société());
         ps.setString(2,so.getNom_société());
         ps.setString(3,so.getAdress_société());
         ps.setString(4,so.getTel_soc());
        
         ps.executeUpdate();
         System.out.println("Ajout effectuée societe avec succès");
         return true;
        } catch (SQLException ex) {
        //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
         System.out.println("erreur lors de l'insertion societe "+ex.getMessage());
         return false;
     }
	}
	
	public void updateClient(client cl){
		String mail =cl.getEmail_resp();
		String requete = "update client_soc set nom_resp=?,prenom_resp=?, date_ajout_resp=?, pass_resp=?, mat_soc=?, num_tel=? where email_resp='"+mail+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, cl.getNom_resp());
            
            ps.setString(2, cl.getPrenom_resp());
            ps.setDate(3, cl.getDate_ajout_resp());
            ps.setString(4, cl.getMot_de_pass_resp());
            ps.setString(5, cl.getMatricule_soc());
            ps.setString(6, cl.getNumtel());
            ps.executeUpdate();
            System.out.println("Mise à jour client effectuée avec succès");
        } catch (SQLException ex) {
           //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erreur lors de la mise à jour client "+ex.getMessage());
        }
	}
	
    public void updateSoc(societe so){
    	
    	
    	String requete = "update societe set nom_soc=?, adres_soc=?, tel_soc=? where mat_soc='"+so.getMat_société()+"'";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, so.getNom_société());
            ps.setString(2, so.getAdress_société());
            ps.setString(3, so.getTel_soc());
            ps.executeUpdate();
            System.out.println("Mise à jour effectuée avec succès");
        } catch (SQLException ex) {
           //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erreur lors de la mise à jour "+ex.getMessage());
        }
	}
	
	public void deleteClient(String mail){
		String requete = "delete from client_soc where email_resp=?";
        try {
            PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
            ps.setString(1, mail);
            ps.executeUpdate();
            System.out.println("Suppression client effectuée avec succès");
        } catch (SQLException ex) {
           //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erreur lors de la suppression client "+ex.getMessage());
        }
		
	}
	
public void deleteSoc(String mat){
	String requete = "delete from societe where mat_soc='"+mat+"'";
	 try {
         PreparedStatement ps = ConnectionBD.getInstance().prepareStatement(requete);
         ps.executeUpdate();
         System.out.println("Suppression societe effectuée avec succès");
     } catch (SQLException ex) {
        //Logger.getLogger(PersonneDao.class.getName()).log(Level.SEVERE, null, ex);
         System.out.println("erreur lors de la suppression de la societe "+ex.getMessage());
     }
	
	}
	
	public List<client> ListClient(){
		
		List<client> listeclient = new ArrayList<client>();

		String req="Select * from client_soc";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
                client cl =new client();
                cl.setDate_ajout_resp(resultat.getDate(4));
                cl.setEmail_resp(resultat.getString(1));
                cl.setMot_de_pass_resp(resultat.getString(5));
                cl.setNom_resp(resultat.getString(2));
                cl.setPrenom_resp(resultat.getString(3));
                cl.setMatricule_soc(resultat.getString(6));
                cl.setNumtel(resultat.getString(7));
                listeclient.add(cl);
            }
            return  listeclient;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des clients "+ex.getMessage());
            return null;
        }
		
	}
	
public List<societe> ListSoc(){
		
		List<societe> listeSoc = new ArrayList<societe>();

		String req="Select * from societe";
        try {
           Statement statement = ConnectionBD.getInstance()
                   .createStatement();
            ResultSet resultat = statement.executeQuery(req);

            while(resultat.next()){
                societe so =new societe();
                so.setMat_société(resultat.getString(1));
                so.setNom_société(resultat.getString(2));
                so.setAdress_société(resultat.getString(3));
                so.setTel_soc(resultat.getString(4));
                
                listeSoc.add(so);
            }
            return  listeSoc;
        } catch (SQLException ex) {
           
            System.out.println("erreur recperation list des societe "+ex.getMessage());
            return null;
        }
		
	}
	
}
