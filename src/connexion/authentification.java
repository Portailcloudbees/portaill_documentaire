package connexion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class authentification {
	public static String c=null;
	public static String nomprenom=null;
	public static String email=null;
	
public authentification(){
	
}

public String getNomPrenom(String login){
	String req="select nom_admin,prenom_admin from admin where email_admin="+login;
	String nomprenom="";
	try{ 
	     Statement statement = ConnectionBD.getInstance().createStatement();
	     ResultSet resultat = statement.executeQuery(req);
	     nomprenom=resultat.getString("nom_admin")+" "+resultat.getString("prenom_admin");
	    }catch(SQLException e){
	        System.out.println(e);
	    }
	return nomprenom;
}

public int exist(String req){
    int nbrlignes=0;
     try{ 
     Statement statement = ConnectionBD.getInstance().createStatement();
     ResultSet resultat = statement.executeQuery(req);
     resultat.last();
     nbrlignes =resultat.getRow();
     System.out.println(resultat.getRow());
    }catch(SQLException e){
        System.out.println(e);
    }
    return nbrlignes;
 }

public String connecter(String login, String mp){
	String reqAdmin="select * from admin where email_admin='"+login+"' and pass_admin='"+mp+"'";
	String reqResp="select * from client_soc where email_resp='"+login+"' and pass_resp='"+mp+"'";
	String requt="select * from utilisateur where email_ut='"+login+"' and pass_ut='"+mp+"'";
	
		if (exist(reqAdmin)>0){
			authentification.c="admin";
			authentification.nomprenom=getNomPrenom(login);
			authentification.email=login;
			return "admin";
			
		}else if (exist(reqResp)>0){
			authentification.c="responsable";
			return "responsable";
		}else if (exist(requt)>0) {
			authentification.c="utilisateur";
			return "utilisateur";
		}else{
			return "";
		
	}
	
	
}



}
