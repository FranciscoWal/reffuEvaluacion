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

@WebServlet(name = "ModificarE", urlPatterns = {"/ModificarE"})
public class ModificarE extends HttpServlet {


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
        Empresa empresa = new Empresa();
        empresa.setId((id));
        empresa.setNombre(request.getParameter("name"));
        empresa.setNombre_empresa(request.getParameter("nom_empre"));
        empresa.setCorreo(request.getParameter("email"));
        empresa.setContraseña(request.getParameter("password"));
        empresa.setTelefono(request.getParameter("telefono"));
        conexion.modificarEmpresa(empresa);
        response.sendRedirect("principal_empresa.jsp"); 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
