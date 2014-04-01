package entities;

import java.sql.Date;

public class utilisateur_entities {
	private String email_ut;
	private String nom_ut;
	private String prenom_ut;
	private String mot_de_passe_ut;
	private Date date_ajout_ut;
	private String mat_societe;
	private String email_resp;
	
	public utilisateur_entities() {
		
	}
	public utilisateur_entities(String email_ut, String nom_ut,
			String prenom_ut, String mot_de_passe_ut, Date date_ajout_ut) {
		
		this.email_ut = email_ut;
		this.nom_ut = nom_ut;
		this.prenom_ut = prenom_ut;
		this.mot_de_passe_ut = mot_de_passe_ut;
		this.date_ajout_ut = date_ajout_ut;
	}
	public String getEmail_ut() {
		return email_ut;
	}
	public void setEmail_ut(String email_ut) {
		this.email_ut = email_ut;
	}
	public String getNom_ut() {
		return nom_ut;
	}
	public void setNom_ut(String nom_ut) {
		this.nom_ut = nom_ut;
	}
	public String getPrenom_ut() {
		return prenom_ut;
	}
	public void setPrenom_ut(String prenom_ut) {
		this.prenom_ut = prenom_ut;
	}
	public String getMot_de_passe_ut() {
		return mot_de_passe_ut;
	}
	public void setMot_de_passe_ut(String mot_de_passe_ut) {
		this.mot_de_passe_ut = mot_de_passe_ut;
	}
	public Date getDate_ajout_ut() {
		return date_ajout_ut;
	}
	public void setDate_ajout_ut(Date date_ajout_ut) {
		this.date_ajout_ut = date_ajout_ut;
	}
	public String getMat_societe() {
		return mat_societe;
	}
	public void setMat_societe(String mat_societe) {
		this.mat_societe = mat_societe;
	}
	public String getEmail_resp() {
		return email_resp;
	}
	public void setEmail_resp(String email_resp) {
		this.email_resp = email_resp;
	}
	
	

}
