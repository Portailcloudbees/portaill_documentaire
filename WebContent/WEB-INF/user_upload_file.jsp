<!DOCTYPE html>
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>IMEX | indexclient-File Upload</title>
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
   <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
   <link href="assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
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
         <a class="navbar-brand" href="index.html">
         <h3 style="color:white"> <b><center>I&nbsp;M&nbsp;E&nbsp;X</center></b></h3>
         </a>
         <!-- END LOGO -->
         <!-- BEGIN RESPONSIVE MENU TOGGLER --> 
         <!-- END RESPONSIVE MENU TOGGLER -->
         <!-- BEGIN TOP NAVIGATION MENU -->
         <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->
                        <li class="dropdown" id="header_notification_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                  data-close-others="true">
               <i class="icon-warning-sign"></i>
               <span class="badge">6</span>
               </a>
               <ul class="dropdown-menu extended notification">
                  <li>
                     <p>You have 14 new notifications</p>
                  </li>
                  <li>
                     <ul class="dropdown-menu-list scroller" style="height: 250px;">
                        <li>  
                           <a href="#">
                           <span class="label label-sm label-icon label-success"><i class="icon-plus"></i></span>
                           New user registered. 
                           <span class="time">Just now</span>
                           </a>
                        </li>
                        
                     </ul>
                  </li>
                  <li class="external">   
                     <a href="#">See all notifications <i class="m-icon-swapright"></i></a>
                  </li>
               </ul>
            </li>
            <!-- END NOTIFICATION DROPDOWN -->
            <!-- BEGIN INBOX DROPDOWN -->
            <li class="dropdown" id="header_inbox_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                  data-close-others="true">
               <i class="icon-envelope"></i>
               <span class="badge">5</span>
               </a>
               <ul class="dropdown-menu extended inbox">
                  <li>
                     <p>You have 12 new messages</p>
                  </li>
                  <li>
                     <ul class="dropdown-menu-list scroller" style="height: 250px;">
                      
                     </ul>
                  </li>
                  <li class="external">   
                     <a href="inbox.html">See all messages <i class="m-icon-swapright"></i></a>
                  </li>
               </ul>
            </li>
            <!-- END INBOX DROPDOWN -->
            <!-- END INBOX DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <img alt="" src="assets/img/avatar1_small.jpg"/>
               <span class="username">Bob Nilson</span>
               <i class="icon-angle-down"></i>
               </a>
               <ul class="dropdown-menu">
                  <li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a>
                  </li>
                  <li><a href="login.html"><i class="icon-key"></i> Log Out</a>
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
               <form class="sidebar-search" action="extra_search.html" method="POST">
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
               <a href="index_us.html">
               <i class="icon-home"></i> 
               <span class="title">Dashboard</span>
               <span class="selected"></span>
               </a>
            </li>
			<li>
               <a class="active" href="javascript:;">
               <i class="icon-folder-open"></i> 
               <span class="title">Files</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                  <li>
                     <a href="upload_file_us.html">
                     File Upload 
                     <span class="arrow"></span>
                     </a>
                  </li>
                 <li>
                     <a href="cons_up_us.html">
                     View File Upload
                     <span class="arrow"></span>
                     </a>
                  </li>
                 <li>
                     <a href="doc_traite_us.html">
                     View File Processed
                     <span class="arrow"></span>
                     </a>
                  </li>
				<li>
                     <a href="telecharge_file_us.html">
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
                     <a href="notification_us.html">
                     Cearte  Notification 
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
                     <a href="table_stat_us.html">
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
                  Portail Documentaire
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="index.html">Home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="#">Files </a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">File Upload</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="row">
            <div class="col-md-12">
               </br>
			   </br>
               <form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
                  <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                  <div class="row fileupload-buttonbar">
                     <div class="col-lg-7">
                        <!-- The fileinput-button span is used to style the file input field as button -->
                        <span class="btn green fileinput-button">
                        <i class="icon-plus"></i>
                        <span>Add files...</span>
                        <input type="file" name="files[]" multiple>
                        </span>
                        <button type="submit" class="btn blue start">
                        <i class="icon-upload"></i>
                        <span>Start upload</span>
                        </button>
                        <button type="reset" class="btn yellow cancel">
                        <i class="icon-ban-circle"></i>
                        <span>Cancel upload</span>
                        </button>
                        <button type="button" class="btn red delete">
                        <i class="icon-trash"></i>
                        <span>Delete</span>
                        </button>
                        <input type="checkbox" class="toggle">
                        <!-- The loading indicator is shown during file processing -->
                        <span class="fileupload-loading"></span>
                     </div>
                     <!-- The global progress information -->
                     <div class="col-lg-5 fileupload-progress fade">
                        <!-- The global progress bar -->
                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                           <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                        </div>
                        <!-- The extended global progress information -->
                        <div class="progress-extended">&nbsp;</div>
                     </div>
                  </div>
                  <!-- The table listing the files available for upload/download -->
                  <table role="presentation" class="table table-striped clearfix">
                     <tbody class="files"></tbody>
                  </table>
               </form>
               <div class="panel panel-success">
                  <div class="panel-heading">
                     <h3 class="panel-title">Demo Notes</h3>
                  </div>
                  <div class="panel-body">
                     <ul>
                        <li>The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).</li>
                        <li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).</li>
                        <li>Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).</li>
                     </ul>
                  </div>
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
   <script id="template-upload" type="text/x-tmpl">
      {% for (var i=0, file; file=o.files[i]; i++) { %}
          <tr class="template-upload fade">
              <td>
                  <span class="preview"></span>
              </td>
              <td>
                  <p class="name">{%=file.name%}</p>
                  {% if (file.error) { %}
                      <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                  {% } %}
              </td>
              <td>
                  <p class="size">{%=o.formatFileSize(file.size)%}</p>
                  {% if (!o.files.error) { %}
                      <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                      <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                      </div>
                  {% } %}
              </td>
              <td>
                  {% if (!o.files.error && !i && !o.options.autoUpload) { %}
                      <button class="btn blue start">
                          <i class="icon-upload"></i>
                          <span>Start</span>
                      </button>
                  {% } %}
                  {% if (!i) { %}
                      <button class="btn red cancel">
                          <i class="icon-ban-circle"></i>
                          <span>Cancel</span>
                      </button>
                  {% } %}
              </td>
          </tr>
      {% } %}
   </script>
   <!-- The template to display files available for download -->
   <script id="template-download" type="text/x-tmpl">
      {% for (var i=0, file; file=o.files[i]; i++) { %}
          <tr class="template-download fade">
              <td>
                  <span class="preview">
                      {% if (file.thumbnailUrl) { %}
                          <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                      {% } %}
                  </span>
              </td>
              <td>
                  <p class="name">
                      {% if (file.url) { %}
                          <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                      {% } else { %}
                          <span>{%=file.name%}</span>
                      {% } %}
                  </p>
                  {% if (file.error) { %}
                      <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                  {% } %}
              </td>
              <td>
                  <span class="size">{%=o.formatFileSize(file.size)%}</span>
              </td>
              <td>
                  {% if (file.deleteUrl) { %}
                      <button class="btn red delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                          <i class="icon-trash"></i>
                          <span>Delete</span>
                      </button>
                      <input type="checkbox" name="delete" value="1" class="toggle">
                  {% } else { %}
                      <button class="btn yellow cancel">
                          <i class="icon-ban-circle"></i>
                          <span>Cancel</span>
                      </button>
                  {% } %}
              </td>
          </tr>
      {% } %}
   </script>
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
   <script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
   <!-- END PAGE LEVEL PLUGINS-->
   <!-- BEGIN:File Upload Plugin JS files-->
   <!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
   <script src="assets/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
   <!-- The Templates plugin is included to render the upload/download listings -->
   <script src="assets/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
   <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
   <script src="assets/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
   <!-- The Canvas to Blob plugin is included for image resizing functionality -->
   <script src="assets/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
   <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
   <!-- The basic File Upload plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
   <!-- The File Upload processing plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
   <!-- The File Upload image preview & resize plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
   <!-- The File Upload audio preview plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
   <!-- The File Upload video preview plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
   <!-- The File Upload validation plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
   <!-- The File Upload user interface plugin -->
   <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
   <!-- The main application script -->
   <!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
   <!--[if (gte IE 8)&(lt IE 10)]>
   <script src="assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
   <![endif]-->
   <!-- END:File Upload Plugin JS files-->
   <script src="assets/scripts/app.js"></script>
   <script src="assets/scripts/form-fileupload.js"></script>
   <script>
      jQuery(document).ready(function() {
      // initiate layout and plugins
      App.init();
      FormFileUpload.init();
      });
   </script>
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>