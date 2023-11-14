
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Publicacion"%>
<%@page import="modelos.Comentario"%>
<%@page import="modelos.RANK"%>
<%@page import="bd.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Empresa"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/local_principal.css">
        <link rel="stylesheet" href="css/pubicacion.css"/>
        <title>REFF-U</title>
    </head>
    <% 
    
    HttpSession sesion = request.getSession();
    String id=(String) sesion.getAttribute("id");
     String idE=request.getParameter("e");
     int idE2 = Integer.parseInt(idE);
    Conexion conexion = new Conexion();
    
List<Empresa> lista=conexion.mostrarIdE(idE2);

    
        
    
    
    String name = lista.get(0).getNombre_empresa();
    
    

    %>
    <body>
        <nav>
            <div id="navegador">
                <div id="logos">
                    <div id="btnHamburguesa">
                        <button id="btnMenu"><img src="img/btnHamburguesa.png" alt=""></button>
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
                    <a id="modi" href="modificar.jsp">PERFIL</a>
                    <img src="img/Logotipo1.png" alt="">
                </div>
            </div>
        </nav>
        <main>
            <div class="contenedor">
                <div id="contBan" >
                    <img src="img/banner.jpeg" id="banner">
                    <div id="ban">
                        <%
                        List<RANK> listaR = conexion.mostrarPromRank(idE);
                            for(int r=0; r < listaR.size(); r++){
                            String rankP = listaR.get(r).getRank();
                            
                        %>
                        <div id="black" >
                            <p id="nom_loc"><%= name %> </p>
                            <p id="rank_loc" name="rank"> <%= rankP%><img src="img/RANK.png" id="RANK" alt=""></p>
                            <% } %> 
                            <div id="locUser" >
                                <img id="imgUser" src="MostrarFotoE?id=<%= idE2 %>" >
                            </div>
                        </div>
                    </div>
                        
                </div>
                <a id="boton" href="Rank.jsp?idem=<%=idE2%>&&name=<%= name%>">
                    RANK
                </a>
                    
            </div>
        </main>
                    <!<!-- Publicacion -->
                    
          <%
                int y = 0;
                
                Publicacion publicacion = new Publicacion();
                List<Publicacion> listaP = conexion.mostrarIdPS(idE);

                Comentario comentario = new Comentario();
                for (int i = 0; i < listaP.size(); i++) {
                    
                    String id_pub = listaP.get(i).getId_publicacion();
                    
                    
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
                            <a href="local_principal.jsp?nameE=<%= name %>&&e=<%= idE %>"> <img id="perfFoto" src="MostrarFotoE?id=<%= idE%>">   </a>                             
                            <p>
                                 <%= name%>
                            </p> 
                            <button>Seguir</button>
                        </div>
                        <div class="publicacion">
                            <p id="Titu">
                                <%= listaP.get(i).getTitulo()%>
                            </p>
                            <p>
                                <%= listaP.get(i).getDescripcion()%>                            
                            </p>
                            <div class="imagen">
                                <img id="perfFoto" src="MotrarFotoP?id=<%= listaP.get(0).getId_publicacion()%>">
                                <label for=""><%= listaP.get(i).getFec_pub()%></label>
                            </div>
                            <div class="formi">
                                <h3>
                                    Comentar:
                                </h3>
                                <form action="Comentar_loc?e=<%=idE%>" method="POST" id="formulario">
                                    <input type="text" name="comentario" id="comentario" placeholder="Agrega tu comentario">
                                    <input type="text" name="publicacion" id="publicacion" style="visibility: hidden" value=<%= listaP.get(i).getId_publicacion()%>>
                                    <button type="submit">Comentar</button>
                                </form>
                            </div>                                
                        </div>
                    </section>
                    <%
                        String id1 = listaP.get(i).getId_publicacion();                    
                        List<Comentario> listaC = conexion.mostrarIdC(id1);
                        for (y = 0; y < listaC.size(); y++) {
                            int idU = Integer.parseInt(listaC.get(y).getId_usuario1());
                            List<Usuario> listaU = conexion.mostrarId(idU);
                    %>
                    <section>
                        <div class="comentarios">
                            <h3>
                                Comentario:
                            </h3>
                            <div class="formComentarios">
                                <div class="fotoPerfil">
                                    <img id="perfFoto" src="MostrarFoto?id=<%= listaC.get(y).getId_usuario1() %>">
                                </div>
                                <div class="informacion">
                                    <div class="datos">
                                        <div class="nombre">
                                            <label for=""><%= listaC.get(y).getUsuario() %></label>
                                        </div>
                                        <div class="fecha">
                                            <label for=""><%= listaC.get(y).getFec_com()%></label>
                                        </div>
                                    </div>
                                    <div class="comentarioUsuario">
                                        <label for=""><%= listaC.get(y).getComentario()%></label>
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
                    
             
    </body>
</html>