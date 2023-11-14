package servlets;

import bd.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Comentario;

@WebServlet(name = "Comentar", urlPatterns = {"/Comentar"})
public class Comentar extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        String id=(String) sesion.getAttribute("id");
        
        String fecha=new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
        Conexion conexion = new Conexion();
        Comentario comentario = new Comentario();
        comentario.setComentario(request.getParameter("comentario"));
        comentario.setFec_com(fecha);
        comentario.setId_usuario1(id);
        comentario.setId_publicacion1(request.getParameter("publicacion"));
        conexion.insertarComentario(comentario);
        response.sendRedirect("principal.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
