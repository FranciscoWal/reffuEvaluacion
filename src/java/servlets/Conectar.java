package servlets;

import bd.Conexion;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelos.Usuario;

@MultipartConfig
@WebServlet(name = "Conectar", urlPatterns = {"/Conectar"})
public class Conectar extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conexion conexion = new Conexion();
        Usuario usuario = new Usuario();
        usuario.setNombre(request.getParameter("name"));
        usuario.setUsuario(request.getParameter("usuario"));
        usuario.setCorreo(request.getParameter("email"));
        usuario.setContraseña(request.getParameter("password"));
        usuario.setTelefono(request.getParameter("telefono"));
        Part part=request.getPart("foto");
        InputStream inputStream = part.getInputStream(); 
        usuario.setFoto(inputStream);
        conexion.insertarUsuario(usuario);
        response.sendRedirect("index.html");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
