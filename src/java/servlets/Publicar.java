package servlets;

import bd.Conexion;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelos.Publicacion;
import modelos.Usuario;

@MultipartConfig
@WebServlet(name = "Publicar", urlPatterns = {"/Publicar"})
public class Publicar extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        String id=(String) sesion.getAttribute("id");
        
        String fecha = new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
        
        Conexion conexion = new Conexion();
        Publicacion publicacion = new Publicacion();
        publicacion.setTitulo(request.getParameter("titulo"));
        Part part=request.getPart("foto");
        InputStream inputStream = part.getInputStream(); 
        publicacion.setFoto(inputStream);
        publicacion.setDescripcion(request.getParameter("informacion"));
        publicacion.setFec_pub(fecha);
        publicacion.setId_empresa1(id);
        conexion.insertarPublicacion(publicacion);
        response.sendRedirect("principal_empresa.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
