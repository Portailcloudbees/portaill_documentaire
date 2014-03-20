package entities;

public class administrateur {
 private String email_admin;
 private String nom_admin;
 private String prenom_admin;
 private String mot_de_passe;
 
 public administrateur () {
 
 }
public administrateur(String email_admin, String nom_admin,
		String prenom_admin, String mot_de_passe) {
	
	this.email_admin = email_admin;
	this.nom_admin = nom_admin;
	this.prenom_admin = prenom_admin;
	this.mot_de_passe = mot_de_passe;
}
public String getEmail_admin() {
	return email_admin;
}
public void setEmail_admin(String email_admin) {
	this.email_admin = email_admin;
}
public String getNom_admin() {
	return nom_admin;
}
public void setNom_admin(String nom_admin) {
	this.nom_admin = nom_admin;
}
public String getPrenom_admin() {
	return prenom_admin;
}
public void setPrenom_admin(String prenom_admin) {
	this.prenom_admin = prenom_admin;
}
public String getMot_de_passe() {
	return mot_de_passe;
}
public void setMot_de_passe(String mot_de_passe) {
	this.mot_de_passe = mot_de_passe;
}
 
 
}
