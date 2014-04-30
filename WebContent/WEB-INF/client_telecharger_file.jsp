<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.xml" %>
  <%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>


<!DOCTYPE html>
<head>
   <meta charset="utf-8" />
   <title>IMEX | Acceuil-User</title>
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
   <link href="css/sms-style.css" rel="stylesheet" type="text/css"/>
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
         <a class="navbar-brand" href="forward?lien=index_client.jsp">
      			 <img style="width:100px; height:25px " src="assets/img/logon.png" alt="logo" class="img-responsive" />
         </a>
         <!-- END LOGO -->
         <!-- BEGIN RESPONSIVE MENU TOGGLER --> 
         <!-- END RESPONSIVE MENU TOGGLER -->
         <!-- BEGIN TOP NAVIGATION MENU -->
         <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->
            
            <li class="dropdown" id="header_notification_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <i class="icon-warning-sign"></i>
               <% gererHistorique gh = new gererHistorique();
                  gerer_reclamation gr = new gerer_reclamation();
                  
                   int coun = gr.getRec(gr.getCompany("select mat_soc from client_soc where email_resp='"+authentification.email+"'"));
               	   int count = gh.getLast(authentification.email);
               %>
               <span class="badge"><%=count %></span>
               </a>
               <ul class="dropdown-menu extended notification">
                  <li>
                     <p>You have <%=count %> new histories</p>
                  </li>
                
                  <li class="external">   
                     <a href="list_getlast_client_historique">See all histories <i class="m-icon-swapright"></i></a>
                  </li>
               </ul>
            </li>
            
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
                  <li><a href="forward?lien=client-profile.jsp"><i class="icon-user"></i> My Profile</a>
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
            <li class="">
               <a href="forward?lien=index_client.jsp">
               <i class="icon-home"></i> 
               <span class="title">Dashboard</span>
               <span class="arrow"></span>
               </a>
            </li>
            
            <li class="">
               <a href="javascript:;">
               <i class="icon-user"></i> 
               <span class="title">User</span>
               <span class="arrow "></span>
               </a>
			   <ul class="sub-menu">
                  <li>
                     <a href="list_ajout_update_ut">
                     View User
                     <span class="arrow"></span>
                     </a>
                  </li>
				  </ul>
            </li>
		
			<li class="start active ">
               <a class="active" href="javascript:;">
               <i class="icon-folder-open"></i> 
               <span class="title">Files</span>
                <span class="selected"></span>
               </a>
               <ul class="sub-menu">
                  <li>
                     <a href="forward?lien=client_upload_file.jsp">
                     File Upload 
                     <span class="arrow"></span>
                     </a>
                  </li>
                 <li>
                     <a href="list_xml_up">
                     View Uploaded Files
                     <span class="arrow"></span>
                     </a>
                  </li>
                 
				     <li>
                     <a href="list_download_xml">
                     Download File
                    <span class="arrow"></span>
                     </a>
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
                     <a href="notif_send_page">
                     Send  Notification 
                     <span class="arrow"></span>
                     </a>
                  </li>
                   <li>
                     <a href="client_user_list_notif_rep">
                     List of notifications 
                     <span class="arrow"></span>
                     </a>
                  </li>
				  </ul>
            </li>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">invoice management</span>
               <span class="arrow "></span>
               </a>
             <ul class="sub-menu">
                  <li class="active">
                     <a href="factureServlet">
                     View list of invoices
                     <span class="arrow"></span>
                     </a>                  
                  </li>
                  
              </ul>
              </li>
             <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Historique</span>
               <span class="arrow "></span>
               </a>
            <ul class="sub-menu">
                  <li>
                     <a href="list_getlast_client_historique">
                    View Historique 
                     <span class="arrow"></span>
                     </a>
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
                     <a href="forward?lien=client_statistique.jsp">
                     View  Statistique 
                     <span class="arrow"></span>
                     </a>
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
                  Poratil Documentaire
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="index.html">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">Files</a></li>
				  <i class="icon-angle-right"></i>
				  <li><a href="#">Download File</a></li>
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
	 
  <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>Uploaded Files</div>
                     <div class="actions">
                        <div class="btn-group">
                           <a class="btn default" href="#" data-toggle="dropdown">
                           Columns
                           <i class="icon-angle-down"></i>
                           </a>
                           <div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                              <label><input type="checkbox" checked data-column="0">Type</label>
                              <label><input type="checkbox" checked data-column="1">Name</label>
                              
                              <label><input type="checkbox" checked data-column="2">Size</label>
                              <label><input type="checkbox" checked data-column="3">Date</label>
                              <label><input type="checkbox" checked data-column="4">Etat</label>
                              
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="portlet-body">
                     <table class="table table-striped table-bordered table-hover table-full-width " id="sample_2">
                        <thead>
                           <tr>
                              <th>Type</th>
                              <th>Name</th>
                              <th hidden>Path</th>
                              <th class="hidden-xs">Size</th>
                              <th class="hidden-xs">Date</th>
                              <th class="hidden-xs">Etat</th>
                              <th > Download </th>
                              <th > Email </th>
                              <th > SMS </th>
                              <th >Delete </th>
                           </tr>
                        </thead>
                        <tbody>
                            <% 
                        int j;
                        ArrayList<xml> liste_xml = (ArrayList<xml>) request.getAttribute("list_de_xml");
                        for (j=0; j<liste_xml.size(); j++) { 
                            	
                        %>
                           <tr>
                              <td><%= liste_xml.get(j).getType_doc() %></td>
                              <td><%= liste_xml.get(j).getNom_doc() %></td>
                             <td hidden><%= liste_xml.get(j).getPath_doc() %></td>
                              <td ><%= liste_xml.get(j).getTaille_doc() %></td>
							  <td><%= liste_xml.get(j).getDate_ajout() %></td>
							 <% 
								 out.println("<td><span class='label label-sm label-success'>Ready </span></td>"
				                            ); 
							 %>
							  <!-- <td><a class="fileDownloadSimpleRichExperience" href="#" onclick="down();" >Telecharger</a></td> -->
							  <!-- <td><a class="download" href="javascript:;" >telecharger</a></td>-->
                              <td><a onclick="down()" href="download_xml?fileName=<%= liste_xml.get(j).getNom_doc() %>&path=<%= liste_xml.get(j).getPath_doc() %>">telecharger</a></td>
                              <td><a href="#email" data-toggle="modal" >email</a></td>

                                   <div class="modal fade" id="email" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Compose new</h4>
                                             </div>
                                             <div class="modal-body" style="height:100%">
                                               <div id="form-main" align="center">
 
                                                            
       
                                                     <p class="email" >
                                                        <input name="email" type="text" class="validate[required,custom[email]] feedback-input" id="emailto" placeholder="Email" />
                                                      </p>
                                                     
                                                      <p class="name">
                                                        <input name="name" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Objet" id="sujet" />
                                                      </p>
                                                      
                                                      <p class="text">
                                                        <textarea name="text" class="validate[required,length[6,300]] feedback-input" id="contenue" placeholder="Message"></textarea>
                                                      </p>
   													
   													   <p class="btn green fileinput-button">
                                                          <input id="file" type="file" name="file" size="50" />
                                                      </p>
   
                                                            
                                                           </div>
         
      
                                             </div>
                                             <div class="modal-footer">
                                           
                                                <button type="button" id="sendmail" onclick="javascript:;" class="btn blue email">Save changes</button>
                                                <button type="button" class="btn default" data-dismiss="modal">Close</button>
                                               
                                             </div>
                                          </div>
                                          <!-- /.modal-content -->
                                       </div>
                                       <!-- /.modal-dialog -->
                                    </div>










                              <td><a href="#sms" data-toggle="modal" >Send Sms</a></td>
                              <!--modal begin-->
                                 <div class="modal fade" id="sms" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">Compose new</h4>
                                             </div>
                                             <div class="modal-body" style="height:100%">
                                               <div id="form-main" align="center">
 
                                                             <form class="form" id="form1" name="sms" action="Send_sms" method="GET">
                                                               
                                                               <p class="name">
                                                                 <input name="to" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Phone Number" id="toSMS" />
                                                               </p>


                                                               <p class="text">
                                                                 <textarea name="message" class="validate[required,length[6,300]] feedback-input" id="messageSMS" placeholder="Message"></textarea>
                                                               </p>
                                                            
                                                           </div>
         
      
                                             </div>
                                             <div class="modal-footer">
                                           
                                                <button type="button" id="sendsms" onclick="javascript:;" class="btn blue">Save changes</button>
                                                <button type="button" class="btn default" data-dismiss="modal">Close</button>
                                             	</form>
                                             </div>
                                          </div>
                                          <!-- /.modal-content -->
                                       </div>
                                       <!-- /.modal-dialog -->
                                    </div>

                             <!--modal end-->


                              <td><a class="delete" href="javascript:;" >Delete</a></td>
                             
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
   <script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="assets/scripts/app.js"></script>
   <script src="assets/scripts/jquery.filedownload.js"></script>
   
   <script src="assets/scripts/table-advanced.js"></script>     
     


     <script>
        $(document).ready(function(){
	     	 $("#sendsms").click(function(){
				$.get("Send_sms",
					 {
			       	 to:document.getElementById("toSMS").value,
						 message:document.getElementById("messageSMS").value
					 },
						function(data,status){
						  
					  });
				  });
	     	 
	     	$("#sendmail").click(function(){
	            $.post("send_email",
	                {
	                   emailto:document.getElementById("emailto").value,
	                   sujet:document.getElementById("sujet").value,
	                   contenue:document.getElementById("contenue").value
	                },
	                  function(data,status){
	                    alert("Email Sent");
	                 });
	              });
	     	 
	     	 
			  });
								        	   
		 </script>
   <script>
      jQuery(document).ready(function() {       
         App.init();
         TableAdvanced.init();
      });
   </script>
   
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>