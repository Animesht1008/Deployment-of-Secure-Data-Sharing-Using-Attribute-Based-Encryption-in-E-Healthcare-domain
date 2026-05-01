
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fid = request.getParameter("fid");
    String pid = request.getParameter("pid");

    String did = (String) session.getAttribute("did");
    String dname = (String) session.getAttribute("dname");
    String dmail = (String) session.getAttribute("dmail");
    String dept = (String) session.getAttribute("ddept");
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("Select * from data_files where id ='" + fid + "' ");
        if (rs.next()) {
            String fname = rs.getString("filename");
            String pname = rs.getString("pname");
            String dkey = rs.getString("dkey");
            String utime = rs.getString("time");

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);
            int i = st1.executeUpdate("INSERT into request(filename, time, did, dname, dmail, department, status, pid, pname, dkey, fid, utime) values('" + fname + "','" + time + "','" + did + "','" + dname + "','" + dmail + "','" + dept + "','waiting','" + pid + "', '" + pname + "','" + dkey + "','" + fid + "','" + utime + "')");
            if (i != 0) {
                response.sendRedirect("search.jsp?requestsent");
            }
        } else {
            response.sendRedirect("search.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

