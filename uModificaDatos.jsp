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

                        <body id="fondo-principal">
                            <% 
      request.setCharacterEncoding("UTF-8");
      String email = request.getParameter("mail");
    %>
                                <header id="cabecera">
                                    <nav id="mynav" class="navbar navbar-expand-md navbar-dark fixed-top">
                                        <a class="navbar-brand" href="usuario.jsp?email=<% out.print(email); %>"><img id="milogo" src="img/diceW.png"></a>


                                        <div class="navbar-collapse collapse show" id="navbarCollapse" style>
                                            <form id="myForm"><input id="searchTerm" type="text" onkeyup="doSearch()" placeholder="Busca" onkeypress="mostrar()" /></form>
                                        </div>
                                        <ul class="navbar-nav mr-auto">
                                            <li class="nav-item active">


                                                <%    
        String user = request.getParameter("mail");
        String codamigo = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s = conexion.createStatement();
        ResultSet amigo = s.executeQuery("SELECT * FROM AMIGO WHERE email='"+user+"'"); 
        while (amigo.next()) {
            out.print("<form action='uModificaDatos.jsp' method='get'>");
            out.println("<input id='eluser' name='user' type='submit' class='nav-link' value='"+ amigo.getString("user")+"'/></li>");
            out.println("<input type='hidden' name='mail' value='"+email+"' />");
            out.print("</form>");
            codamigo = amigo.getString("codami");
        }
        conexion.close();
        
        %>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="index.jsp">Salir</a>
                                                    </li>
                                        </ul>

                                    </nav>
                                </header>

                                <main>
                                    <h2 id="h2form">Modifica tus datos</h2>
                                    <form id="modificadatos" action="uGuardaDatos.jsp" method="get">
                                        <%      
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
          Statement s2 = conexion2.createStatement();
          
          ResultSet dato = s2.executeQuery("SELECT * FROM AMIGO WHERE EMAIL='"+user+"'");
          while (dato.next()) {
       %>
                                            <label for="email">Email </label>
                                            <input class="onlyread" type="text" name="email" value="<%= dato.getString("email")%>" readonly />
                                            <label for="nom">Nombre </label>
                                            <input type="text" name="nom" value="<%= dato.getString("nom")%>" />
                                            <label for="ape">Apellido </label>
                                            <input type="text" name="ape" value="<%= dato.getString("ape")%>" />
                                            <label for="passw">Contraseña </label>
                                            <input type="password" name="passw" value="<%= dato.getString("passw")%>" />

                                            <%  
          }
          conexion2.close();
    %>
                                                <div id="envio">
                                                    <input id="btform" class="btn" type="submit" name="button" value="Enviar">
                                                </div>
                                                <a href="usuario.jsp?email=<% out.print(email); %>" id="registro">Volver</a>

                                    </form>

                                </main>
                                <div id="freepikcon">
                                    <div id="freepik">Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
                                </div>
                        </body>

                        </html>
