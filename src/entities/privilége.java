package entities;

public class privilége {
	private int id_priv;
	private int email_ut;
	private int upload;
	private int cons_doc_genere; 
	private int cons_xml;
	private int  statistique;
	private int  sms;
	private int envoi_mail;
	private int  generer_doc;;
	private int  reclamation;
	
	public privilége(){
		
	}
	public privilége(int id_priv, int email_ut, int upload,
			int cons_doc_genere, int cons_xml, int statistique, int sms,
			int envoi_mail, int generer_doc, int reclamation) {
		
		this.id_priv = id_priv;
		this.email_ut = email_ut;
		this.upload = upload;
		this.cons_doc_genere = cons_doc_genere;
		this.cons_xml = cons_xml;
		this.statistique = statistique;
		this.sms = sms;
		this.envoi_mail = envoi_mail;
		this.generer_doc = generer_doc;
		this.reclamation = reclamation;
	}
	public int getId_priv() {
		return id_priv;
	}
	public void setId_priv(int id_priv) {
		this.id_priv = id_priv;
	}
	public int getEmail_ut() {
		return email_ut;
	}
	public void setEmail_ut(int email_ut) {
		this.email_ut = email_ut;
	}
	public int getUpload() {
		return upload;
	}
	public void setUpload(int upload) {
		this.upload = upload;
	}
	public int getCons_doc_genere() {
		return cons_doc_genere;
	}
	public void setCons_doc_genere(int cons_doc_genere) {
		this.cons_doc_genere = cons_doc_genere;
	}
	public int getCons_xml() {
		return cons_xml;
	}
	public void setCons_xml(int cons_xml) {
		this.cons_xml = cons_xml;
	}
	public int getStatistique() {
		return statistique;
	}
	public void setStatistique(int statistique) {
		this.statistique = statistique;
	}
	public int getSms() {
		return sms;
	}
	public void setSms(int sms) {
		this.sms = sms;
	}
	public int getEnvoi_mail() {
		return envoi_mail;
	}
	public void setEnvoi_mail(int envoi_mail) {
		this.envoi_mail = envoi_mail;
	}
	public int getGenerer_doc() {
		return generer_doc;
	}
	public void setGenerer_doc(int generer_doc) {
		this.generer_doc = generer_doc;
	}
	public int getReclamation() {
		return reclamation;
	}
	public void setReclamation(int reclamation) {
		this.reclamation = reclamation;
	}
	
	

}
