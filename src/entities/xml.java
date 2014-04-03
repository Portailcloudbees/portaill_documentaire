package entities;

import java.sql.Date;

public class xml {
	private String nom_doc;
	private String path_doc;
	private long taille_doc;
	private String type_doc;
	private String email_user;
	private String email_client;
	
	public xml(){
		
	}
	
	public String getNom_doc() {
		return nom_doc;
	}
	public void setNom_doc(String nom_doc) {
		this.nom_doc = nom_doc;
	}
	public String getPath_doc() {
		return path_doc;
	}
	public void setPath_doc(String path_doc) {
		this.path_doc = path_doc;
	}
	public long getTaille_doc() {
		return taille_doc;
	}
	public void setTaille_doc(long l) {
		this.taille_doc = l;
	}
	
	public String getEmail_user() {
		return email_user;
	}
	public void setEmail_user(String email_user) {
		this.email_user = email_user;
	}
	public String getEmail_client() {
		return email_client;
	}
	public void setEmail_client(String email_client) {
		this.email_client = email_client;
	}

	public String getType_doc() {
		return type_doc;
	}

	public void setType_doc(String type_doc) {
		this.type_doc = type_doc;
	}
	
	
	
	
	

}
