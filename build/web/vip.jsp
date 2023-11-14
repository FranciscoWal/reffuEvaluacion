<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="bd.Conexion"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VIP</title>
        <link rel="stylesheet" href="css/vip.css">
        <link rel="icon" href="img/Logo Sencillo.png">
        <link rel="icon" href="img/minuicon.png">
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
                        <img id="perfFoto" src="MostrarFoto?id=<%= lista.get(0).getId()%>">
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
        <section class="informacion">
            <div class="p1"><img src="img/comidas.png" alt=""></div>
            <div class="p2">
                <p class="pa1">Comenta sin limites y obten recompensas!</p>
                <label for="" class="pa2"><a href="#"><img src="img/vip2.png" alt=""></a></label>
                <label for="">y consigue acceso a un sin fin de rankeos</label>
                <label for="">y comentarios en nuestra plataforma, cencela cuando quieras.</label>
            </div>
            <div class="p3"><img src="img/comidas.png" alt=""></div>
        </section>
        <section class="promociones">
            <div class="oferta">
                <img src="img/oferta.png" alt="">
            </div>
            <div class="precios">
                <div class="prec1">
                    <img src="img/12m.png" alt="">
                    <div class="button">
                        <button>Suscribete Ya</button>
                    </div>
                </div>
                <div class="prec2">
                    <img src="img/1m.png" alt="">
                    <div class="button">
                        <button>Suscribete Ya</button>
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
                <a href="#">Planes y Servicios</a>
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
