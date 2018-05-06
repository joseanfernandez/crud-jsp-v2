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
        String insercion = "INSERT INTO AMIGO (EMAIL, USER, NOM, APE, PASSW) VALUES ("
          
          + " '" + request.getParameter("email")
          + "', '" + request.getParameter("user")
          + "', '" + request.getParameter("nom")
          + "', '" + request.getParameter("ape")
          + "', '" + request.getParameter("passw") + "')";
        s.execute(insercion);
        
      }
      conexion.close();
      
       response.sendRedirect("index.jsp?p=ok"); 
    
  
            
        
   }
   catch(Exception e){       
       response.sendRedirect("registro.jsp?p=error");    
   }     
%>
                        </body>

                        </html>
