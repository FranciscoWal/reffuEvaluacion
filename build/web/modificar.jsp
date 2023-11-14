<%
    HttpSession sesion = request.getSession();
    String id = (String) sesion.getAttribute("id");
    if (id == null) {
        response.sendRedirect("index.jsp");
    }
    Conexion conexion = new Conexion();
    int id1 = Integer.parseInt(id);
    List<Usuario> lista = conexion.mostrarId(id1);
%>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page import="bd.Conexion"%>
<!DOCTYPE html>           
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Usuario</title>
        <link rel="stylesheet" href="css/confi_usuario.css">
        <link rel="icon" href="img/minuicon.png">

    </head>
    <body>
        <header>
            <h3>Configuración de Usuario</h3>
            <div id="menu">
                <button><a href="principal.jsp"><img src="img/regreso.png" alt=""></a></button>
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
                    <h3>USUARIO</h3>
                </aside>
                <div>
                    <form id="formulario" action="Modificar" method="POST">
                        <div class="controls">
                            <input type="text" name="id" id="id" placeholder="Id" value=<%= lista.get(0).getId()%> readonly="" >
                            <!-- <span class="novisible" id="errorNombre">Escribe tu nombre y apellido</span> -->
                        </div>
                        <div class="controls">
                            <input type="text" name="name" id="name" placeholder="Nombre y Apellido" value=<%= lista.get(0).getNombre()%>>
                            <!-- <span class="novisible" id="errorNombre">Escribe tu nombre y apellido</span> -->
                        </div>
                        <div class="controls">
                            <input type="text" name="usuario" id="name_usuario" placeholder="Nombre Usuario" value=<%= lista.get(0).getUsuario()%>>
                            <!-- <span class="novisible" id="errorNomEmpresa">Escribe el nombre de usuario</span> -->
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
                                <a href="Eliminar?id=<%= lista.get(0).getId()%>"></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
                            <!--
        <footer>
            <div class="s1">
                <h1>Información</h1>
                <a href="#"><img src="img/Logotipo1.png" alt=""></a>
                <p>REFFU.06@gmail.com</p>
                <p>427-227-1735</p>
            </div>
            <div class="s2">
                <h1>¡Conocenos!</h1>
                <a href="#">Sobre nosotros</a>
                <a href="vip.jsp">Planes y Servicios</a>
                <a href="#">Politicas de privacidad</a>
                <a href="#">Términos y Condiciones</a>
            </div>
            <div class="s3">
                <h1>Redes</h1>
                <div class="redes-logos">
                    <a href="https://wa.me/message/TCSINCUCH65RM1"><img src="img/red1.png" alt=""></a>
                    <a href="https://www.facebook.com/profile.php?id=100078991177292"><img src="img/red2.png" alt=""></a>
                    <a href="https://www.youtube.com/channel/UCUR7vAnGM-hRWqCCNpzHz9A"><img src="img/red3.png" alt=""></a>
                    <a href="https://www.instagram.com/reffu_lo_mejor_para_ti/"><img src="img/instagram.png" alt=""></a>
                </div>
            </div>
        </footer>  -->                      
        <script src="js/scripts_reg_usuario.js"></script>
    </body>
</html>