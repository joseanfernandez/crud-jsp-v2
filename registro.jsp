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
                            <% String mostrar2 = request.getParameter("p"); %>

                                <div id="conregistro">

                                    <h2 id="h2une">Únete</h2>
                                    <form id="formregistro" action="valRegistro.jsp" method="get" class="form-control">
                                        <div class="enuso" id="<% out.print(mostrar2); %>">Correo electrónico o Usuario en uso</div>
                                        <input type="email" name="email" value="" placeholder="Correo electrónico" />

                                        <input type="text" name="user" value="" placeholder="Nombre de usuario" />

                                        <input type="text" name="nom" value="" placeholder="Nombre" />

                                        <input type="text" name="ape" value="" placeholder="Apellidos" />

                                        <input type="password" name="passw" value="" placeholder="Contraseña" />

                                        <div id="envio">
                                            <input id="btform" class="btn" type="submit" name="button" value="Enviar">
                                        </div>
                                        <a href="index.jsp" id="registro">Volver</a>
                                        <small class="mt-5 mb-3 text-muted">© LosJuegosDeMiAmigo 2018</small>
                                    </form>
                                </div>
                                <div id="freepikcon">
                                    <div id="freepik">Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
                                </div>
                        </body>
                        <script>
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
