package entities;

public class societe {
	private String mat_soci�t�;
	private String adress_soci�t�;
	private String nom_soci�t�;
	private String tel_soc;
	
	public societe() {	
	}
	
	public societe(String mat_soci�t�, String adress_soci�t�, String nom_soci�t�) {
		
		this.mat_soci�t� = mat_soci�t�;
		this.adress_soci�t� = adress_soci�t�;
		this.nom_soci�t� = nom_soci�t�;
	}
	public String getMat_soci�t�() {
		return mat_soci�t�;
	}
	public void setMat_soci�t�(String mat_soci�t�) {
		this.mat_soci�t� = mat_soci�t�;
	}
	public String getAdress_soci�t�() {
		return adress_soci�t�;
	}
	public void setAdress_soci�t�(String adress_soci�t�) {
		this.adress_soci�t� = adress_soci�t�;
	}
	public String getNom_soci�t�() {
		return nom_soci�t�;
	}
	public void setNom_soci�t�(String nom_soci�t�) {
		this.nom_soci�t� = nom_soci�t�;
	}

	public String getTel_soc() {
		return tel_soc;
	}

	public void setTel_soc(String tel_soc) {
		this.tel_soc = tel_soc;
	}
	
	

}
