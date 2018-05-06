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
                                        <form id="myForm"><input id="searchTerm" type="text" onkeyup="doSearch()" placeholder="Busca" onkeypress="mostrar()" /></form>
                                    </div>
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">


                                            <%    
        
        String codamigo = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s = conexion.createStatement();
        ResultSet amigo = s.executeQuery("SELECT * FROM AMIGO WHERE EMAIL='"+email+"'"); 
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

                            <main role="main">
                                <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s2 = conexion2.createStatement();
        ResultSet dato = s2.executeQuery("SELECT * FROM AMIGO ORDER BY NOM,APE"
                                       );
        out.println("<div id='ddatos'>");
        out.println("<table id='datos'>");
        while (dato.next()) {
            out.println("<form action='amigo.jsp' method='GET'>");
            out.print("<tr><td>"); 
            out.println("<input type='hidden' name='email' value='"+email+"'/>");
            out.println("<button class='busqueda' type='submit' name='user' value= '" + dato.getString("user") + "'>"
              + dato.getString("nom") + " "+ dato.getString("ape") + "</button></td></tr>");
            out.print("<input type='hidden' value='"+email+"'/>");
            out.println("</form>");
        }
        out.println("</table>");
        out.println("</div>");
         
        conexion2.close(); 
            
        %>
                                    <div class="mensaje" id="<% out.print(mostrar); %>">Actualizado correctamente</div>
                                    <div class="mensaje2" id="<% out.print(mostrar2); %>">Error</div>
                                    <div class="contenido">

                                        <div class="mitadpantalla">
                                            <h2>Mis Juegos</h2>
                                            <table id="tablajuegos" class="table table-striped">
                                                <%    
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s3 = conexion3.createStatement();
        ResultSet juegos = s3.executeQuery("SELECT * FROM TIENEN T JOIN  AMIGO A ON T.CODAMI=A.CODAMI"
          + " JOIN JUEGO J ON T.CODJUE=J.CODJUE WHERE EMAIL='"+email+"' ORDER BY NOMJUE"); 
        while (juegos.next()) {
            out.println("<tr><td>" + juegos.getString("nomjue") + "</td></tr>");
            
        }
        conexion3.close();
        
        %>
                                            </table>

                                        </div>

                                        <div class="mitadpantalla2">
                                            <div class="mitadpantalla3">
                                                <h2>Top amigos</h2>
                                                <table id="tablatop">
                                                    <%    
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s4 = conexion4.createStatement();
        ResultSet top = s4.executeQuery("SELECT USER, COUNT(*) AS 'JUEGOS' FROM AMIGO A JOIN TIENEN T ON A.CODAMI=T.CODAMI" +
          " GROUP BY A.CODAMI ORDER BY JUEGOS DESC LIMIT 3");
        while (top.next()) {
            out.println("<tr><td>" + top.getString("user") + "</td><td>"
              + top.getString("juegos") + "</td></tr>");
            
        }
        conexion4.close();
        
        %>
                                                </table>
                                            </div>
                                            <div class="mitadpantalla4">

                                                <h2>¿Alguna novedad?</h2>

                                                <form action="actualiza.jsp" id="selecjuego">
                                                    <select name="juego">
        <%    
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement s5 = conexion5.createStatement();
        ResultSet actualiza = s5.executeQuery("SELECT * FROM JUEGO ORDER BY NOMJUE");
        while (actualiza.next()) {
            out.println("<option value='"+actualiza.getString("codjue")+"'>" + 
              actualiza.getString("nomjue") + "</option>");
              
            
        }
        
        conexion5.close();
        
        %>
                         </select>

                                                    <div id="botonesjuegos" class="btn-group">
                                                        <button style='background-color: #6890A2; border:none;' name="button" value="update" type="submit" class="btn btn-success">Añadir Juego</button>
                                                        <button style='background-color: #d62d0d; border:none;' name="button" value="delete" type="submit" class="btn btn-danger">Eliminar Juego</button>
                                                    </div>
                                                    <input type="hidden" name="codamigo" value="<% out.print(codamigo); %>">
                                                    <input type="hidden" name="email" value="<% out.print(email); %>">
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
