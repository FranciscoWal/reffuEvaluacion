<%
    HttpSession sesion = request.getSession();
    String id = (String) sesion.getAttribute("id");
    if (id == null) {
        response.sendRedirect("index.jsp");
    }
    Conexion conexion = new Conexion();
    int id1 = Integer.parseInt(id);
    List<Empresa> lista = conexion.mostrarIdE(id1);
%>
<%@page import="modelos.Empresa"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page import="bd.Conexion"%>
<!DOCTYPE html>           
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Empresa</title>
        <link rel="stylesheet" href="css/confi_empresa.css">
        <link rel="icon" href="img/minuicon.png">

    </head>
    <body>
        <header>
            <h3>Configuración de Empresa</h3>
            <div id="menu">
                <button><a href="principal_empresa.jsp"><img src="img/regreso.png" alt=""></a></button>
                <nav>
                    <ul>
                        <li><a href="#">CUENTA</a></li>
                        <li><a href="#">NOTIFICACIONES</a></li>
                        <li><a href="#">ACTIVIDAD</a></li>                
                    </ul>
                </nav>
            </div>
        </header>
        <section class="logotipo">
            <div class="conti">
                <nav>
                    <img src="img/Logotipo1.png" alt="">
                </nav>
            </div>
            <div class="container">
                <a href="vip.jsp"><img src="img/vip.png" alt=""></a>
                <aside>
                    <h1>MODIFICAR CUENTA</h1>
                    <h3>EMPRESA</h3>
                </aside>
                <div>
                    <form id="formulario" action="ModificarE" method="POST">
                        <div class="controls">
                            <input type="text" name="id" id="id" placeholder="Id" value=<%= lista.get(0).getId()%> readonly="" >
                            <!-- <span class="novisible" id="errorNombre">Escribe tu nombre y apellido</span> -->
                        </div>
                        <div class="controls">
                            <input type="text" name="name" id="name" placeholder="Nombre" value=<%= lista.get(0).getNombre()%>>
                            <!-- <span class="novisible" id="errorNombre">Escribe tu nombre y apellido</span> -->
                        </div>
                        <div class="controls">
                            <input type="text" name="nom_empre" id="nom_empre" placeholder="Nombre Empresa" value=<%= lista.get(0).getNombre_empresa()%>>
                            <!-- <span class="novisible" id="errorNomEmpresa">Escribe el nombre de la empresa</span> -->
                        </div>
                        <div class="controls">
                            <input type="email" name="email" id="email" placeholder="Correo" value=<%= lista.get(0).getCorreo()%>>
                            <!-- <span class="novisible" id="errorCorreo">Escribe el correo</span> -->
                        </div>
                        <div class="controls">
                            <input type="tel" name="telefono" id="telefono" placeholder="000-000-0000" value=<%= lista.get(0).getTelefono()%>>
                            <!-- <span class="novisible" id="errorTelefono">Escribe el numero de telefono</span> -->
                        </div>
                        <div class="controls">
                            <input type="password" name="password" id="password" placeholder="Contraseña" value=<%= lista.get(0).getContraseña()%>>
                            <!-- <span class="novisible" id="errorPassword">Escribe una contraseña</span> -->
                        </div>
                        <div>
                            <div>
                                <button type="submit">MODIFICAR</button>
                            </div>
                            <div>
                                <a href="EliminarE?id=<%= lista.get(0).getId()%>"></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <script src="js/scripts_reg_usuario.js"></script>
    </body>
</html>