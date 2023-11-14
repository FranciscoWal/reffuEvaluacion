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

@WebServlet(name = "Comentar_loc", urlPatterns = {"/Comentar_loc"})
public class Comentar_loc extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        String id=(String) sesion.getAttribute("id");
        String idE=request.getParameter("e");
        String fecha=new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
        Conexion conexion = new Conexion();
        Comentario comentario = new Comentario();
        comentario.setComentario(request.getParameter("comentario"));
        comentario.setFec_com(fecha);
        comentario.setId_usuario1(id);
        comentario.setId_publicacion1(request.getParameter("publicacion"));
        conexion.insertarComentario(comentario);
        response.sendRedirect("local_principal.jsp?e="+idE);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
