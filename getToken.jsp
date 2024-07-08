<%-- 
    Document   : get_token
    Created on : 9 Jan, 2021, 6:45:23 PM
    Author     : JAVA-JP
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String did = request.getParameter("did");
    String dname = request.getParameter("dname");
    String dmail = request.getParameter("dmail");

    System.out.println("Check Doctor id And name : " + did + dname);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement sto = con.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);

    try {
        ResultSet rs = st.executeQuery("SELECT * FROM search_token where did='" + did + "'");
        if (rs.next() == true) {
            
            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = st1.executeUpdate("update search_token set search_token='" + Search_token + "' WHERE did = '"+ did +"'");
            
           
            String msggg = "Hi, " + dname + " \nYour File Search Token : " + Search_token + "";
            Mail ma = new Mail();
            ma.secretMail(msggg, "Search_token", dmail);
            String msg = "File Search Token:" + msggg;
            System.out.println("success");

            response.sendRedirect("getSearchToken.jsp?Success");
        } else {

            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = sto.executeUpdate("insert into search_token(did, dname, time , status , search_token)values('" + did + "', '" + dname + "', '" + time + "', 'Approved', '" + Search_token + "')");;
            if (i != 0) {

                String msggg = "Hi, " + dname + " \n Your File Search Token : " + Search_token + "";
                Mail ma = new Mail();
                ma.secretMail(msggg, "Search_token", dmail);
                String msg = "File Search Token:" + msggg;
                System.out.println("success");
            response.sendRedirect("getSearchToken.jsp?Success");
            }
            else {
            response.sendRedirect("getSearchToken.jsp?Failed");
        }
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>