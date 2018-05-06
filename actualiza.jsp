<%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.Connection"%>
                    <%@page contentType="text/html" pageEncoding="UTF-8"%>
                        <!DOCTYPE html>
                        <html lang="es">

                        <head>
                            <meta charset="utf-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                            <!-- jQuery library -->
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                            <!-- Popper JS -->
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
                            <!-- Latest compiled JavaScript -->
                            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                            <link rel="stylesheet" type="text/css" href="css/estilo.css">
                            <meta charset="utf-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
                            <link rel="stylesheet" type="text/css" href="css/estilo.css">
                            <title>Modifica Datos</title>
                        </head>

                        <body>

                            <%      
    String button = request.getParameter("button");
    String juego = request.getParameter("juego");
    String codamigo = request.getParameter("codamigo");
    String email = request.getParameter("email");
   try {
    
    if (button.equals("update")) {
      
     
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");    
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM TIENEN WHERE  CODAMI=? AND CODJUE=?");
        pst.setString(1, codamigo);
        pst.setString(2, juego);
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {     
            // Devuelve a la pantalla sin actualizar, para que no se repita
            response.sendRedirect("usuario.jsp?email="+ email+"&p=error"); 
        
        } else {
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
            Statement s2 = conexion2.createStatement();
            String insercion = "INSERT INTO TIENEN (CODAMI,CODJUE) VALUES ('"+codamigo+"','"+juego+"')";
            s2.execute(insercion);
            conexion2.close(); 

            response.sendRedirect("usuario.jsp?email="+ email+"&q=cambia");
        }
    }
    


    if (button.equals("delete")) {
    
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");    
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM TIENEN WHERE  CODAMI=? AND CODJUE=?");
        pst.setString(1, codamigo);
        pst.setString(2, juego);
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {     
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
            Statement s = conexion.createStatement();
            String delete = "DELETE FROM TIENEN WHERE CODAMI='"+codamigo+"'AND CODJUE='"+juego+"'";
            s.execute(delete);
            conexion.close(); 

            response.sendRedirect("usuario.jsp?email="+ email+"&q=cambia");
        
        } else {
            // Devuelve a la pantalla sin actualizar, porque no podia borrar nada
            response.sendRedirect("usuario.jsp?email="+ email+"&p=error"); 
            
        }
    
    }
   }
    catch(Exception e){       
       response.sendRedirect("usuario.jsp?email="+ email+"&p=error");      
   }
    %>
                                </main>
                        </body>

                        </html>
