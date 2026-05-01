
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Secure Data Sharing Using  AB Encryption Techniques for E-Healthcare Cloud</title>

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

      <h1 class="logo me-auto navbar-brand"><a href="index.jsp"></a></h1>
     
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            
          <li ><a class="nav-link scrollto " href="cloudHome.jsp">Home</a></li>
                                    <li><a class="nav-link scrollto " href="cloudFiles.jsp">Cloud Files</a></li>
                                    <li><a class="nav-link scrollto " href="patientDetails1.jsp">Patient Details</a></li>
                                    <li><a class="nav-link scrollto " href="doctorDetails1.jsp">Doctor Details</a></li>
                                    <li><a class="nav-link scrollto active" href="graph.jsp">Graph</a></li>
                                    <li><a class="nav-link scrollto" href="index.jsp">Log out</a></li>
            </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="graph" class="d-flex align-items-center">
    <div class="container">
        <h1 style="color: black">Secure Data Share</h1>
      <h2 style="color: black">Using  AB Encryption Techniques for E-Healthcare Cloud</h2>
          </div>
  </section><!-- End Hero -->

        <section class="our-services" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h1>Analysis</h1>
                        </div>
                    </div> 
                </div> 
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String val1 = "", val2 = "", val3 = "";
                            String val11 = "", val22 = "", val33 = "";
                            int i = 0;

                            try {
                                Connection con = SQLconnection.getconnection();

                                Statement st1 = con.createStatement();
                                ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  data_files ");
                                rs2.next();
                                {
                                    val2 = rs2.getString("AVG(enc_time)");
                                }
                                rs2.close();
                                Statement st2 = con.createStatement();
                                ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                rs3.next();
                                {
                                    val3 = rs3.getString("AVG(decrypt_time)");
                                }
                                System.out.println("count------------------> " + val2);
                                System.out.println("count------------------> " + val3);

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        <script type="text/javascript">
                            window.onload = function () {

                                var chart = new CanvasJS.Chart("chartContainer", {
                                    animationEnabled: true,
                                    exportEnabled: true,
                                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                                    title: {
                                        text: ""
                                    },
                                    axisY: {
                                        title: "Time in MS"
                                    },
                                    data: [{
                                            type: "column",
                                            showInLegend: true,
                                            legendMarkerColor: "grey",
                                            legendText: "Entities",
                                            dataPoints: [
                                                {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                            ]
                                        }]
                                });
                                chart.render();
                            }
                        </script>
                        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                    </div>
                </div>
            </div>
        </section>

        <div class="sub-footer">
            <p>.</p>
        </div>


        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                            // First circle
                            new Circlebar({
                                element: "#circle-1",
                                type: "progress",
                                maxValue: "90"
                            });

                            // Second circle
                            new Circlebar({
                                element: "#circle-2",
                                type: "progress",
                                maxValue: "84"
                            });

                            // Third circle
                            new Circlebar({
                                element: "#circle-3",
                                type: "progress",
                                maxValue: "60"
                            });

                            // Fourth circle
                            new Circlebar({
                                element: "#circle-4",
                                type: "progress",
                                maxValue: "74"
                            });

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/datepicker.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
