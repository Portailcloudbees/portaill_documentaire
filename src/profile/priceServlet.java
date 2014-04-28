package profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import connexion.authentification;

/**
 * Servlet implementation class priceServlet
 */
@WebServlet("/priceServlet")
public class priceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public priceServlet() {
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
		try {
			String ligneJson = request.getParameter("ligne");
			ligneJson=ligneJson.substring(1, ligneJson.length()-1);
			JSONObject ligne;
			    gererprofile gp = new gererprofile();
				ligne = new JSONObject(ligneJson);
				double price = ligne.getDouble("price");
				
				String res =gp.updatePrice(price);
				response.setContentType("text/html");
			    response.getWriter().print(res);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
