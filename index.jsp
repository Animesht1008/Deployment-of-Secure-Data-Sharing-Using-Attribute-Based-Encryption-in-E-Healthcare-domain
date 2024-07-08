 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
         <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container-fluid col-11 d-flex align-items-center">

                <h1 class="logo me-auto navbar-brand"><a href="index.jsp"></a></h1>
     
                    <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            
          <li ><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
                                    <li><a class="nav-link scrollto" href="patientLogin.jsp">Patient</a></li>
                                    <li><a class="nav-link scrollto" href="doctorLogin.jsp">Doctor</a></li>
                                    <li><a class="nav-link scrollto" href="taLogin.jsp">Trusted Authority</a></li>
                                    <li><a class="nav-link scrollto" href="cloudLogin.jsp">Cloud</a></li>
            </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>Secure Data Share</h1>
      <h2>Using Advanced Encryption Standard for E-Healthcare Cloud</h2>
      <a href="patientLogin.jsp" class="btn-get-started scrollto" style="text-decoration: none;">patients</a>
      <a href="doctorLogin.jsp" class="btn-get-started scrollto" style="text-decoration: none;">Doctors</a>
    </div>
  </section><!-- End Hero -->

  

        <section class="our-services" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h1>ABSTRACT</h1>
                        </div>
                    </div> 
                </div> 
                <div class="row">
                    <div class="col-md-12">
                        <div class="featured-item">
                            <p align="justify" style="font-size:19px">
                                E-Healthcare systems are increasingly popular due to the introduction of wearable healthcare devices and sensors.
                                Personal health records (PHRs) are collected by these devices and stored in a remote cloud. Due to privacy concern, these records
                                should not be accessible by any unauthorized party, and the cloud providers should not be able to learn any information from the stored
                                records. To address the above issues, one promising solution is to employ Advanced Encryption Standard (AES) for fine-grained access
                                control and searchable encryption for keyword search on encrypted data. However, most of existing ABE schemes leak the privacy of
                                access policy which may also contain sensitive information. On the other hand, for users’ devices with limited computing power and
                                bandwidth, the mechanism should enable them to be able to search the PHRs efficiently. Unfortunately, most existing works on ABE do
                                not support efficient keyword search on encrypted data. In this work, we propose an efficient hidden policy ABE scheme with keyword
                                search. Our scheme enables efficient keyword search with constant computational overhead and constant storage overhead.
                                Moreover, we enhance the recipient’s privacy which hides the access policy. As of independent interest, we present a trapdoor
                                malleability attack and demonstrate that some of previous schemes may suffer from such attack.
                            </p>
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
