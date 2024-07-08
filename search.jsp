
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Secure Data Sharing Using Advanced Encryption Standard for E-Healthcare Cloud</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        
  <!-- Favicons -->
       
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
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
    <body>
<header id="header" class="fixed-top">
    <div class="container-fluid col-11 d-flex align-items-center">

      <h1 class="logo me-auto navbar-brand"><a href="index.html"></a></h1>
     
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            
          <li ><a class="nav-link scrollto " href="doctorHome.jsp">Home</a></li>
                                    <li><a class="nav-link scrollto " href="getSearchToken.jsp">Get Search Token</a></li>
                                    <li><a class="nav-link scrollto active " href="search.jsp">Search</a></li>
                                    <li><a class="nav-link scrollto" href="requestedFiles.jsp">Requested Authority</a></li>
                                    <li><a class="nav-link scrollto" href="index.jsp">Log Out</a></li>
            </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="search1" class="d-flex align-items-center">
    <div class="container">
       <h1>Secure Data Share</h1>
      <h2>Using Advanced Encryption Standard for E-Healthcare Cloud</h2>
      <a href="#search" class="btn-get-started scrollto g-6" style="text-decoration: none;">Search</a>
    </div>
  </section><!-- End Hero -->

        <section class="our-services" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h1 id="search">Search File</h1>
                        </div>
                    </div> 
                </div> 
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-lg-6">
                            <img src="img/search1.jpg" width="450" height="400">
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <form action="searchAction.jsp" method="post">
                                    <div class="col-lg-10">
                                        <fieldset>
                                            <label>Search Token :</label><br>
                                            <input type="text" name="token" class="form-control" placeholder="Enter Search Token" required=""><br>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-10">
                                        <fieldset>
                                            <label style="float: left">Patient Name :</label><br>
                                            <input type="text" name="pname" class="form-control" placeholder="Enter Patient Name" required=""><br>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <i><button type="submit" class="btn btn-info btn-lg btn-circle fa fa-search">&nbsp;Search</button></i>
                                        </fieldset>
                                    </div>
                                </form>
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
