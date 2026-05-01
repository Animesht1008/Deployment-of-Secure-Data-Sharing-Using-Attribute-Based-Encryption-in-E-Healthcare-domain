
package Action;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.swing.JOptionPane.showMessageDialog;

public class patientRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("username");
            String mail = request.getParameter("email");
            String dob = request.getParameter("dob");
            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String pass = request.getParameter("pass");
           
            
            System.out.println("name" + name + "password" + pass + "address"+ address + "mail" + mail + "dob" + dob + "cell" + phone);

            Connection conn = SQLconnection.getconnection();
            String message = null;

            try {
                Statement st = conn.createStatement();

                ResultSet rs = st.executeQuery("Select * from patient_reg where name ='" + name + "'");
                
                if (rs.next()) {
                    
                    response.sendRedirect("patientLogin.jsp?Name_Exists");
                } else {

                    String sql = "insert into patient_reg(name, email, dob, gender, phone, address, password, age) values (?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, mail);
                    statement.setString(3, dob);
                    statement.setString(4, gender);
                    statement.setString(5, phone);
                    statement.setString(6, address);
                    statement.setString(7, pass);
                    statement.setString(8, age);
                    
                    int row = statement.executeUpdate();
                    if (row > 0) {

                        response.sendRedirect("patientLogin.jsp?Register_Success");
                    } else {
                        response.sendRedirect("patientLogin.jsp?Register_Failed");
                    }
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
