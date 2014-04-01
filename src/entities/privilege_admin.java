package entities;

public class privilege_admin {
	private boolean addClient;
	private boolean deleteClient;
	private boolean viewClient;
	private boolean updateClient;
	private boolean viewNotif;
	private boolean answerNotif;
	private boolean export;
	private boolean viewStat;
	private boolean viewHistoric;
	private boolean addSociete;
	private boolean viewSociete;
	private boolean deleteSociete;
	private boolean updateSociete;
	
	public privilege_admin(){
		
	}


	public boolean isAddClient() {
		return addClient;
	}


	public void setAddClient(boolean addClient) {
		this.addClient = addClient;
	}


	public boolean isDeleteClient() {
		return deleteClient;
	}


	public void setDeleteClient(boolean deleteClient) {
		this.deleteClient = deleteClient;
	}


	public boolean isViewClient() {
		return viewClient;
	}


	public void setViewClient(boolean viewClient) {
		this.viewClient = viewClient;
	}


	public boolean isUpdateClient() {
		return updateClient;
	}


	public void setUpdateClient(boolean updateClient) {
		this.updateClient = updateClient;
	}


	public boolean isViewNotif() {
		return viewNotif;
	}


	public void setViewNotif(boolean viewNotif) {
		this.viewNotif = viewNotif;
	}


	public boolean isAnswerNotif() {
		return answerNotif;
	}


	public void setAnswerNotif(boolean answerNotif) {
		this.answerNotif = answerNotif;
	}


	public boolean isExport() {
		return export;
	}


	public void setExport(boolean export) {
		this.export = export;
	}


	public boolean isViewStat() {
		return viewStat;
	}


	public void setViewStat(boolean viewStat) {
		this.viewStat = viewStat;
	}


	public boolean isViewHistoric() {
		return viewHistoric;
	}


	public void setViewHistoric(boolean viewHistoric) {
		this.viewHistoric = viewHistoric;
	}
	
	
	
	

}
