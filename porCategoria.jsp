<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.util.*"%>
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
      request.setCharacterEncoding("UTF-8");
      String mostrar = request.getParameter("q"); 
      String mostrar2 = request.getParameter("p");
      String mostrar3 = request.getParameter("o");
      String mostrar4 = request.getParameter("n");
      String juego = request.getParameter("j");
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
                                    
                                                <%   
HashMap<String, ArrayList<String>> m = new HashMap<String, ArrayList<String>>();
       
    ArrayList<String> a = new ArrayList<String>();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexionA = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement sA = conexionA.createStatement();
        ResultSet juegosA = sA.executeQuery("SELECT * FROM JUEGO J JOIN CATEGORIA C ON J.CODCAT=C.CODCAT WHERE NOMCAT='Dados' ORDER BY NOMJUE"); 
        while (juegosA.next()) {
            a.add(juegosA.getString("NOMJUE"));
        }
        conexionA.close();
        
    ArrayList<String> b = new ArrayList<String>();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexionB = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement sB = conexionB.createStatement();
        ResultSet juegosB = sB.executeQuery("SELECT * FROM JUEGO J JOIN CATEGORIA C ON J.CODCAT=C.CODCAT WHERE NOMCAT='Fichas' ORDER BY NOMJUE"); 
        while (juegosB.next()) {
            b.add(juegosB.getString("NOMJUE"));
        }
        conexionB.close();
        
    ArrayList<String> c = new ArrayList<String>();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexionC = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement sC = conexionC.createStatement();
        ResultSet juegosC = sC.executeQuery("SELECT * FROM JUEGO J JOIN CATEGORIA C ON J.CODCAT=C.CODCAT WHERE NOMCAT='Cartas' ORDER BY NOMJUE"); 
        while (juegosC.next()) {
            c.add(juegosC.getString("NOMJUE"));
        }
        conexionC.close();
        
    ArrayList<String> d = new ArrayList<String>();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexionD = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegos","root", "");
        Statement sD = conexionD.createStatement();
        ResultSet juegosD = sD.executeQuery("SELECT * FROM JUEGO J JOIN CATEGORIA C ON J.CODCAT=C.CODCAT WHERE NOMCAT='Tablero' ORDER BY NOMJUE"); 
        while (juegosD.next()) {
            d.add(juegosD.getString("NOMJUE"));
        }
        conexionD.close();
        

m.put("Dados",a);
m.put("Fichas",b);
m.put("Cartas",c);
m.put("Tablero",d);



        %>                                    
                                    <div class="contenido">
                                        <div class="col-lg-10 offset-1 row" style="margin-top: 50px;">
                                           
<% 
            for (Map.Entry <String,ArrayList<String>> pareja: m.entrySet()) {
              out.print("<div class='col-lg-4 offset-1 cat'><p id='title' style='display: inline';>");
                  out.print(pareja.getKey());
              out.print("</p><br/><div id='losJuegos' style='display: inline';><ul>");
                for(String juegos: pareja.getValue()) {
                    out.print("<li>"+juegos+"</li>");
                }
              out.print("</ul></div></div>");
            }
%>    
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
                        
                        window.onload = function alert() {
                            //mostrar = request.getParameter("q");
                            document.getElementById("ver").style.display = "inline-block";
                        };
                        
                        function verAmigos() {
                            //mostrar = request.getParameter("q");
                            document.getElementById("verAmigos").style.display = "inline-block";
                            document.getElementById("ver").style.display = "none";
                        };
                        
                        function noVer() {
                            
                            document.getElementById("verAmigos").style.display = "none";
                            document.getElementById("ver").style.display = "none";
                        };
                        
                       
                        
                        

                    </script>

                    </html>
