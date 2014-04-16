package responsableServlet;

import historiqueDAO.gererHistorique;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.SmsFactory;
import com.twilio.sdk.resource.instance.Sms;

import connexion.authentification;

/**
 * Servlet implementation class Send_sms
 */
@WebServlet("/Send_sms")
public class Send_sms extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public static final String ACCOUNT_SID = "AC0c9852469a670c0fdf03c011ac75cf81"; 
	 public static final String AUTH_TOKEN = "6b3439668ef9381c2349dc6a781fd411"; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Send_sms() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String to=request.getParameter("to");
		 String body=request.getParameter("message");
		 System.out.println(to);
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
		 
		 
		 Map<String,String> params = new HashMap<String,String>();
	     params.put("From","+15866904839");
	     params.put("To", to);
	     params.put("Body", body);

	     try {
	         // send an sms a call  
	         // ( This makes a POST request to the SMS/Messages resource)
	    	 SmsFactory messageFactory = client.getAccount().getSmsFactory();
	    	    Sms message = messageFactory.create(params);
	    	    if (authentification.c.equals("responsable")){
        			gererHistorique gh = new gererHistorique();
        			gh.Task("à envoyer un sms à "+to, request.getRemoteAddr(), "responsable", authentification.email);
        			
        		}else{
        			gererHistorique gh = new gererHistorique();
        			gh.Task("à envoyer un sms à "+to, request.getRemoteAddr(), "utilisateur", authentification.email);
        			
        		}
	     }
	     catch (TwilioRestException e) {
	         e.printStackTrace();
	     }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
