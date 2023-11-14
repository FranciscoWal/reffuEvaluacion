
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
import modelos.Empresa;
import modelos.Usuario;

@MultipartConfig
@WebServlet(name = "ConectEmp", urlPatterns = {"/ConectEmp"})
public class ConectEmp extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            
            try (PrintWriter out = response.getWriter()) {
                
            Conexion conexion = new Conexion();
            Empresa empresa = new Empresa();
            empresa.setNombre(request.getParameter("name"));
            empresa.setNombre_empresa(request.getParameter("name_empresa"));
            empresa.setCorreo(request.getParameter("email"));
            empresa.setContraseña(request.getParameter("password"));
            empresa.setTelefono(request.getParameter("telefono"));
            Part part=request.getPart("foto");
            InputStream inputStream = part.getInputStream(); 
            empresa.setFoto(inputStream);
            conexion.insertarEmpresa(empresa);
            
            response.sendRedirect("index.html");
        }
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
