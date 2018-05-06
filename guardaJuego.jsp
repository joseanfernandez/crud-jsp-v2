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
     
      String nomjue = request.getParameter("nomjue");
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del mail de usuario introducido
      String consultaMail = "SELECT * FROM JUEGO WHERE NOMJUE='"+nomjue+"'";
                                     
      
      ResultSet existe = s.executeQuery (consultaMail);
      existe.last();
      
      
        String insercion = "INSERT INTO JUEGO (NOMJUE,CODCAT) VALUES ("
          
          + " '" + request.getParameter("nomjue")
          + "', '" + request.getParameter("codcat") + "')";
        s.execute(insercion);
        
      
      conexion.close();
      response.sendRedirect("admin.jsp?email="+ emailAd+"&q=cambia"); 
 }
   catch(Exception e){       
       response.sendRedirect("admin.jsp?email="+ emailAd+"&p=error");      
   }
    %>


                        </body>

                        </html>
