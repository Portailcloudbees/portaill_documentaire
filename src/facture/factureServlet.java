package facture;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import connexion.authentification;
import entities.administrateur;
import entities.client;
import entities.facture;

/**
 * Servlet implementation class factureServlet
 */
@WebServlet("/factureServlet")
public class factureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public factureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   factureDAO f = new factureDAO();
	   List l = new ArrayList<facture>();
	   if (authentification.c.equals("super")){
		   l = f.Listfacture_super(null);
	   }else if (authentification.c.equals("responsable")){
		   l = f.Listfacture_super(authentification.email);
	   }
	   
	   request.setAttribute("listfacture", l);
	   if (authentification.c==null){
		   this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	   }else if (authentification.c.equals("super")){
		   this.getServletContext().getRequestDispatcher("/WEB-INF/facture_table.jsp").forward(request, response);
	   }else if (authentification.c.equals("responsable")){
		   this.getServletContext().getRequestDispatcher("/WEB-INF/client_facture_table.jsp").forward(request, response);
	   }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ligneJson = request.getParameter("ligne");
		ligneJson=ligneJson.substring(1, ligneJson.length()-1);
		factureDAO fd = new factureDAO();
		facture f = new facture();
		java.util.Date date =null;
		java.util.Date from = null;
		java.util.Date to = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		 
		try {
			JSONObject ligne = new JSONObject(ligneJson);
			date =  formatter.parse(ligne.getString("date"));
			java.sql.Date d = new java.sql.Date(date.getTime());
			 from =  formatter.parse(ligne.getString("from"));
			 java.sql.Date fromm = new java.sql.Date(from.getTime());
			 to =  formatter.parse(ligne.getString("to"));
			 java.sql.Date too= new java.sql.Date(to.getTime());
			 
			 f.setDate(d);
				f.setDate_start(fromm);
				f.setDate_end(too);
				f.setSociete(ligne.getString("soc"));
				f.setEmail_client(ligne.getString("email"));
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		fd.addFacture(f);
		
		
	}

}
