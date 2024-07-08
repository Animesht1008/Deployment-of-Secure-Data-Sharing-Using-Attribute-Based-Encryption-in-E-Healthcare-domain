/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

/**
 *
 * @author JAVA-JP
 */
import DBconnection.SQLconnection;
import Networks.DRIVE_Network;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author java3
 */
public class dataUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    File file;
    final String filepath = "D:/";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            MultipartRequest m = new MultipartRequest(request, filepath);
            String age = m.getParameter("age");
            String department = m.getParameter("dept");
            String blood_group = m.getParameter("blood_group");
            String heart_rate = m.getParameter("heart_rate");
            String height = m.getParameter("height");
            String weight = m.getParameter("weight");
            String blood_pressure = m.getParameter("blood_pressure");
            String blood_sugar = m.getParameter("blood_sugar");
            File file = m.getFile("fileToUpload");
            String filename = file.getName().toLowerCase();
            
          

            Connection con = SQLconnection.getconnection();

            BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
            StringBuffer sb = new StringBuffer();
            String temp;

            while ((temp = br.readLine()) != null) {
                sb.append(temp);
                sb.append("\n"); 
            }

            KeyGenerator Attrib_key = KeyGenerator.getInstance("AES");
            Attrib_key.init(128);
            SecretKey secretKey = Attrib_key.generateKey();
            System.out.println("++++++++ key:"   + secretKey);
            
            long aTime = System.nanoTime();
            
            Encryption e = new Encryption();
            String encryptedtext = e.encrypt(sb.toString(), secretKey);
            
            long bTime = System.nanoTime();
            float encryptTime = (bTime - aTime) / 1000;
            System.out.println("Time taken to Encrypt File: " + encryptTime + " microseconds.");
            //storing encrypted file
            FileWriter fw = new FileWriter(file);
            fw.write(encryptedtext);
            int hash1 =encryptedtext.hashCode();
            fw.close();
            byte[] b = secretKey.getEncoded();
            String Dkey = Base64.encode(b);
            System.out.println("converted secretkey to string:" + Dkey);
            

            HttpSession user = request.getSession(true);
            String pname = user.getAttribute("pname").toString();
            String pid = user.getAttribute("pid").toString();
            String pmail = user.getAttribute("pmail").toString();

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("current Date " + time);

            boolean status = new DRIVE_Network().upload(file);
            if (status) {

                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
               
            System.out.println("Check------------------------------------------------------------------>>>>>");
            
                int i = st.executeUpdate("insert into data_files(pid, pname, enc_data, dkey, time, filename, data, enc_time, age, blood_group, occupation, height, weight, blood_pressure, blood_sugar, department)values('" + pid + "','" + pname + "','" + encryptedtext + "','" + Dkey + "','" + time + "','" + file.getName() + "','" + sb.toString() + "','"+ encryptTime +"','"+ age +"','"+ blood_group +"','"+ heart_rate +"','"+ height +"','"+ weight +"','"+ blood_pressure +"','"+ blood_sugar +"','"+ department +"')");
                String sql = "insert into encrypted_details(pid, pname, age, blood_group, heart_rate, height, weight, blood_pressure, blood_sugar, department, dkey, filename, time)values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(1, pid);
                    statement.setString(2, pname);
                    statement.setString(3, new TDES().encrypt(age));
                    statement.setString(4, new TDES().encrypt(blood_group));
                    statement.setString(5, new TDES().encrypt(heart_rate));
                    statement.setString(6, new TDES().encrypt(height));
                    statement.setString(7, new TDES().encrypt(weight));
                    statement.setString(8, new TDES().encrypt(blood_pressure));
                    statement.setString(9, new TDES().encrypt(blood_sugar));
                    statement.setString(10, department);
                    statement.setString(11, Dkey);
                    statement.setString(12, file.getName());
                    statement.setString(13, time);
                    
                    int row = statement.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("uploadFile.jsp?File_uploaded");

                } else {
                    response.sendRedirect("uploadFile.jsp?Upload_failed");
                    System.out.println("Error in SQL Syntex");
                }
            } 
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
