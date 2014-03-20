package entities;

public class xml {
	private int id_xml;
	private String nom;
	private int date;
	
	public xml() {
		
	}
	public xml(int id_xml, String nom, int date) {
		
		this.id_xml = id_xml;
		this.nom = nom;
		this.date = date;
	}
	public int getId_xml() {
		return id_xml;
	}
	public void setId_xml(int id_xml) {
		this.id_xml = id_xml;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	
	

}
