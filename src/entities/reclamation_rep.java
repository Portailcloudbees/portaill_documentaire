package entities;

import java.sql.Date;

public class reclamation_rep {

	private String email_rep;
	private Date date_rep;
	private String nom_prenom_rep;
	private String contenue_rep;
	private int id_rec;
	
	public reclamation_rep() {
		
	}

	public String getEmail_rep() {
		return email_rep;
	}

	public void setEmail_rep(String email_rep) {
		this.email_rep = email_rep;
	}

	public Date getDate_rep() {
		return date_rep;
	}

	public void setDate_rep(Date date_rep) {
		this.date_rep = date_rep;
	}

	public String getNom_prenom_rep() {
		return nom_prenom_rep;
	}

	public void setNom_prenom_rep(String nom_prenom_rep) {
		this.nom_prenom_rep = nom_prenom_rep;
	}

	public String getContenue_rep() {
		return contenue_rep;
	}

	public void setContenue_rep(String contenue_rep) {
		this.contenue_rep = contenue_rep;
	}

	public int getId_rec() {
		return id_rec;
	}

	public void setId_rec(int id_rec) {
		this.id_rec = id_rec;
	}
	
	
}


