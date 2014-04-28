<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page import="statistiqueDAO.*" %>
<%@ page import="entities.statistique" %>
<%@ page import="java.util.List" %>
<%@ page import="connexion.*" %>
<%@ page import="historiqueDAO.gererHistorique" %>
<%@ page import="adminDAO.gerer_reclamation" %>
<%@ page import="profile.gererprofile" %>
  <%@page import="entities.privilege_admin"%>
  <%@page import="adminDAO.gerer_privilege_admin"%>



<!DOCTYPE html>

<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>Imex | Data Tables - Editable Tables</title>
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
   <link rel="stylesheet" href="assets/amcharts/style.css"	type="text/css">
   
   
 
        
		<script src="assets/amcharts/amcharts.js" type="text/javascript"></script>
		<script src="assets/amcharts/serial.js" type="text/javascript"></script>
		<script src="assets/amcharts/amstock.js" type="text/javascript"></script>		
   <!-- END THEME STYLES -->
   <link rel="shortcut icon" href="favicon.ico" />
   <script src="assets/amcharts/exporting/amexport.js" type="text/javascript"></script>
        <script src="assets/amcharts/exporting/rgbcolor.js" type="text/javascript"></script>
        <script src="assets/amcharts/exporting/canvg.js" type="text/javascript"></script>
        <script src="assets/amcharts/exporting/jspdf.js" type="text/javascript"></script>
        <script src="assets/amcharts/exporting/filesaver.js" type="text/javascript"></script>
        <script src="assets/amcharts/exporting/jspdf.plugin.addimage.js" type="text/javascript"></script>
       
   		<script type="text/javascript">

			var chartData1 = [];
			var chartData2 = [];
			var chartData3 = [];
			var chartData4 = [];
			
			
			generateChartData();
			
            function generateChartData() {
            var firstDate = new Date(); 
            
            <% 
                        int j;
                        gererstatistique gs = new gererstatistique();
                        List c = gs.Doc_Traite();
                        ArrayList<statistique> liste = (ArrayList<statistique>) c ;
                        for ( j=0; j<liste.size(); j++) { 
                          Date dat = liste.get(j).getDate_doc();  
                          
                        %>
                   
               var d = <%=dat.getDate()%>;
               var m = <%=dat.getMonth()%>;
               var y = <%=dat.getYear()%>+1900;
               
               var finall = new Date(y,m,d);
               
               finall.setHours(0, 0, 0, 0);
             
               var a1 = <%= liste.get(j).getNbr_doc_traité()%> ;
               var b1 = <%= liste.get(j).getNbr_doc_traité() %>;
         
               chartData1.push({
                  date: finall,
                  value: a1,
                  volume: b1
               });
             
            <% } %>
            
            
            <%
	            int o;
	           
	            List n = gs.notif_traite();
	            ArrayList<statistique> list_notif = (ArrayList<statistique>) n ;
	            for ( o=0; o<list_notif.size(); o++) { 
	              Date date1 = list_notif.get(o).getDate_notif();  %>
	              
	              var d = <%=date1.getDate()%>;
	               var m = <%=date1.getMonth()%>;
	               var y = <%=date1.getYear()%>+1900;
	               
	               var finall = new Date(y,m,d);
	               
	               finall.setHours(0, 0, 0, 0);
	             
	               var a1 = <%= list_notif.get(o).getNbr_notif_traite()%> ;
	               var b1 = <%= list_notif.get(o).getNbr_notif_traite() %>;
	         
	               chartData2.push({
	                  date: finall,
	                  value: a1,
	                  volume: b1
	               });
	             
	            <% } %>
	            
	            
	            <%
	            int k;
	           
	            List s = gs.doc_size();
	            ArrayList<statistique> list_size = (ArrayList<statistique>) s ;
	            for ( k=0; k<list_size.size(); k++) { 
	              Date date2 = list_size.get(k).getDate_size();  %>
	              
	              var d = <%=date2.getDate()%>;
	               var m = <%=date2.getMonth()%>;
	               var y = <%=date2.getYear()%>+1900;
	               
	               var finall = new Date(y,m);
	               
	               finall.setHours(0, 0, 0, 0);
	             
	               var a1 = <%= list_size.get(k).getSize_doc()%> ;
	               var b1 = <%= list_size.get(k).getSize_doc() %>;
	         
	               chartData3.push({
	                  date: finall,
	                  value: a1,
	                  volume: b1
	               });
	             
	            <% } %>
            
	            
	            <%
	            int l;
	           
	            List p = gs.docs_price();
	            ArrayList<statistique> list_price = (ArrayList<statistique>) p ;
	            for ( l=0; l<list_price.size(); l++) { 
	              Date date3 = list_price.get(l).getDate_price();  %>
	              
	              var d = <%=date3.getDate()%>;
	               var m = <%=date3.getMonth()%>;
	               var y = <%=date3.getYear()%>+1900;
	               
	               var finall = new Date(y,m);
	               
	               finall.setHours(0, 0, 0, 0);
	             
	               var a1 = <%= list_price.get(l).getPrice_oct()%> ;
	               var b1 = <%= list_price.get(l).getPrice_oct() %>;
	         
	               chartData4.push({
	                  date: finall,
	                  value: a1,
	                  volume: b1
	               });
	             
	            <% } %>
            
         }
                   


			AmCharts.makeChart("chartdiv", {
				type: "stock",
				pathToImages: "assets/amcharts/images/",
			
				dataSets: [{
					title: "Generated docs per date",
					fieldMappings: [{
						fromField: "value",
						toField: "value"
					}, {
						fromField: "volume",
						toField: "volume"
					}],
					dataProvider: chartData1,
					categoryField: "date"
				},
			
				{
					title: "Answred notifications per date",
					fieldMappings: [{
						fromField: "value",
						toField: "value"
					}, {
						fromField: "volume",
						toField: "volume"
					}],
					dataProvider: chartData2,
					categoryField: "date"
				},
			
				{
					title: "Generated docs size per date",
					fieldMappings: [{
						fromField: "value",
						toField: "value"
					}, {
						fromField: "volume",
						toField: "volume"
					}],
					dataProvider: chartData3,
					categoryField: "date"
				},
			
				{
					title: "Expenditure per month",
					fieldMappings: [{
						fromField: "value",
						toField: "value"
					}, {
						fromField: "volume",
						toField: "volume"
					}],
					dataProvider: chartData4,
					categoryField: "date"
				}],
			
				panels: [{
			
					showCategoryAxis: false,
					title: "Value",
					percentHeight: 80,
			
					stockGraphs: [{
						id: "g1",
			
						valueField: "value",
						comparable: true,
						compareField: "value",
						bullet: "round",
						bulletBorderColor: "#FFFFFF",
						bulletBorderAlpha: 1,
						balloonText: "[[title]]:<b>[[value]]</b>",
						compareGraphBalloonText: "[[title]]:<b>[[value]]</b>",
						compareGraphBullet: "round",
						compareGraphBulletBorderColor: "#FFFFFF",
						compareGraphBulletBorderAlpha: 1
					}],
			
					stockLegend: {
						periodValueTextComparing: "[[percents.value.close]]%",
						periodValueTextRegular: "[[value.close]]"
					}
				},
			
				{
					title: "Volume",
					percentHeight: 30,
					stockGraphs: [{
						valueField: "volume",
						type: "column",
						showBalloon: false,
						fillAlphas: 1
					}],
			
			
					stockLegend: {
						periodValueTextRegular: "[[value.close]]"
					}
				}],
			
				chartScrollbarSettings: {
					graph: "g1"
				},
			
				chartCursorSettings: {
					valueBalloonsEnabled: true
				},
			
				periodSelector: {
					position: "left",
					periods: [{
						period: "DD",
						count: 10,
						label: "10 days"
					}, {
						period: "MM",
						selected: true,
						count: 1,
						label: "1 month"
					}, {
						period: "YYYY",
						count: 1,
						label: "1 year"
					}, {
						period: "YTD",
						label: "YTD"
					}, {
						period: "MAX",
						label: "MAX"
					}]
				},
				exportConfig: {
                    menuTop: "21px",
                    menuBottom: "auto",
                    menuRight: "21px",
                    backgroundColor: "#efefef",

                    menuItemStyle	: {
                    backgroundColor			: '#EFEFEF',
                    rollOverBackgroundColor	: '#DDDDDD'},

                    menuItems: [{
                        textAlign: 'center',
                        icon: 'assets/amcharts/images/export.png',
                        onclick:function(){},
                        items: [{
                            title: 'JPG',
                            format: 'jpg'
                        }, {
                            title: 'PNG',
                            format: 'png'
                        }, {
                            title: 'SVG',
                            format: 'svg'
                        }, {
                            title: 'PDF',
                            format: 'pdf'
                        }]
                    }]
                },
				
				dataSetSelector: {
					position: "left"
				}
			});
		</script>
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
            <li class="start active ">
               <a href="forward?lien=index_admin.jsp">
               <i class="icon-home"></i> 
               <span class="title">Dashboard</span>
               <span class="selected"></span>
               </a>
            </li>
            <%  boolean addClient = false;
            	boolean viewClient = false;
            	boolean deleteClient = false;
            	boolean updateClient = false;
            	boolean viewNotif = false;
            	boolean answerNotif = false;
            	boolean export = false;
            	boolean stat = false;
            	boolean historic = false;
            	String email = authentification.email;
            	gerer_privilege_admin gp = new gerer_privilege_admin();
            	List<privilege_admin> priv = gp.ListPrivilege(email);
                for (int i=0; i<priv.size(); i++) {
                	 addClient=priv.get(i).isAddClient();
                	 viewClient=priv.get(i).isViewClient();
                	 deleteClient=priv.get(i).isDeleteClient();
                	 updateClient=priv.get(i).isUpdateClient();
                	 viewNotif=priv.get(i).isViewNotif();
                	 answerNotif=priv.get(i).isAnswerNotif();
                	 export=priv.get(i).isExport();
                	 stat=priv.get(i).isViewStat();
                	 historic=priv.get(i).isViewHistoric();
                }
            %>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Clients</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <% if (viewClient){
                	 out.println("<li class='active'>"+
                          	        "<a href='listclients?type=admin'>"+
                  	                    "View Clients"+
                                 "<span class='arrow'></span>"+
                  					"</a></li>");
                	 }else{
                	 out.println("pas de priv");
                	}%>
               </ul>
            </li>
            <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Notifications</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
			    <%
			    	if (viewNotif){
			    		out.println("<li class='active'>"+
			                    		 "<a href='list_delete_reclamation'>"+
	                    					 "View Notifications"+
	                    				 "<span class='arrow'></span>"+
	                    				 "</a>"+                  
	                  				"</li>");
			    	}else{
			    		out.println("pas de priv");
			    	}
			    
			    %>
                  
                  	</ul>
				  </li>
                  <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Historic</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <%
                  		if (historic){
                  			out.println("<li class='active'>"+					 
                                    "<a href='list_getlast_historique'>"+
                            "historic of Clients"+
                            "<span class='arrow'></span>"+
                            "</a>"+
       					 "</li>");
                  		}else{
                  			out.println("pas de priv");
                  		}
                  %>
                    
                   </ul>					 
                  </li>
                          <li class="">
               <a href="javascript:;">
               <i class="icon-file-text"></i> 
               <span class="title">Statistics</span>
               <span class="arrow "></span>
               </a>
			    <ul class="sub-menu">
                  <% if (stat){
                	  out.println("<li class='active'>"+
                              "<a href='forward?lien=table_statistique_admin.jsp'>"+
                      "View Statistics"+
                      "<span class='arrow'></span>"+
                      "</a>"+                  
                   "</li>");
                  }else{
                	out.println("pas de priv");  
                  }
                  %>
                  </ul>
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
                  Statistics<small>admins</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li class="btn-group">
                     <button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
                     <span>Actions</span> <i class="icon-angle-down"></i>
                     </button>
                     <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                     </ul>
                  </li>
                  <li>
                     <i class="icon-home"></i>
                     <a href="forward?lien=index_super_admin.jsp">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="#">Statistics</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">View Statistics</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="row">
            <div class="col-md-12">
             <!-- BEGIN EXAMPLE TABLE users-->
             
<div id="chartdiv" style="width:100%; height:550px;"></div>             


                 <!-- END EXAMPLE TABLE PORTLET-->
               
             
            </div>
         </div>
         <!-- END PAGE CONTENT -->
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
   <!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.js"></script>
   <script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="assets/scripts/app.js"></script>
   <script src="assets/scripts/table-editable-client.js"></script> 
   <script src="assets/scripts/table-editable-company.js"></script>    
   <script>
      jQuery(document).ready(function() {       
         App.init();
         TableEditable.init();
         TableEditableCompany.init();
      });
   </script>
</body>
<!-- END BODY -->
</html>