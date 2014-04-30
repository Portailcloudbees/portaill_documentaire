package facture;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.client;
import entities.facture;
/**
 * Servlet implementation class displayFacture
 */
@WebServlet("/displayFacture")
public class displayFacture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public displayFacture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_s = request.getParameter("id");
		String date = request.getParameter("date");
		String dateS = request.getParameter("dateS");
		String dateE = request.getParameter("dateE");
		java.util.Date date_start = null;
		java.util.Date date_end = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
	 
		try {

			 date_start =  formatter.parse(dateS);
	         java.sql.Date from = new java.sql.Date(date_start.getTime());
			 date_end =  formatter.parse(dateE);
			 java.sql.Date to = new java.sql.Date(date_end.getTime());
	
		
		
		int id = Integer.parseInt(id_s);
		
		factureDAO f = new factureDAO();
		List l = new ArrayList<facture>();
		List l1 = new ArrayList<client>();
		
		String email_client= request.getParameter("email");
		l1 = f.getInfoClient(email_client);
		l = f.getFactureInfo(email_client, from, to);
		request.setAttribute("date", date);
		request.setAttribute("id", id);
		request.setAttribute("infoclient", l1);
		request.setAttribute("factureinfo", l);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/facture.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
