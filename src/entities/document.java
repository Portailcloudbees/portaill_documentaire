package entities;

public class document {
	private int id_doc;
	private String nom_doc;
	private int ref_doc;
	private String type;
	private String chemain;
	
	public document () {
		
	}
	
	public document(int id_doc, String nom_doc, int ref_doc, String type,
			String chemain) {
		
		this.id_doc = id_doc;
		this.nom_doc = nom_doc;
		this.ref_doc = ref_doc;
		this.type = type;
		this.chemain = chemain;
	}
	public int getId_doc() {
		return id_doc;
	}
	public void setId_doc(int id_doc) {
		this.id_doc = id_doc;
	}
	public String getNom_doc() {
		return nom_doc;
	}
	public void setNom_doc(String nom_doc) {
		this.nom_doc = nom_doc;
	}
	public int getRef_doc() {
		return ref_doc;
	}
	public void setRef_doc(int ref_doc) {
		this.ref_doc = ref_doc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getChemain() {
		return chemain;
	}
	public void setChemain(String chemain) {
		this.chemain = chemain;
	}

}
