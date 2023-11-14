package servlets;

import bd.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.Usuario;

@WebServlet(name = "Modificar", urlPatterns = {"/Modificar"})
public class Modificar extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String id=(String) sesion.getAttribute("id");
    
        Conexion conexion = new Conexion();
        Usuario usuario = new Usuario();
        usuario.setId((id));
        usuario.setNombre(request.getParameter("name"));
        usuario.setUsuario(request.getParameter("usuario"));
        usuario.setCorreo(request.getParameter("email"));
        usuario.setContraseña(request.getParameter("password"));
        usuario.setTelefono(request.getParameter("telefono"));
        conexion.modificarUsuario(usuario);
        response.sendRedirect("principal.jsp"); 
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
