package profile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import connexion.authentification;

/**
 * Servlet implementation class profileServlet
 */
@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		String ligneJson = request.getParameter("ligne");
		ligneJson=ligneJson.substring(1, ligneJson.length()-1);
		JSONObject ligne;
		    gererprofile gp = new gererprofile();
			ligne = new JSONObject(ligneJson);
			String firstn = ligne.getString("firstn");
			String lastn = ligne.getString("lastn");
			String mobile = ligne.getString("mobile");
			gp.updateInfo(authentification.c, firstn, lastn, mobile, authentification.email);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String ligneJson = request.getParameter("ligne");
			ligneJson=ligneJson.substring(1, ligneJson.length()-1);
			JSONObject ligne;
			    gererprofile gp = new gererprofile();
				ligne = new JSONObject(ligneJson);
				String current = ligne.getString("current");
				String newp = ligne.getString("newp");
				System.out.println(authentification.email);
				System.out.println(current+"--"+newp);
				String t = gp.updatePass(authentification.c, current, newp, authentification.email);
				System.out.println(t);
				response.setContentType("text/html");
				    response.getWriter().print(t);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
