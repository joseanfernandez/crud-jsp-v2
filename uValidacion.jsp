<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.Connection"%>
                    <%@page contentType="text/html" pageEncoding="UTF-8"%>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <title></title>
                        </head>

                        <body>
                            <%
    try{
        String email = request.getParameter("email");   
        String password = request.getParameter("pass");
        String sha1 = DigestUtils.sha1Hex(password); 
        out.println(email);
        out.println(password);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");    
        PreparedStatement pst = conn.prepareStatement("SELECT EMAIL,PASSW FROM AMIGO WHERE  EMAIL=? AND PASSW=?");
        pst.setString(1, email);
        pst.setString(2, sha1);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {     
           //out.println("Valid login credentials");
           response.sendRedirect("usuario.jsp?email="+ email);
        
        } else {
           
          
           response.sendRedirect("index.jsp?q=cambia");  
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }     
%>
                        </body>

                        </html>
