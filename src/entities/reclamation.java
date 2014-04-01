package entities;

import java.sql.Date;

public class reclamation {
	private String objet_rec;
	private String sujet_rec;
	private String email_sender;
	private boolean traiter;
	private Date date;
	private int id_rec;
	private String company;
	
	
	
	public reclamation(){
		    
	}

	
	
	
	public String getCompany() {
		return company;
	}




	public void setCompany(String company) {
		this.company = company;
	}




	public int getId_rec() {
		return id_rec;
	}



	public void setId_rec(int id_rec) {
		this.id_rec = id_rec;
	}



	public String getObjet_rec() {
		return objet_rec;
	}

	public void setObjet_rec(String objet_rec) {
		this.objet_rec = objet_rec;
	}

	public String getSujet_rec() {
		return sujet_rec;
	}

	public void setSujet_rec(String sujet_rec) {
		this.sujet_rec = sujet_rec;
	}

	public String getEmail_sender() {
		return email_sender;
	}

	public void setEmail_sender(String email_sender) {
		this.email_sender = email_sender;
	}

	public boolean isTraiter() {
		return traiter;
	}

	public void setTraiter(boolean traiter) {
		this.traiter = traiter;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	

}
