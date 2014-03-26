package entities;

import java.sql.Date;

public class client {
	private String email_resp;
	private String nom_resp;
	private String prenom_resp;
	private Date date_ajout_resp;
	private String mot_de_pass_resp;
	private String matricule_soc;
	
	public client() {
	}
	
	public client(String email_resp, String nom_resp,
			String prenom_resp, Date date_ajout_resp, String mot_de_pass_resp,
			int tel_resp) {
		
		this.email_resp = email_resp;
		this.nom_resp = nom_resp;
		this.prenom_resp = prenom_resp;
		this.date_ajout_resp = date_ajout_resp;
		this.mot_de_pass_resp = mot_de_pass_resp;
		
	}
	
	public String getEmail_resp() {
		return email_resp;
	}
	public void setEmail_resp(String email_resp) {
		this.email_resp = email_resp;
	}
	public String getNom_resp() {
		return nom_resp;
	}
	public void setNom_resp(String nom_resp) {
		this.nom_resp = nom_resp;
	}
	public String getPrenom_resp() {
		return prenom_resp;
	}
	public void setPrenom_resp(String prenom_resp) {
		this.prenom_resp = prenom_resp;
	}
	public Date getDate_ajout_resp() {
		return date_ajout_resp;
	}
	public void setDate_ajout_resp(Date d) {
		this.date_ajout_resp = d;
	}
	public String getMot_de_pass_resp() {
		return mot_de_pass_resp;
	}
	public void setMot_de_pass_resp(String mot_de_pass_resp) {
		this.mot_de_pass_resp = mot_de_pass_resp;
	}

	public String getMatricule_soc() {
		return matricule_soc;
	}

	public void setMatricule_soc(String matricule_soc) {
		this.matricule_soc = matricule_soc;
	}
	
	

}
