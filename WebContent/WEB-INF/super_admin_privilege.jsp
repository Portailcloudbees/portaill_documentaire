<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.administrateur" %>
<%@ page import="entities.privilege_admin" %>

<%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>
<!DOCTYPE html>

<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>Metronic | Data Tables - Responsive Tables</title>
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
            
            <li class="dropdown" id="header_notification_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <i class="icon-warning-sign"></i>
               <% gererHistorique gh = new gererHistorique();
                  gerer_reclamation gr = new gerer_reclamation();
                   int coun = gr.getRec(null);
                     int count = gh.getLast(null);
               %>
               <span class="badge"><%=count %></span>
               </a>
               <ul class="dropdown-menu extended notification">
                  <li>
                     <p>You have <%=count %> new histories</p>
                  </li>
                
                  <li class="external">   
                     <a href="list_getlast_historique">See all histories <i class="m-icon-swapright"></i></a>
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
                     <a href="list_delete_reclamation">See all notifications <i class="m-icon-swapright"></i></a>
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
                  <li><a href="forward?lien=super-profile.jsp"><i class="icon-user"></i> My Profile</a>
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
               <a href="forward?lien=index_super_admin.jsp">
               <i class="icon-home"></i> 
               <span class="title">Dashboard</span>
               <span class="selected"></span>
               </a>
            </li>
            
            <li class="">
              
               <a href="table_responsive.jsp">
               <i class="icon-user"></i> 
               <span class="title">Administrateurs</span>
               <span class="arrow "></span>
               </a>
			                  <ul class="sub-menu">
                  <li class="active">
                   
                     <a href="list_ajout_update_admin">
                     View Administrateur
                     <span class="arrow"></span>
                     </a>                  
                  </li>
               </ul>
            </li>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Clients</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <li class="active">
                     <a href="listclients">
                     View Clients
                     <span class="arrow"></span>
                     </a>                  
                  </li>
               </ul>
            </li>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Notifications</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <li class="active">
                     <a href="list_delete_reclamation">
                     View Notifications
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
               <span class="title">Documents</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <li class="active">
                     <a href="forward?lien=super_admin_doc_generation.jsp">
                     Create Document
                     <span class="arrow"></span>
                     </a>                  
                  </li>
                  
				  </ul>
				  </li>
				  
                 <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Historic</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <li class="active">
                     <a href="list_getlast_historique">
                      Dashboard traces
                     <span class="arrow"></span>
                     </a>
					 </li>
                    
                   </ul>					 
                  </li>
                          <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Statistics</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <li class="active">
                     <a href="forward?lien=table_statistique_admin.jsp">
                     View Statistics
                     <span class="arrow"></span>
                     </a>                  
                  </li>
				  </ul>
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
         <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                     <h4 class="modal-title">Modal title</h4>
                  </div>
                  <div class="modal-body">
                     Widget settings form goes here
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn blue">Save changes</button>
                     <button type="button" class="btn default" data-dismiss="modal">Close</button>
                  </div>
               </div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
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
                     <li class="color-blue" data-style="blue"></li>
                     <li class="color-brown" data-style="brown"></li>
                     <li class="color-purple" data-style="purple"></li>
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
                  Portail documentaire
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                 
                  <li>
                     <i class="icon-home"></i>
                     <a href="forward?lien=index.jsp">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="#">Privilege</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">Put Privilege for administrators</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->                      

               <!-- BEGIN SAMPLE TABLE PORTLET-->
		  <% 
                        int i;
                        ArrayList<privilege_admin> liste_priv = (ArrayList<privilege_admin>) request.getAttribute("list_de_priv");
                		  boolean c1=false;
                		  boolean c2=false;
                		  boolean c3=false;
                		  boolean c4=false;
                		  boolean c5=false;
                		  boolean c6=false;
                		  boolean c7=false;
                		  boolean c8=false;
                		  boolean c9=false;
                		  
                		  for (i=0; i<liste_priv.size(); i++) { 
                             c1 = liste_priv.get(i).isAddClient();
                             c2 = liste_priv.get(i).isDeleteClient();
                             c3 = liste_priv.get(i).isViewClient();
                             c4 = liste_priv.get(i).isUpdateClient();
                             c5 = liste_priv.get(i).isViewNotif();
                             c6 = liste_priv.get(i).isAnswerNotif();
                             c7 = liste_priv.get(i).isExport();
                             c8 = liste_priv.get(i).isViewStat();
                             c9 = liste_priv.get(i).isViewHistoric();
                            System.out.println(c1);
                            System.out.println(c2);
                        	
                        }
                        %>
<form method="post" action="list_update_priv_admin">
		<table width="950" align="center" >
			<tr>
			<td>
			<fieldset style="border:solid 2px #27a9e3; padding:35px; width:400px;" >
				<legend><center><h4 style="color:#27a9e3;">Client management </h4></center></legend>
             <input type="checkbox" name="CHOIX1" align="right" value="addclient" <%if (c1){out.println("CHECKED");} %>> Add Client &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="CHOIX3" value="viewclient" <%if (c3){out.println("CHECKED");} %>>View client</br></br>
			 <input type="checkbox" name="CHOIX2" align="right" value="deleteclient" <%if (c2){out.println("CHECKED");} %>>Delete client &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="CHOIX4" value="updateclient" <%if (c4){out.println("CHECKED");} %>>Update client</br></br>

              
            </fieldset>
		</td>
	
          <td>
		  <fieldset style="border:solid 2px #27a9e3; padding:35px; width:400px;" >
				<legend><center><h4 style="color:#27a9e3;">Notification</h4></center></legend>
             <input type="checkbox" name="CHOIX5" align="right" value="view_not" <%if (c5){out.println("CHECKED");} %>> View notifications&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/>
			 <input type="checkbox" name="CHOIX6" value="Ansewer" <%if (c6){out.println("CHECKED");} %>>Answer</br></br>			 
            </fieldset>
		</td>
		
		</tr>
		<tr>
         <td>
			<fieldset style="border:solid 2px #27a9e3; padding:35px; width:400px;" >
				<legend><center><h4 style="color:#27a9e3;" >Document management </h4></center></legend>
             <input type="checkbox" name="CHOIX7" align="right" value="Export" <%if (c7){out.println("CHECKED");} %>> Export PDF/EXCEL 
            </fieldset>
		</td>
		<td>

			<fieldset style="border:solid 2px #27a9e3; padding:35px; width:400px;" >
				<legend><center><h4 style="color:#27a9e3;" >Statistic</h4></center></legend>
             <input type="checkbox" name="CHOIX8" align="right" value="viewstat" <%if (c8){out.println("CHECKED");} %>> View Statistic
            </fieldset>
		</td>
		</tr>
				<tr>
<td>
			<fieldset style="border:solid 2px #27a9e3; padding:35px; width:400px;" >
				<legend><center><h4 style="color:#27a9e3;" >historic </h4></center></legend>
             <input type="checkbox" name="CHOIX9" align="right" value="viewhistoric" <%if (c9){out.println("CHECKED");} %>>View historic 
            </fieldset>
		</td>
		
		<td>
		<center><button style="color:#27a9e3;" type="submit" class="btn btn-default" ><b>Valider</b></button>&nbsp;&nbsp;&nbsp;<button style="color:#27a9e3;" type="reset" class="btn btn-default"><b>Annuler</b></button></center>
		</td>
		
	
		</tr>
		</table>
		
</form>

               <!-- END SAMPLE TABLE PORTLET-->
       
            </div>
         </div>
         <!-- END PAGE CONTENT-->
      </div>
      <!-- END PAGE -->
   </div>
   <!-- END CONTAINER -->
   <!-- BEGIN FOOTER -->
   <div class="footer">
      <div class="footer-inner">
         2014 &copy; Imex.
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
   <script src="assets/scripts/app.js"></script>      
   <script>
      jQuery(document).ready(function() {       
         // initiate layout and plugins
         App.init();
      });
   </script>
</body>
<!-- END BODY -->
</html>