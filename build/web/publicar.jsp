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
<%@page import="java.util.List"%>
<%@page import="modelos.Empresa"%>
<%@page import="bd.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo_publicar.css">
        <title>Publicacion</title>
        <link rel="icon" href="img/minuicon.png">
        <link rel="icon" href="img/Logo Sencillo.png">
    </head>
    <body>
        <header>
            <div class="conti">
                <div class="nav1">
                    <nav>
                        <a href="#"><img src="img/Logotipo1.png" alt=""></a>
                    </nav>
                </div>
                <div class="nav2">
                    <div class="img1">
                        <img id="perfFoto" src="MostrarFotoE?id=<%= lista.get(0).getId()%>">
                    </div>
                    <span class="nav-bar" id="btnMenu"><img src="img/triangulo (2).png" alt="" width="30px"></span>
                    <!-- <nav class="main-nav">
                        <ul class="menu" id="menu">
                            <li class="menu_item"><a href="principal.html" class="menu_link">Perfil</a></li>
                            <li class="menu_item"><a href="confi_usuario.html" class="menu_link">Configuración</a></li>
                            <li class="menu_item"><a href="principal.html" class="menu_link">Menu</a></li>
                            <li class="menu_item"><a href="Cerrar" class="menu_link">Salir</a></li>
                        </ul>
                    </nav> -->
                </div>
            </div>        
        </header>
        <section>
            <div class="container">
                <div class="navi">
                    <div class="p1">
                        <p>Nueva publicacion</p>
                    </div>
                </div>
                <div class="empresa">
                    <img src="img/Empresa.png" alt="">
                    <label for=""><%= lista.get(0).getNombre_empresa()%> </label>
                </div>
                <div class="formi">
                    <form action="Publicar" method="POST" id="formulario" enctype="multipart/form-data">
                        <div class="controls">
                            <input type="file" name="foto" id="foto">   
                        </div>
                        <label for="">Fotos: 0/10 - Elige primero la foto principal de la publicación</label>
                        <div class="controls">
                            <input type="text" name="titulo" id="titulo" placeholder="Titulo">                    
                        </div>
                        <div class="controls">
                            <input type="text" name="informacion" id="informacion" placeholder="Información">
                        </div>           
                        <div class="navi">
                            <div class="p2">
                                <button type="submit">Publicar</button>                    
                            </div>
                        </div>
                    </form>
                </div>
                <div class="ubi">
                    <p class="head">Ubicacion</p>
                    <p>San Juan del Rio - 76800 - <a href="#">Editar</a></p>
                </div>
                <div class="informacion">
                    <div class="co">
                        <p>
                            Los artículos publicados serán públicos, por lo que cualquier persona dentro y fuera de REFF-U puede verlos.
                        </p>
                        <p>
                            Antes de que las persona puedan verlas, todas las publicaciones se someten a una revisión estándar rápida para garantizar que cumplen nuestras Políticas de comercio. No estar permitidos los artículos como animales, drogas, armas, falsificaciones, etc.
                        </p>
                    </div>
                </div>
            </div>
        </section>
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
        </footer>
    </body>
</html>