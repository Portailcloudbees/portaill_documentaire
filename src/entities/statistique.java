package entities;

abstract class statistique {
private int id_stat;
private int nbr_doc_traité;
private int nbr_doc_nontraité;
private int nbr_utilisateur;
private int nbr_client;
private int depense;
private int cout_facturation;
private int gain;

public statistique(){
	
}
public statistique(int id_stat, int nbr_doc_traité, int nbr_doc_nontraité,
		int nbr_utilisateur, int nbr_client, int depense, int cout_facturation,
		int gain) {
	
	this.id_stat = id_stat;
	this.nbr_doc_traité = nbr_doc_traité;
	this.nbr_doc_nontraité = nbr_doc_nontraité;
	this.nbr_utilisateur = nbr_utilisateur;
	this.nbr_client = nbr_client;
	this.depense = depense;
	this.cout_facturation = cout_facturation;
	this.gain = gain;
}
public int getId_stat() {
	return id_stat;
}
public void setId_stat(int id_stat) {
	this.id_stat = id_stat;
}
public int getNbr_doc_traité() {
	return nbr_doc_traité;
}
public void setNbr_doc_traité(int nbr_doc_traité) {
	this.nbr_doc_traité = nbr_doc_traité;
}
public int getNbr_doc_nontraité() {
	return nbr_doc_nontraité;
}
public void setNbr_doc_nontraité(int nbr_doc_nontraité) {
	this.nbr_doc_nontraité = nbr_doc_nontraité;
}
public int getNbr_utilisateur() {
	return nbr_utilisateur;
}
public void setNbr_utilisateur(int nbr_utilisateur) {
	this.nbr_utilisateur = nbr_utilisateur;
}
public int getNbr_client() {
	return nbr_client;
}
public void setNbr_client(int nbr_client) {
	this.nbr_client = nbr_client;
}
public int getDepense() {
	return depense;
}
public void setDepense(int depense) {
	this.depense = depense;
}
public int getCout_facturation() {
	return cout_facturation;
}
public void setCout_facturation(int cout_facturation) {
	this.cout_facturation = cout_facturation;
}
public int getGain() {
	return gain;
}
public void setGain(int gain) {
	this.gain = gain;
}

}
