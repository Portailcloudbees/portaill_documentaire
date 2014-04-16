package connexion;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connexion.authentification;
/**
 * Servlet implementation class connecter
 */
@WebServlet("/connecter")
public class connecter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public connecter() {
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
		// TODO Auto-generated method stub
		String rep = null;
		String login = request.getParameter("username"); 
		String pass = request.getParameter("password");
		authentification auth = new authentification();
		System.out.println(login +"---"+ pass);
		
		if (login.equals("super") && pass.equals("super")){
			authentification.c="super";
			authentification.email="super";
			authentification.nomprenom="responsable IMEX";
			this.getServletContext().getRequestDispatcher("/WEB-INF/index_super_admin.jsp").forward(request, response);
		}else{
			if (auth.connecter(login,pass)=="admin"){
				authentification.c="admin";
				authentification.email=login;
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/index_admin.jsp").forward(request, response);
		}else if (auth.connecter(login,pass)=="responsable"){
			authentification.c="responsable";
			authentification.email=login;
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/index_client.jsp").forward(request, response);
		}else if (auth.connecter(login,pass)=="utilisateur"){
			authentification.c="utilisateur";
			authentification.email=login;
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/index_user.jsp").forward(request, response);
		}else if (auth.connecter(login,pass)==""){
			rep=" nexiste pas";
			System.out.println(rep);
			request.setAttribute("err", rep);
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		}
		
	}

}
