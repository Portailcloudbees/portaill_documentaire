package entities;

public class societe {
	private String mat_société;
	private String adress_société;
	private String nom_société;
	private String tel_soc;
	
	public societe() {	
	}
	
	public societe(String mat_société, String adress_société, String nom_société) {
		
		this.mat_société = mat_société;
		this.adress_société = adress_société;
		this.nom_société = nom_société;
	}
	public String getMat_société() {
		return mat_société;
	}
	public void setMat_société(String mat_société) {
		this.mat_société = mat_société;
	}
	public String getAdress_société() {
		return adress_société;
	}
	public void setAdress_société(String adress_société) {
		this.adress_société = adress_société;
	}
	public String getNom_société() {
		return nom_société;
	}
	public void setNom_société(String nom_société) {
		this.nom_société = nom_société;
	}

	public String getTel_soc() {
		return tel_soc;
	}

	public void setTel_soc(String tel_soc) {
		this.tel_soc = tel_soc;
	}
	
	

}
