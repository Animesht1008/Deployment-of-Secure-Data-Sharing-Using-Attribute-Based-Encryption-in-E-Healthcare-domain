

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");

    System.out.println("Check User name And Password : " + mail + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM doctor_reg where email='" + mail + "' AND password='" + pass + "' AND status = 'Approved' ");
        if (rs.next()) {
            session.setAttribute("did", rs.getString("id"));
            session.setAttribute("dname", rs.getString("name"));
            session.setAttribute("dmail", rs.getString("email"));
            session.setAttribute("ddept", rs.getString("department"));

            response.sendRedirect("doctorHome.jsp?Success");
        } else {
            response.sendRedirect("doctorLogin.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>