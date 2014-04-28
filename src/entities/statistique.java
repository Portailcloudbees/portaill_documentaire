package entities;

import java.sql.Date;


public class statistique {

private int id_stat;
private int nbr_doc_traité;
private int nbr_notif_traite;
private int nbr_utilisateur;
private int nbr_client;
private int nbr_admin;
private int size_doc;
private double price_oct;
private Date date_doc;
private Date date_price;
private Date date_notif;
private Date date_size;
private Date date_doc_client;
private String type_doc;
private int nbr_doc_traite_client;



public Date getDate_doc_client() {
	return date_doc_client;
}





public void setDate_doc_client(Date date_doc_client) {
	this.date_doc_client = date_doc_client;
}





public String getType_doc() {
	return type_doc;
}





public void setType_doc(String type_doc) {
	this.type_doc = type_doc;
}





public int getNbr_doc_traite_client() {
	return nbr_doc_traite_client;
}





public void setNbr_doc_traite_client(int nbr_doc_traite_client) {
	this.nbr_doc_traite_client = nbr_doc_traite_client;
}





public int getNbr_admin() {
	return nbr_admin;
}





public void setNbr_admin(int nbr_admin) {
	this.nbr_admin = nbr_admin;
}





public Date getDate_price() {
	return date_price;
}





public void setDate_price(Date date_price) {
	this.date_price = date_price;
}





public statistique(){
	
}





public int getSize_doc() {
	return size_doc;
}





public void setSize_doc(int size_doc) {
	this.size_doc = size_doc;
}





public Date getDate_size() {
	return date_size;
}





public void setDate_size(Date date_size) {
	this.date_size = date_size;
}





public Date getDate_doc() {
	return date_doc;
}





public void setDate_doc(Date date_doc) {
	this.date_doc = date_doc;
}





public Date getDate_notif() {
	return date_notif;
}





public void setDate_notif(Date date_notif) {
	this.date_notif = date_notif;
}





public int getNbr_notif_traite() {
	return nbr_notif_traite;
}



public void setNbr_notif_traite(int nbr_notif_traite) {
	this.nbr_notif_traite = nbr_notif_traite;
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





public double getPrice_oct() {
	return price_oct;
}





public void setPrice_oct(double price_oct) {
	this.price_oct = price_oct;
}


}
