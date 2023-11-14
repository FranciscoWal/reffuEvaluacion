<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/RANK.css">
    <link rel="icon" href="img/minuicon.png">
    <title>Login</title>
</head>
<%
    int id2=Integer.parseInt(request.getParameter("idem"));
    String name= request.getParameter("name");
  HttpSession sesion = request.getSession();
    String id=(String) sesion.getAttribute("id");
    int idU = Integer.parseInt(id);
   

%>
<body> 
    <main>
        <section id="ingreso">
            <form action="Calificar" method="post" id="formulario" >
                <img src="img/Logo Sencillo.png" alt="">
                <div id="sec">
                    <h1>¡RANK!</h1>
                    <p><%= name %></p>
                    <div id="cen">
                    <div class="controls">
                        <input type="number" name="idU" value="<%= idU%>" hidden="" >
                        <input type="number" name="idE" value="<%= id2%>" hidden="" >
                        <input type="number" name="RANK" id="RANK" max="5" min="1" placeholder="RANK" >
                        <span class="novisible" id="errorRANK">Ingresa una calificacion</span>
                    </div>
                    </div>
                    <div>
                        <img id="img" src="img/CincoStars.png" alt="">
                    </div>
                    <div>
                        <button type="submit">¡Calificar!</button>
                    </div>

                    </div>
            </form>
        </section>
    </main>
    <footer>
        &copy; REFF-U
    </footer>
    <script src="js/RANK.js"></script>
</body>
</html>