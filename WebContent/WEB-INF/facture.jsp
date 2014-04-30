<!DOCTYPE html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.client" %>
<%@ page import="entities.facture" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>Imex | Invoice</title>
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
   <link href="assets/css/print.css" rel="stylesheet" type="text/css" media="print"/>
   <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="assets/css/pages/invoice.css" rel="stylesheet" type="text/css"/>
   <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
   <!-- END THEME STYLES -->
   <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
 
      <!-- BEGIN PAGE -->
      <div class="page-content">
         
         <div class="row hidden-print">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                  Invoice <small> IMEX</small>
               </h3>
             
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="invoice">
            <div class="row invoice-logo">
               <div class="col-xs-6 invoice-logo-space"><img src="assets/img/logo1.png" alt="" /> </div>
               <div class="col-xs-6">
                  <p>#<%=request.getAttribute("id") %> / <%=request.getAttribute("date") %> <span class="muted">Information Management Expert</span></p>
               </div>
            </div>
            <hr />
            <div class="row">
               <div class="col-xs-7">
                  <h4>Client:</h4>
                  <%
                   ArrayList<client> info_client = (ArrayList<client>) request.getAttribute("infoclient");
                   ArrayList<facture> info_facture = (ArrayList<facture>) request.getAttribute("factureinfo");
                       
                        	 %>
                   
                  <table cellspacing="5">
                  <%for ( int j=0; j<info_client.size();j++) {  %>
                     <tr>
                        <td>Full Name :</td>
                       
                        <td><%= info_client.get(0).getNom_resp() %>&nbsp;<%= info_client.get(0).getPrenom_resp() %></td>
                     </tr>
                     <tr>
                        <td>Email</td>
                        <td><%= info_client.get(j).getEmail_resp() %> </td>
                     </tr>
                     <tr>
                        <td>company</td>
                        <td><%= info_client.get(j).getMatricule_soc() %></td>
                     </tr>
                     <tr>
                        <td>Cell phone number</td>
                        <td><%= info_client.get(j).getNumtel() %></td>
                     </tr>
                    <% } %>
                  </table>
                   
                  
               </div>
            
            </div>
            <div class="row">
               <div class="col-xs-12">
                  <table class="table table-striped table-hover">
                     <thead>
                        <tr>
                           <th>#</th>
                           <th>Item</th>
                           <th class="hidden-480">Description</th>
                           <th class="hidden-480">Quantity</th>
                           <th class="hidden-480">Total Size</th>
                           <th>Total</th>
                        </tr>
                     </thead>
                     <tbody>
                     <%
                     double tot =0;
                     for ( int i=0; i<info_facture.size(); i++) { 
                    	double t = (double)Math.round((((double)info_facture.get(i).getSize()/1048576) * 100/1000)*1000)/1000; 
                    	 %>
                    
                        <tr>
                           <td><%=i+1 %></td>
                           <td><%=info_facture.get(i).getType() %></td>
                           <td class="hidden-480"><%=info_facture.get(i).getType() %> generated</td>
                           <td class="hidden-480"><%=info_facture.get(i).getQuantite() %></td>
                           <td class="hidden-480"><%=(double)Math.round(((double)info_facture.get(i).getSize()/1048576)*1000)/1000 %> MO</td>
                           <td><%= t %>DT</td>
                           <% 
                           		tot += t;
                           %>
                        </tr>
                        <% } %>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-4">
                  <div class="well">
                     <address>
                        <strong>Loop, Inc.</strong><br /> 
                        C1 RESIDENCE VENEZIA<br />
                        BERGES DU LAC II - 1053 Tunis<br />
                        <abbr title="Phone">Phone:</abbr> (+216) 71 190 234
                     </address>
                     <address>
                        <strong>Responsable Imex</strong><br />
                        <a href="mailto:#">contact@imex.com.tn</a>
                     </address>
                  </div>
               </div>
               <div class="col-xs-8 invoice-block">
                  <ul class="list-unstyled amounts">
                  
                     <li><strong>Sub - Total amount:</strong><%=(double) Math.round(tot*1000)/1000 %>DT</li>
                     <li><strong>Discount:</strong> 12.9%</li>
                     <% tot = tot - ((tot*12.9)/100); %>
                     <li><strong>Grand Total:</strong> <%=(double)Math.round(tot*1000) /1000 %></li>
                  </ul>
                  <br />
                  <a class="btn btn-lg blue hidden-print" onclick="javascript:window.print();">Print <i class="icon-print"></i></a>
                  
               </div>
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
         2013 &copy; Metronic by keenthemes.
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
         App.init();
      });
   </script>
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>