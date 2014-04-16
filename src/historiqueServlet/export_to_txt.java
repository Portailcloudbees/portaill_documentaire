package historiqueServlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class export_to_txt
 */
@WebServlet("/export_to_txt")
public class export_to_txt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final int BYTES_DOWNLOAD = 1024; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public export_to_txt() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("export"); 
		String content=request.getParameter("txt");
		
		
		response.setContentType("text/plain");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		
        response.setHeader("Content-Disposition", "attachment;filename="+dateFormat.format(date)+"_history.txt");
        String s = "***************************************  traces of all users ***********************/n";
        s += content.replaceAll("/n", System.getProperty("line.separator"));
        InputStream input = new ByteArrayInputStream(s.getBytes("UTF8"));

        int read = 0;
        byte[] bytes = new byte[BYTES_DOWNLOAD];
        OutputStream os = response.getOutputStream();

        while ((read = input.read(bytes)) != -1) {
            os.write(bytes, 0, read);
            
        }
        os.flush();
        os.close();
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
