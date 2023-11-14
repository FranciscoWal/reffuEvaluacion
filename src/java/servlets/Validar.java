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
import modelos.Empresa;
import modelos.Usuario;
@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conexion conexion = new Conexion();
        Usuario usuario = new Usuario();
        Empresa empresa = new Empresa();
        
        usuario.setCorreo(request.getParameter("email"));
        usuario.setContraseña(request.getParameter("password"));
        empresa.setCorreo(request.getParameter("email"));
        empresa.setContraseña(request.getParameter("password"));
        
        int resultado=conexion.validar(usuario, empresa);
        
        if(resultado==1){
            HttpSession sesion = request.getSession();
            sesion.setAttribute("id", usuario.getId());
            response.sendRedirect("principal.jsp");    
        }else{
            if(resultado==2){   
                HttpSession sesion = request.getSession();
                sesion.setAttribute("id", empresa.getId());
                response.sendRedirect("principal_empresa.jsp");
            }else{
                response.sendRedirect("index.html");  
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
