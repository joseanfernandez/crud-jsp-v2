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
      request.setCharacterEncoding("UTF-8");
      String mostrar = request.getParameter("q"); 
      String mostrar2 = request.getParameter("p"); 
      String email = request.getParameter("email");
    %>
                            <header id="cabecera">
                                <nav id="mynav" class="navbar navbar-expand-md navbar-dark fixed-top">
                                    <a class="navbar-brand" href="usuario.jsp?email=<% out.print(email); %>"><img id="milogo" src="img/diceW.png"></a>


                                    <div class="navbar-collapse collapse show" id="navbarCollapse" style>
                                        <input id="searchTerm" type="text" onkeyup="doSearchAdmin()" placeholder="Busca" />
                                    </div>
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active"><input id='eluser' name='user' type='submit' class='nav-link' value='Admin' /></li>

                                        <li class="nav-item">
                                            <a class="nav-link" href="index.jsp">Salir</a>
                                        </li>
                                    </ul>

                                </nav>
                            </header>

                            <main role="main">
                                <div class="mensaje" id="<% out.print(mostrar); %>">Actualizado correctamente</div>
                                <div class="mensaje2" id="<% out.print(mostrar2); %>">Error, ya existe en la BBDD</div>
                                <div class="contenido">

                                    <div class="mitadpantallaAdmin">
                                        <h2>Amigos</h2>
                                        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s2 = conexion2.createStatement();
        ResultSet dato = s2.executeQuery("SELECT * FROM AMIGO ORDER BY NOM,APE"
                                       );
        
        out.println("<table id='vistaAdmin' class='table-striped'>");
        while (dato.next()) {
            out.println("<form action='crudAmigo.jsp' method='GET'>");
            out.print("<tr><td class='tdnom'>"); 
            out.println("<input type='hidden' name='email' value='"+email+"'/>");
            out.println("<input class='busqueda' type='hidden' name='user' value='"+dato.getString("email")+"'>"
              + dato.getString("nom") + " "+ dato.getString("ape") + "</td>");
            
            out.print("<td class='tdbt'><button style='background-color: #6890A2; border:none;' name='button' value='update' type='submit' class='btn btn-success'>Modificar</button>");
            out.print("<button style='background-color: #d62d0d; border:none;' name='button' value='delete' type='submit' class='btn btn-danger' >Eliminar</button></tr></td> ");  
                    
            out.print("<input type='hidden' name='emailAd' value='"+email+"'/>");
            out.println("</form>");
        }
        out.println("</table>");
     
         
        conexion2.close(); 
            
        %>

                                    </div>

                                    <div class="mitadpantalla2">
                                        <div class="mitadpantalla3a">
                                            <h4>Alta de Amigo</h4>
                                            <form action="aValRegistro.jsp" method="get" id="formalta">
                                                <input type="email" name="email" value="" placeholder="Correo electrónico" />

                                                <input type="text" name="user" value="" placeholder="Nombre de usuario" />

                                                <input type="text" name="nom" value="" placeholder="Nombre" />

                                                <input type="text" name="ape" value="" placeholder="Apellidos" />

                                                <input type="password" name="passw" value="" placeholder="Contraseña" />
                                                <input type='hidden' name='emailAd' value='<% out.print(email); %>' />
                                                <div id="envio">
                                                    <input id="btform" class="btn" type="submit" name="button" value="Guardar">
                                                </div>

                                            </form>
                                        </div>
                                        <div class="mitadpantalla4a">

                                            <h4>Gestionar Juegos</h4>
                                            <form class="guardajuego" action="guardaJuego.jsp" method="get">
                                                <input type="text" name="nomjue" placeholder="Nombre" />
                                                <input type="hidden" name="emailAd" value="<% out.print(email); %>">
                                                <select name="codcat">
                            <option value="NULL"></option>
 <%    
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s3 = conexion3.createStatement();
        ResultSet cat = s3.executeQuery("SELECT * FROM CATEGORIA"); 
        while (cat.next()) {
            out.println("<option value='"+cat.getString("codcat")+"'>" + cat.getString("nomcat") + "</option>");
            
        }
        conexion3.close();
        
        %>               
                    </select>
                                                <button name='button' value='update' type='submit' class='btn btn-primary' style="background-color: #6890A2; border:none;">Guardar</button>
                                            </form>
                                            <form class="borrajuego" action="borraJuego.jsp" method="get">
                                                <input type="hidden" name="emailAd" value="<% out.print(email); %>">
                                                <select name="juego">
                         <option value="ninguno"> - Seleccionar - </option>
        <%    
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s5 = conexion5.createStatement();
        ResultSet actualiza = s5.executeQuery("SELECT * FROM JUEGO ORDER BY NOMJUE");
        while (actualiza.next()) {
            out.println("<option value='"+actualiza.getString("nomjue")+"'>" + 
              actualiza.getString("nomjue") + "</option>");
 
        }
        
        conexion5.close();
        
        %>
                         </select>
                                                <button name='button' value='update' type='submit' class='btn btn-primary' style="background-color: #d62d0d; border:none;">Eliminar</button>
                                            </form>

                                        </div>

                                    </div>

                                </div>

                            </main>
                            <div id="freepikcon">
                                <div id="freepik">Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
                            </div>

                    </body>

                    <script src="js/buscadorTabla.js" type="text/javascript"></script>
                    <script>
                        $(document).ready(function() {
                            setTimeout(function() {
                                $("#cambia").fadeIn(1500);
                            }, 0);
                        });

                        $(document).ready(function() {
                            setTimeout(function() {
                                $("#cambia").fadeOut(1500);
                            }, 3000);
                        });

                        $(document).ready(function() {
                            setTimeout(function() {
                                $("#error").fadeIn(1500);
                            }, 0);
                        });

                        $(document).ready(function() {
                            setTimeout(function() {
                                $("#error").fadeOut(1500);
                            }, 3000);
                        });

                    </script>

                    </html>
