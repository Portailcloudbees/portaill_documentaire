package AdminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import adminDAO.gerer_Client_societe;
import entities.societe;

/**
 * Servlet implementation class modif_delete_soc
 */
@WebServlet("/modif_delete_soc")
public class delet_soc_client extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delet_soc_client() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String mat =request.getParameter("mat");
				String mail=request.getParameter("mail");
				gerer_Client_societe gc = new gerer_Client_societe();
				if (mat==null){
					gc.deleteClient(mail);
					System.out.println("1");
				}else{
					System.out.println("2");
					gc.deleteSoc(mat);
				}
				
	}
	

}
