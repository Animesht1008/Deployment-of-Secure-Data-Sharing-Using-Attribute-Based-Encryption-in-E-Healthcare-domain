
<%@page import="Networks.Mail"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String rid = request.getParameter("rid");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update request set status='Approved' where id='" + rid + "' ");
        System.out.println("test print==" + rid);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from request where id = '" + rid + "' ");
            if (rs.next()) {
                String fname = rs.getString("filename");
                String dkey = rs.getString("dkey");
                String mail = rs.getString("dmail");
                String msggg = "Your PHR Access Request is Appoved! \nSecret Key to Access PHR : " + dkey;
                Mail ma = new Mail();
                ma.secretMail(msggg, "SecretKey", mail);
                String msg = "Secret:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("fileRequest.jsp?Approved");
            } else {
                System.out.println("failed");
                response.sendRedirect("fileRequest.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
