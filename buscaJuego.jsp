<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
    <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.DriverManager"%>
            <%@page import="java.sql.Connection"%>
                <%@page contentType="text/html" pageEncoding="UTF-8"%>
                    <!DOCTYPE html>
                    <html lang="">

                    <head>
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">

                        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
                        <link rel="stylesheet" type="text/css" href="css/estilo.css">

                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

                        <!-- jQuery library -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

                        <!-- Popper JS -->
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

                        <!-- Latest compiled JavaScript -->
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


                        <title></title>
                    </head>

                    <body id="fondo-principal">
   
                                                <%   
       String email = request.getParameter("email");  
       String nomjue = request.getParameter("nomjue");
       ArrayList<String> a = new ArrayList<String>();
       ArrayList<String> b = new ArrayList<String>();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexionAL = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement sAL = conexionAL.createStatement();
        ResultSet juegosAL = sAL.executeQuery("SELECT * FROM TIENEN T"
          + " JOIN JUEGO J ON T.CODJUE=J.CODJUE WHERE NOMJUE= '"+ nomjue +"'"); 
        while (juegosAL.next()) {
            a.add("*");
        }
        
        conexionAL.close();
        
        if (a.isEmpty()){
          response.sendRedirect("usuario.jsp?email="+email+"&n=ver"); 
        } else {
          response.sendRedirect("usuario.jsp?email="+email+"&o=ver&j="+nomjue);
        }
        
        out.println(a.isEmpty());
        
        
        %>
 

                    </body>

              </html>

