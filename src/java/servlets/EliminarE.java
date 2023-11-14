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


@WebServlet(name = "EliminarE", urlPatterns = {"/EliminarE"})
public class EliminarE extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        Conexion conexion = new Conexion();
        conexion.borrarEmpresa(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("index.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
