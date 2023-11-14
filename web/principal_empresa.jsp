<%@page import="modelos.Comentario"%>
<%@page import="java.util.List"%>
<%@page import="bd.Conexion"%>
<%@page import="modelos.Publicacion"%>
<%
    HttpSession sesion = request.getSession();
    String id = (String) sesion.getAttribute("id");
    if (id == null) {
        response.sendRedirect("index.html");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Empresa"%>
<%@page import="modelos.Usuario"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal_empresa.css">
        <link rel="stylesheet" href="css/pubicacion.css"/>
        <link rel="stylesheet" href="css/menu.css"/>
        <title>REFF-U</title>
        <link rel="icon" href="img/minuicon.png">
    </head>
    <body>
        <nav>
            <div id="navegador">
                <div id="logos">
                    <div class="container">
                        <div class="btn-menu">
                            <label for="btn-menu"><img src="img/btnHamburguesa.png" alt="alt"/></label>
                        </div>
                    </div>
                    <div id="Logo1">
                        <img src="img/Logo Sencillo.png" alt="">
                    </div>
                </div>
                <div id="direccion">
                    <div id="ubica">
                        <img src="img/Ubicacion.png" alt="">
                    </div>
                    <div id="texto">
                        DIRECCION
                    </div>
                    <div id="flecha">
                        <img src="img/Polígono 1.png" alt="">
                    </div>
                </div>
                <div id="buscador">
                    <form action="" id="formulario">
                        <div>
                            <input type="text" name="buscar" id="buscar" placeholder="Buscar (Locales lugares y comida)">
                        </div>
                    </form>
                </div>
                <div id="logo2">
                    <a id="publi" href="publicar.jsp">PUBLICAR</a>
                    <img src="img/Logotipobien.png" alt="">
                </div>
            </div>
        </nav>
        <input type="checkbox" id="btn-menu">
        <div class="container-menu">
            <div class="cont-menu">
                <nav>
                    <div id="logoMenu">
                        <img src="img/Logotipobien.png" alt="">
                    </div>
                    <%
                        Conexion conexion = new Conexion();
                        int idEm = Integer.parseInt(id);
                        List<Empresa> listaEm = conexion.mostrarIdE(idEm);
                    %>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img id="perfFoto" src="MostrarFotoE?id=<%= listaEm.get(0).getId()%>">
                        </div>
                        <div>
                            <a href="modificarE.jsp"><%= listaEm.get(0).getNombre_empresa()%></a>                            
                        </div>
                    </div>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img src="img/metodo.png" alt="">
                        </div>
                        <div>
                            <a href="#">Método de pago</a>                            
                        </div>
                    </div>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img src="img/modo.png" alt="">
                        </div>
                        <div>
                            <a href="#">Tema</a>                            
                        </div>
                    </div>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img src="img/seguridad.png" alt="">
                        </div>
                        <div>
                            <a href="#">Seguridad</a>                            
                        </div>
                    </div>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img src="img/config.png" alt="">
                        </div>
                        <div>
                            <a href="#">Configuración</a>                            
                        </div>
                    </div>
                    <div class="imagenE">
                        <div class="imgOp">
                            <img src="img/info.png" alt="">
                        </div>
                        <div>
                            <a href="#">Información</a>                            
                        </div>
                    </div>
                    <div id="cerrarSe" class="imagenE">
                        <div class="imgOp">
                            <img src="img/cerrar.png" alt="">
                        </div>
                        <div>
                            <a href="Cerrar">Cerrar Sesión</a>                            
                        </div>
                    </div>
                </nav>
                <div class="redesS">
                    <div id="insta">
                        <a href="https://www.instagram.com/reffu_lo_mejor_para_ti/" class="btnS"><img src="img/red4.png" alt=""></a>
                    </div>
                    <div id="what">
                        <a href="https://wa.me/message/TCSINCUCH65RM1" class="btnS"><img src="img/red1.png" alt=""></a>
                    </div>
                    <div id="yout">
                        <a href="https://www.youtube.com/channel/UCUR7vAnGM-hRWqCCNpzHz9A/about" class="btnS"><img src="img/red3.png" alt=""></a>
                    </div>
                    <div id="face">
                        <a href="https://www.facebook.com/profile.php?id=100078991177292" class="btnS"><img src="img/red2.png" alt=""></a>
                    </div>
                </div>
                <label for="btn-menu">✖️</label>
            </div>
        </div>
        <main>
            <section id="categorias">
                <div><h1>Top categori­as</h1></div>
                <div id="categ">
                    <div id="grupo1">
                        <div class="cuadro">
                            <div class="image">
                                <img src="img/Hamburguesa.png" alt="">
                            </div>
                            <div class="nomCat">
                                <p>Hamburguesas</p>
                            </div>
                            <div class="desCat">
                                <p>6 locales</p>
                            </div>
                        </div>
                        <div class="cuadro">
                            <div class="image">
                                <img src="img/Americana.png" alt="">
                            </div>
                            <div class="nomCat">
                                <p>Americana</p>
                            </div>
                            <div class="desCat">
                                <p>3 Locales</p>
                            </div>
                        </div>
                    </div>
                    <div id="grupo2">
                        <div class="cuadro">
                            <div class="image">
                                <img src="img/Pizza (2).png" alt="">
                            </div>
                            <div class="nomCat">
                                <p>Pizza</p>
                            </div>
                            <div class="desCat">
                                <p>16 Locales</p>
                            </div>
                        </div>
                        <div class="cuadro">
                            <div class="image">
                                <img src="img/Carnes.png" alt="">
                            </div>
                            <div class="nomCat">
                                <p>Carnes</p>
                            </div>
                            <div class="desCat">
                                <p>5 Locales</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="calif">
                <div><h1>Mejores calificados</h1></div>
                <div id="calificados">
                    <div class="espacio">

                    </div>
                    <div class="cuadrocalif">
                        <div class="image">
                            <img src="img/Andy.png" alt="">
                        </div>
                        <div class="nomRes">
                            <p>Andy Cindy's Dinner</p>
                        </div>
                        <div class="disRes">
                            <p>2Km de ti</p>
                        </div>
                        <div class="calRes">
                            <img src="img/estrella.png" alt=""><p>4.5</p><p class="numRat">(233 ratings)</p>
                        </div>      
                    </div>
                    <div class="cuadrocalif">
                        <div class="image">
                            <img src="img/Garage.png" alt="">
                        </div>
                        <div class="nomRes">
                            <p>The Garage Bar</p>
                        </div>
                        <div class="disRes">
                            <p>650m de ti</p>
                        </div>
                        <div class="calRes">
                            <img src="img/estrella.png" alt=""><p>4.3</p><p class="numRat">(135 rattings)</p>
                        </div>
                    </div>
                    <div class="cuadrocalif">
                        <div class="image">
                            <img src="img/Julio.png" alt="">
                        </div>
                        <div class="nomRes">
                            <p>Julio's Restaurant</p>
                        </div>
                        <div class="disRes">
                            <p>6.3Km de ti</p>
                        </div>
                        <div class="calRes">
                            <img src="img/estrella.png" alt=""><p>4.6</p><p class="numRat">(135 rattings)</p>
                        </div>
                    </div>
                    <div class="espacio">

                    </div>
                </div>
            </section>
            <%
                int y = 0;
                Empresa empresa = new Empresa();
                Publicacion publicacion = new Publicacion();
                List<Publicacion> lista = conexion.mostrarIdPS(id);

                Comentario comentario = new Comentario();
                for (int i = 0; i < lista.size(); i++) {
                    int idE = Integer.parseInt(lista.get(i).getId_empresa1());
                    String id_pub = lista.get(i).getId_publicacion();
                    List<Publicacion> listaPNorm = conexion.mostrarIdPNor(id_pub);
                    List<Empresa> listaE = conexion.mostrarIdE(idE);
            %>


            <section class="completo">
                <div class="container">
                    <section>
                        <div class="navi">
                            <div class="p1">
                                <p>Publicaciones</p>
                            </div>
                        </div>
                        <div class="nomEmp">
                            <img id="perfFoto" src="MostrarFotoE?id=<%= listaEm.get(0).getId()%>">
                            <p>
                                <%= listaE.get(0).getNombre_empresa()%>
                            </p>
                            <button>Seguir</button>
                        </div>
                        <div class="publicacion">
                            <p id="Titu">
                                <%= lista.get(i).getTitulo()%>
                            </p>
                            <p>
                                <%= lista.get(i).getDescripcion()%>                            
                            </p>
                            <div class="imagen">
                                <img id="perfFoto" src="MotrarFotoP?id=<%= listaPNorm.get(0).getId_publicacion()%>">
                                <label for=""><%= lista.get(i).getFec_pub()%></label>
                            </div>
                        </div>
                    </section>
                    <%
                        String id1 = lista.get(i).getId_publicacion();
                        List<Comentario> listaP = conexion.mostrarIdC(id1);
                        for (y = 0; y < listaP.size(); y++) {
                            int idU = Integer.parseInt(listaP.get(y).getId_usuario1());
                            List<Usuario> listaU = conexion.mostrarId(idU);
                    %>
                    <section>
                        <div class="comentarios">
                            <h3>
                                Comentario:
                            </h3>
                            <div class="formComentarios">
                                <div class="fotoPerfil">
                                    <img id="perfFoto" src="MostrarFoto?id=<%= listaP.get(0).getId_usuario1() %>">
                                </div>
                                <div class="informacion">
                                    <div class="datos">
                                        <div class="nombre">
                                            <label for=""><%= listaP.get(0).getUsuario() %></label>
                                        </div>
                                        <div class="fecha">
                                            <label for=""><%= listaP.get(y).getFec_com()%></label>
                                        </div>
                                    </div>
                                    <div class="comentarioUsuario">
                                        <label for=""><%= listaP.get(y).getComentario()%></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%
                        }
                    %>
                </div>
                <%
                    }
                %>
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
        </main>
    </body>
</html>