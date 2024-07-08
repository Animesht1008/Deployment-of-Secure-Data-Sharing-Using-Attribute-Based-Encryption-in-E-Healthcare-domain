

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Secure Data Sharing Using Advanced Encryption Standard for E-Healthcare Cloud</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">


        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="css/hero-slider.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <%
        if (request.getParameter("Failed") != null) {
    %>
    <script>alert('Login Failed');</script>
    <%            }
    %>
    <body>
        <header id="header" class="fixed-top">
            <div class="container-fluid col-11 d-flex align-items-center">

                <h1 class="logo me-auto"><a href="index.html"></a></h1>
     
                    <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            
          <li ><a class="nav-link scrollto active" href="doctorHome.jsp">Home</a></li>
                                    <li><a class="nav-link scrollto" href="getSearchToken.jsp">Get Search Token</a></li>
                                    <li><a class="nav-link scrollto" href="search.jsp">Search</a></li>
                                    <li><a class="nav-link scrollto active" href="requestedFiles.jsp">Requested Files</a></li>
                                    <li><a class="nav-link scrollto" href="index.jsp">Log Out</a></li>
            </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
        <h1 style="color: black">Secure Data Share</h1>
      <h2 style="color: black">Using Advanced Encryption Standard for E-Healthcare Cloud</h2>
      <a href="#download" class="btn-get-started scrollto" style="text-decoration: none;">DOWNLOAD</a>
    </div>
  </section>
        <section class="our-services" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h1 id="download">Download File</h1>
                        </div>
                    </div> 
                </div> 
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-lg-6">
                            <img src="img/download.jpg" width="450" height="400">
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <%
                                    String rid = request.getParameter("rid");
                                    String fid = request.getParameter("fid");
                                    String utime = request.getParameter("utime");

                                    System.out.println("Request ID : " + rid);
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    Statement st1 = con.createStatement();
                                    try {
                                        ResultSet rt = st1.executeQuery("Select * from request where id = '" + rid + "' AND status = 'Approved' ");
                                        if (rt.next()) {
                                %>
                                <form action="download1.jsp" method="post">
                                    <div class="col-lg-10">
                                        <fieldset>
                                            <input type="hidden" value="<%=fid%>" name="fid">
                                            <input type="hidden" value="<%=rid%>" name="rid">
                                            <input type="hidden" value="<%=utime%>" name="utime">
                                            <label>Secret Key :</label><br><br>
                                            <input type="text" name="dkey" class="form-control" placeholder="Enter Secret Key" autocomplete="off" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset><br><br>
                                            <i><button type="submit" class="btn btn-info btn-lg btn-circle fa fa-download">&nbsp;Download</button></i>
                                        </fieldset>
                                    </div>
                                </form>
                                <%                                        } else {
                                            response.sendRedirect("requestedFiles.jsp?Access_Not_Approved");
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }


                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="sub-footer">
            <br><br><br><br>
            <p>.</p>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/datepicker.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
