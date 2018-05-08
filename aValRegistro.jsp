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
      
      String emailAd = request.getParameter("emailAd");
      try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del mail de usuario introducido
      String consultaMail = "SELECT * FROM AMIGO WHERE email='"
                                + request.getParameter("Email") + "'";      
      
      ResultSet existe = s.executeQuery (consultaMail);
      existe.last();
      
      if (existe.getRow() != 0) {
        out.println("El correo electrónico ya está en uso.");
      } else { 
        String password = request.getParameter("passw");
        String sha1 = DigestUtils.sha1Hex(password);
        String insercion = "INSERT INTO AMIGO (EMAIL, USER, NOM, APE, PASSW) VALUES ("
          
          + " '" + request.getParameter("email")
          + "', '" + request.getParameter("user")
          + "', '" + request.getParameter("nom")
          + "', '" + request.getParameter("ape")
          + "', '" + sha1 + "')";
        s.execute(insercion);
        
      }
      conexion.close();
      response.sendRedirect("admin.jsp?email="+ emailAd+"&q=cambia");
   
  
       }
   catch(Exception e){       
       response.sendRedirect("admin.jsp?email="+ emailAd+"&p=error");      
   }    
%>
                        </body>

                        </html>
