package entities;

public class reclamation {
	private int id_rec;
	private String titre_rec;
	private String sujet_rec;
	private int date_rec;
	
	public reclamation(){
		
	}
	public reclamation(int id_rec, String titre_rec, String sujet_rec,
			int date_rec) {
		
		this.id_rec = id_rec;
		this.titre_rec = titre_rec;
		this.sujet_rec = sujet_rec;
		this.date_rec = date_rec;
	}
	public int getId_rec() {
		return id_rec;
	}
	public void setId_rec(int id_rec) {
		this.id_rec = id_rec;
	}
	public String getTitre_rec() {
		return titre_rec;
	}
	public void setTitre_rec(String titre_rec) {
		this.titre_rec = titre_rec;
	}
	public String getSujet_rec() {
		return sujet_rec;
	}
	public void setSujet_rec(String sujet_rec) {
		this.sujet_rec = sujet_rec;
	}
	public int getDate_rec() {
		return date_rec;
	}
	public void setDate_rec(int date_rec) {
		this.date_rec = date_rec;
	}
	

}
