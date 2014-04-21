package responsableServlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import responsableDAO.gerer_xml;
import connexion.authentification;
import entities.xml;

/**
 * Servlet implementation class list_download_xml
 */
@WebServlet("/list_download_xml")
public class list_download_xml extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_download_xml() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		gerer_xml gx = new gerer_xml();
		List l = new ArrayList<xml>();
		String email="";
		if (authentification.c.equals("responsable")){
			email=authentification.email;
		}else{
			email=gx.getEmail_client(authentification.email);
		}
		
		l= gx.ListXml(email);
		System.out.println(l.size());
		request.setAttribute("list_de_xml", l);
		
		if (authentification.c.equals("responsable")){
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/client_telecharger_file.jsp").forward(request, response);
		}else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/user_telecharger_file.jsp").forward(request, response);
		}
		
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			/*String fileName = "test.txt";//request.getParameter("fileName");
			String path = "/container/test.txt";//request.getParameter("path");
			System.out.println(fileName+"----"+path);
			File file = new File(path);
			System.out.println("File location on server::"+file.getAbsolutePath());
			ServletContext ctx = getServletContext();
			InputStream fis = new FileInputStream(file);
			String mimeType = ctx.getMimeType(file.getAbsolutePath());
			
			response.setContentType(mimeType != null? mimeType:"application/octet-stream");
			response.setContentLength((int) file.length());
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			
			ServletOutputStream os       = response.getOutputStream();
			byte[] bufferData = new byte[1024];
			int read=0;
			while((read = fis.read(bufferData))!= -1){
				os.write(bufferData, 0, read);
			}
			os.flush();
			os.close();
			fis.close();
			System.out.println("File downloaded at client successfully");
		*/
	}
}
