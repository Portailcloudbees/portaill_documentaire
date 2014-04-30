package entities;

import java.sql.Date;
import java.sql.Timestamp;



public class historique {

	private String ipAdresse;
	private String Nom;
	private String prenom;
	private String tache;
	private String email;
	private String type;
	private Date date;
	private String email_resp=null;
	private int id;
	
	public historique(){
		
	}

	public String getIpAdresse() {
		return ipAdresse;
	}

	public void setIpAdresse(String ipAdresse) {
		this.ipAdresse = ipAdresse;
	}

	public String getNom() {
		return Nom;
	}

	public void setNom(String nom) {
		Nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTache() {
		return tache;
	}

	public void setTache(String tache) {
		this.tache = tache;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail_resp() {
		return email_resp;
	}

	public void setEmail_resp(String email_resp) {
		this.email_resp = email_resp;
	}

	
	
}
