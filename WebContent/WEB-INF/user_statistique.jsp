<%@ page import="java.util.ArrayList" %>

<%@ page import="entities.statistique" %>
<%@ page import="java.util.List" %>
<%@ page import="statistiqueDAO.*" %>
<%@ page import="java.sql.Date" %>
 <%@page import="responsableDAO.*"%>

 <%@page import="connexion.authentification"%>
  <%@page import="entities.privilege_utilisateur"%>
    <%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>
<!DOCTYPE html>

<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
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
      <link rel="stylesheet" href="assets/amcharts/style.css" type="text/css">
        <script src="assets/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="assets/amcharts/serial.js" type="text/javascript"></script>
   
   <!-- END THEME STYLES -->
       <script type="text/javascript">
            var chart;
            
            
            var chartData = [
			<% 
			int j;
			gerer_xml gx = new gerer_xml();
			String email_user = gx.getEmail_client(authentification.email);
			gererstatistique gs = new gererstatistique();
			List c = gs.client_stat(email_user);
			ArrayList<statistique> liste = (ArrayList<statistique>) c ;
			for ( j=0; j<liste.size(); j++) { 
			  Date dat = liste.get(j).getDate_doc_client();  
			  String type=liste.get(j).getType_doc();
			  int count=liste.get(j).getNbr_doc_traite_client();
			  
			%>
                {
                	
                    "country": "<%=type%>"+" "+"<%=dat%>",
                    "visits": <%=count%>,
                    "color": "#" + Math.floor(Math.random() * 16777215).toString(16)
                },
              <% }%> 
            ];

  
            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "country";
                // the following two lines makes chart 3D
                chart.depth3D = 20;
                chart.angle = 30;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.labelRotation = 90;
                categoryAxis.dashLength = 5;
                categoryAxis.gridPosition = "start";

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.title = "Count";
                valueAxis.dashLength = 5;
                chart.addValueAxis(valueAxis);

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.valueField = "visits";
                graph.colorField = "color";
                graph.balloonText = "<span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>";
                graph.type = "column";
                graph.lineAlpha = 0;
                graph.fillAlphas = 1;
                chart.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonEnabled = false;
                chart.addChartCursor(chartCursor);

                chart.creditsPosition = "top-right";

                // WRITE
                chart.write("chartdiv");
            });
        </script>
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
                   out.println("<a href='user_statistique.jsp'>"+
                           "View  Statistique"+ 
                           "<span class='arrow'></span>"+
                           "</a>");
                   }else{
                   out.println("pas de privilège");
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
                     <a href="forward?lien=index_user.jsp">Home</a> 
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
         	 <div id="chartdiv" style="width: 100%; height: 400px;"></div>
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

   <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->

   <script src="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
   <script src="assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>  
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="assets/scripts/app.js" type="text/javascript"></script>
  
   <!-- END PAGE LEVEL SCRIPTS -->  
   <script>
      jQuery(document).ready(function() {    
         App.init(); // initlayout and core plugins
        
      });
   </script>
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>