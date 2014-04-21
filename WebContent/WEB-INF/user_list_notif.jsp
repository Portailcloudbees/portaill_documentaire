<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.reclamation" %>
<%@ page import="entities.reclamation_rep" %>
<%@ page import="java.util.ArrayList" %>

 <%@page import="responsableDAO.*"%>
<%@ page import="java.util.List" %>
 <%@page import="connexion.authentification"%>
  <%@page import="entities.privilege_utilisateur"%>
     <%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>
<!DOCTYPE html>
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>IMEX | Notification </title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <meta name="MobileOptimized" content="320">
   <!-- BEGIN GLOBAL MANDATORY STYLES -->          
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
   <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
   <!-- END GLOBAL MANDATORY STYLES -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
   <!-- END THEME STYLES -->
   <link rel="shortcut icon" href="favicon.ico" />

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
   <!-- BEGIN HEADER -->   
   <div class="header navbar navbar-inverse navbar-fixed-top">
      <!-- BEGIN TOP NAVIGATION BAR -->
      <div class="header-inner">
         <!-- BEGIN LOGO -->  
         <a class="navbar-brand" href="forward?lien=index_super_admin.jsp">
      			 <img style="width:100px; height:25px " src="assets/img/logon.png" alt="logo" class="img-responsive" />
         </a>
         <!-- END LOGO -->
         <!-- BEGIN RESPONSIVE MENU TOGGLER --> 
         <!-- END RESPONSIVE MENU TOGGLER -->
         <!-- BEGIN TOP NAVIGATION MENU -->
         <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->
            
         
               <% 
                  gerer_reclamation gr = new gerer_reclamation();
                   int coun = gr.getRec(gr.getCompany("select mat_soc from client_soc where email_resp=(select email_resp from utilisateur where email_ut='"+authentification.email+"')"));
               	   
               %>
               
         
            
            <!-- END NOTIFICATION DROPDOWN -->
            
            <!-- BEGIN INBOX DROPDOWN -->
            <li class="dropdown" id="header_inbox_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                  data-close-others="true">
               <i class="icon-envelope"></i>
               <span class="badge"><%=coun %></span>
               </a>
               <ul class="dropdown-menu extended inbox">
                  <li>
                     <p>You have <%=coun %> new notifications</p>
                  </li>

                  <li class="external">   
                     <a href="client_user_list_notif_rep">See all notifications <i class="m-icon-swapright"></i></a>
                  </li>
               </ul>
            </li>
            <!-- END INBOX DROPDOWN -->
            
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <%
               		gererprofile gpi = new gererprofile(); 
                    String[] info = gpi.getInfo(authentification.email, authentification.c);  %>
               <span class="username"><%=info[0]+" "+info[1] %></span>
               <i class="icon-angle-down"></i>
               </a>
               <ul class="dropdown-menu">
                  <li><a href="forward?lien=user-profile.jsp"><i class="icon-user"></i> My Profile</a>
                  </li>
                 
                  <li class="divider"></li>
                  
                  <li><a href="deconnexion"><i class="icon-key"></i> Log Out</a>
                  </li>
               </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
         </ul>
         <!-- END TOP NAVIGATION MENU -->
      </div>
      <!-- END TOP NAVIGATION BAR -->
   </div>
   <!-- END HEADER -->
   <div class="clearfix"></div>
   <!-- BEGIN CONTAINER -->
   <div class="page-container">
      <!-- BEGIN SIDEBAR -->
      <div class="page-sidebar navbar-collapse collapse">
         <!-- BEGIN SIDEBAR MENU -->        
         <ul class="page-sidebar-menu">
           <li>
               <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
               <div class="sidebar-toggler hidden-phone"></div>
               <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            </li>
            <li>
               <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
               <form class="sidebar-search" action="" method="POST">
                  <div class="form-container">
                     <div class="input-box">
                        <a href="javascript:;" class="remove"></a>
                        <input type="text" placeholder="Search..."/>
                        <input type="button" class="submit" value=" "/>
                     </div>
                  </div>
               </form>
               <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="start active ">
               <a href="forward?lien=index_user.jsp">
               <i class="icon-home"></i> 
               <span class="title">Dashboard</span>
               <span class="selected"></span>
               </a>
            </li>
              <% 
               boolean uploadFile = false;
          	 boolean deleteFile = false;
          	 boolean sendFile = false;
          	 boolean downloadFile = false;
          	 boolean sendSms = false;
          	 boolean sendEmail = false;
          	 boolean viewStat = false;
          	 boolean answerNotif = false;
          	 boolean export = false;
             boolean viewUpload=false;
             boolean viewHistorique =false;
             boolean sendNotif=false;
             boolean listNotif=false;
             
               String email = authentification.email;
               gerer_privilege_ut gu = new gerer_privilege_ut();
               List<privilege_utilisateur> priv = gu.ListPrivilege(email);
                for (int i=0; i<priv.size(); i++) {
                   uploadFile=priv.get(i).isUploadFile();
                   deleteFile=priv.get(i).isDeleteFile();
                   
                   sendFile=priv.get(i).isSendFile();
                   downloadFile=priv.get(i).isDownloadFile();
                   sendSms=priv.get(i).isSendSms();
                   sendEmail=priv.get(i).isSendEmail();
                   viewStat=priv.get(i).isViewStat();
                   answerNotif=priv.get(i).isAnswerNotif();
                   export=priv.get(i).isExport();
                   viewUpload=priv.get(i).isViewUpload();
                   viewHistorique=priv.get(i).isViewHistorique();
                   sendNotif=priv.get(i).isSendNotif();
                   listNotif=priv.get(i).isListNotif();
                }
            %>
      
         <li>
               <a class="active" href="javascript:;">
               <i class="icon-folder-open"></i> 
               <span class="title">Files</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                  <li>
                  <% if (uploadFile){
                   out.println("<a href='forward?lien=user_upload_file.jsp'>"+
                           "File Upload"+ 
                          " <span class='arrow'></span>"+
                          " </a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
                 <li>
                    <% if (viewUpload){
                   out.println("<a href='list_xml_up'>"+
                           "View Uploaded Files"+
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
                 
                 <li>
                      <% if (downloadFile){
                   out.println("<a href='list_download_xml'>"+
                           "Download File"+
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
               </ul>
            </li>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Notification</span>
               <span class="arrow "></span>
               </a>
            <ul class="sub-menu">
                  <li>
                      <% if (sendNotif){
                   out.println("<a href='notif_send_page'>"+
                           "Send  Notification"+
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
                   <li>
                      <% if (listNotif){
                   out.println("<a href='client_user_list_notif_rep'>"+
                           "List of notifications"+
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
              </ul>
            </li>
         
         <li class="last">
               <a href="javascript:;">
               <i class="icon-bar-chart"></i> 
               <span class="title">Statistique</span>
               <span class="arrow "></span>
               </a>
            <ul class="sub-menu">
                  <li>
                        <% if (viewStat){
                   out.println("<a href='client_table_stat.jsp'>"+
                           "View  Statistique"+ 
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de priv");
                  }%>
                     
                  </li>
              </ul>
            </li>
         
         </ul>
         <!-- END SIDEBAR MENU -->
      </div>
      <!-- END SIDEBAR -->
      <!-- BEGIN PAGE -->
      <div class="page-content">
         <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->               
         <!-- /.modal -->
         <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
         <!-- BEGIN STYLE CUSTOMIZER -->
         <div class="theme-panel hidden-xs hidden-sm">
            <div class="toggler"></div>
            <div class="toggler-close"></div>
            <div class="theme-options">
               <div class="theme-option theme-colors clearfix">
                  <span>THEME COLOR</span>
                  <ul>
                     <li class="color-black current color-default" data-style="default"></li>
                     <li class="color-blue"></li>
                     <li class="color-grey" data-style="grey"></li>
                     <li class="color-white color-light" data-style="light"></li>
                  </ul>
               </div>
               <div class="theme-option">
                  <span>Layout</span>
                  <select class="layout-option form-control input-small">
                     <option value="fluid" selected="selected">Fluid</option>
                     <option value="boxed">Boxed</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Header</span>
                  <select class="header-option form-control input-small">
                     <option value="fixed" selected="selected">Fixed</option>
                     <option value="default">Default</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Sidebar</span>
                  <select class="sidebar-option form-control input-small">
                     <option value="fixed">Fixed</option>
                     <option value="default" selected="selected">Default</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Footer</span>
                  <select class="footer-option form-control input-small">
                     <option value="fixed">Fixed</option>
                     <option value="default" selected="selected">Default</option>
                  </select>
               </div>
            </div>
         </div>
         <!-- END BEGIN STYLE CUSTOMIZER --> 




		 
         <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                  Portail documentaire <small></small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
			    <li>
                     <i class="icon-home"></i>
                     <a href="index.html">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="#">Notification</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">Create Notification</a></li>                    
                  <li class="pull-right">
                     <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
            <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
              <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-edit"></i>Editable Table</div>
                     <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                     </div>
                  </div>
                  <div class="portlet-body">
                     <div class="table-toolbar">
                     
                     </div>
                     <table class="table table-striped table-hover table-bordered" id="sample_editable_notif">
                        <thead>
                           <tr>
                              <th style="display:none;"></th>
                              <th>Date</th>
                              <th>Email</th>
                              <th>Company</th>
                              <th>Object</th>
							         <th>State</th>
                              <th>Display</th>
                              
                              <th>Delete</th>
                           </tr>
                        </thead>
                        <tbody>
                               <% 
                        int i;
                        ArrayList<reclamation> liste_rec = (ArrayList<reclamation>) request.getAttribute("list_de_rec");
                        for (i=0; i<liste_rec.size(); i++) { 
                            	
                        %>
                           <tr >
                       		 <td style="display:none;"><%=liste_rec.get(i).getId_rec()%></td>
                              <td><%= liste_rec.get(i).getDate() %></td>
                              <td><%= liste_rec.get(i).getEmail_sender() %></td>
                              <td><%= liste_rec.get(i).getCompany() %></td>
                              <td><%= liste_rec.get(i).getObjet_rec() %></td>
                              <td><% if( liste_rec.get(i).isTraiter()==false){
                            	  	out.println("<span class='label label-sm label-danger'>non traite</span>");
                            	  	} else{ 
                            		out.println("<span class='label label-sm label-success'>traite</span>");
                            	  } %></td>
                              <td><a href="#<%=liste_rec.get(i).getId_rec()%>" data-toggle="modal">display</a></td>
                 <div class="modal fade" id="<%=liste_rec.get(i).getId_rec()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                     <h4 class="modal-title"><%= liste_rec.get(i).getObjet_rec() %></h4>
                  </div>
                  <div class="modal-body">
                  		<div >
                  		<h3>Notification Content</h3>
                        <%= liste_rec.get(i).getSujet_rec() %>
                        </div>
                        <div>
                        	<h3>Response :</h3>
                        <%
                        int j;
                        String cont="";
                        ArrayList<reclamation_rep> liste_rep = (ArrayList<reclamation_rep>) request.getAttribute("list_de_rep");
                       
                        for (j=0; j<liste_rep.size(); j++) {
                        	 if (liste_rec.get(i).getId_rec()==liste_rep.get(j).getId_rec()){
                        		 cont=cont+"Date: "+liste_rep.get(j).getDate_rep()+"<br>"+
                        		      "Email: "+liste_rep.get(j).getEmail_rep()+"<br>"+
                        		      "Full Name: "+liste_rep.get(j).getNom_prenom_rep()+"<br>"+
                        		      "Content: "+liste_rep.get(j).getContenue_rep()+"<br>"+
                        		      "<br/><hr><br/>";
                        	 }
                        	}
                        if (cont==""){
                        	out.println("<h4>No response</h4>");
                        }else{
                        	out.println(cont);
                        }
                         
                         %>
                        </div>
                  </div>
                  <div class="modal-footer">
                     
                     <button type="button" class="btn default" data-dismiss="modal">Close</button>
                  </div>
               </div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
                              
                              
                              <td><a class="delete" href="javascript:;">Delete</a></td>
                           </tr>
                          <% } %>
                        </tbody>
                     </table>
                  </div>
               </div>
         
        </div>
           </div>
              </div>
        </div>
   <div class="footer">
      <div class="footer-inner">
         2014 &copy; IMEX.
      </div>
      <div class="footer-tools">
         <span class="go-top">
         <i class="icon-angle-up"></i>
         </span>
      </div>
   </div>
   <!-- END FOOTER -->
   <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
   <!-- BEGIN CORE PLUGINS -->   
   <!--[if lt IE 9]>
   <script src="assets/plugins/respond.min.js"></script>
   <script src="assets/plugins/excanvas.min.js"></script> 
   <![endif]-->   
      <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>    
   <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
   <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
   <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
   <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
   <!-- END CORE PLUGINS -->
   <!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.js"></script>
   <script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="assets/scripts/app.js"></script>   
   <!-- END PAGE LEVEL SCRIPTS -->  
   <script src="assets/scripts/table-editable-notif.js"></script>    
   <script>
      jQuery(document).ready(function() {       
         App.init();
         TableEditableNotif.init();
      });
   </script>
   

   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>