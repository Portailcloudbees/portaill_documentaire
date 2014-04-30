
<%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>
 



 <html lang="en" class="no-js"> 
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>IMEX | Acceuil</title>
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
   <!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
   <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
   <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
   <link href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
   <link href="assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
   <link href="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
   <!-- END PAGE LEVEL PLUGIN STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
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
                  Dashboard <small>Documentary portal</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="forward?lien=index.jsp">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">Dashboard</a></li>
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
         
   		
<div class="tab-pane" id="tab_1_3">
                        <div class="row profile-account">
                           <div class="col-md-3">
                              <ul class="ver-inline-menu tabbable margin-bottom-10">
                                 <li class="active">
                                    <a data-toggle="tab" href="#tab_1-1">
                                    <i class="icon-cog"></i> 
                                    Personal info
                                    </a> 
                                    <span class="after"></span>                                    
                                 </li>
                         
                                 <li ><a data-toggle="tab" href="#tab_3-3"><i class="icon-lock"></i> Change Password</a></li>
                                  <li ><a data-toggle="tab" href="#tab_3-4"><i class="icon-lock"></i> Change Price/octet</a></li>
                                
                              </ul>
                           </div>
                           <%
                          gererprofile gp = new gererprofile();
                           String [] valeur= gp.getInfo(authentification.email, authentification.c);
                           
                           
                           %>
                           <div class="col-md-9">
                              <div class="tab-content">
                                 <div id="tab_1-1" class="tab-pane active">
                                    <form role="form" name="f1" action="#">
                                       <div class="form-group">
                                          <label class="control-label">First Name</label>
                                          <input type="text" name="firstn" value="<%=valeur[0] %>" class="form-control" />
                                       </div>
                                       <div class="form-group">
                                          <label class="control-label">Last Name</label>
                                          <input type="text" name="lastn" value="<%=valeur[1] %>" class="form-control" />
                                       </div>
                                       <div class="form-group">
                                          <label class="control-label">Mobile Number</label>
                                          <input type="text" name="mobile" value="<%=valeur[2] %>" class="form-control" />
                                       </div>
                                     
                                       <div class="margiv-top-10">
                                          <a href="#" onclick="updateInfo()" class="btn green">Save Changes</a>
                                          <a href="#" class="btn default">Cancel</a>
                                       </div>
                                       <br>
                                       <div id="resultat" style="color:red; margin-left:250px"></div>
                                    </form>
                                    
                                 </div>
                                 
                                 <div id="tab_3-3" class="tab-pane">
                                    <form name="f2" >
                                       <div class="form-group">
                                          <label class="control-label">Current Password</label>
                                          <input type="password" name="current" class="form-control" />
                                       </div>
                                       <div class="form-group">
                                          <label class="control-label">New Password</label>
                                          <input type="password" name="new1" class="form-control" />
                                       </div>
                                       <div class="form-group">
                                          <label class="control-label">Re-type New Password</label>
                                          <input type="password" name="new2"  class="form-control" />
                                       </div>
                                       <div class="margin-top-10">
                                          
                                           <a href="#" onclick="updatePass()" class="btn green">Change Password</a>
                                          <a href="#" class="btn default">Cancel</a>
                                       </div>
                                       <div id="resultat1" style="color:red; margin-left:250px"></div>
                                    </form>
                                    
                                 </div>
                                 <div id="tab_3-4" class="tab-pane">
                                    <form name="f3" >
                                       <div class="form-group">
                                          <label class="control-label">Price</label>
                                          <input type="text" name="price" class="form-control" placeholder="DT" /> 
                                          <p style="color:red">Example : if per 1Mo it will be paid with 0.500 then
                                          			the price of 1oc = (0.500/1024)/1024</p>
                                       </div>
                                       
                                       <div class="margin-top-10">
                                          
                                           <a href="#" onclick="updatePrice()" class="btn green">Change Price</a>
                                          <a href="#" class="btn default">Cancel</a>
                                       </div>
                                       <div id="resultat2" style="color:red; margin-left:250px"></div>
                                    </form>
                                    
                                 </div>
                               
                              </div>
                           </div>
                           <!--end col-md-9-->                                   
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
   <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
   <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
   <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
   <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
   <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
   <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
   <!-- END CORE PLUGINS -->
   <!-- BEGIN PAGE LEVEL PLUGINS -->
  
   <script src="assets/plugins/flot/jquery.flot.js" type="text/javascript"></script>
   <script src="assets/plugins/flot/jquery.flot.resize.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
   <script src="assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
   <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>     
   <script src="assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
   <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
   <script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>  
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="assets/scripts/app.js" type="text/javascript"></script>
   <script src="assets/scripts/index.js" type="text/javascript"></script>
   <script src="assets/scripts/tasks.js" type="text/javascript"></script>        
   <!-- END PAGE LEVEL SCRIPTS -->  
   <script>
          function updateInfo(){
        	  
        	  if (document.f1.firstn.value=="" || document.f1.lastn.value=="" || document.f1.mobile.value==""){
        		  document.getElementById('resultat').innerHTML="Please fill in the fields";
        		 
        	  }else{
        		  var table = [];
                  table.push( { "firstn" : document.f1.firstn.value ,
                  		    "lastn": document.f1.lastn.value ,
                  		    "mobile":document.f1.mobile.value  }
                  );
                 
                  $.ajax({
                  	type:"GET",
                  	url: "./profileServlet",
                  	contentType: "application/x-www-form-urlencoded",
                  	dataType: "JSON",
                  	data: {ligne:JSON.stringify(table)},
                  	success: function(data) {
                  		 document.getElementById('resultat').innerHTML="update is successful";
                  		}
                  		})
               }
        	  
          }
          
          function updatePass(){
        	  if (document.f2.current.value=="" || document.f2.new1.value=="" || document.f2.new2.value==""){
        		  document.getElementById('resultat1').innerHTML="Please fill in the fields";
        	  }else if (document.f2.new1.value!=document.f2.new2.value){
        		  document.getElementById('resultat1').innerHTML="mouch kifkif"; 
        	
        		 
        	  }else{
        		  var table = [];
                  table.push( { "current" : document.f2.current.value ,
                  		    "newp": document.f2.new1.value   }
                  );
                 
                  $.ajax({
                  	type:"POST",
                  	url: "./profileServlet",
                  	contentType: "application/x-www-form-urlencoded",
                  	dataType: "JSON",
                  	data: {ligne:JSON.stringify(table)},
                  	success: function(dat) {
                  		
                  		 document.getElementById('resultat1').innerHTML=dat.responseText;
                  		},
                  	error: function (err){
                  		document.getElementById('resultat1').innerHTML=err.responseText;
                  	}
                  		});
        	  }
      
          }
        
          
          function updatePrice(){
        	  if (document.f3.price.value==""){
        		  document.getElementById('resultat2').innerHTML="Please fill in the field";
        	  }else{
        		  var table = [];
                  table.push( { 
                  		    "price": document.f3.price.value   }
                  );
                 
                  $.ajax({
                  	type:"POST",
                  	url: "./priceServlet",
                  	contentType: "application/x-www-form-urlencoded",
                  	dataType: "JSON",
                  	data: {ligne:JSON.stringify(table)},
                  	success: function(dat) {
                  		
                  		 document.getElementById('resultat2').innerHTML=dat.responseText;
                  		},
                  	error: function (err){
                  		document.getElementById('resultat2').innerHTML=err.responseText;
                  	}
                  		});
        	  }
      
          }
        
        </script>
   
   
   <script>
      jQuery(document).ready(function() {    
         App.init(); // initlayout and core plugins

      });
   </script>
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>