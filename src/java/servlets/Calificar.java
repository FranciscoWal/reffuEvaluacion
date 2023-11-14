
package servlets;

import bd.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.RANK;


@WebServlet(name = "Calificar", urlPatterns = {"/Calificar"})
public class Calificar extends HttpServlet {

 

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RANK rk = new RANK();
            Conexion online = new Conexion();
            
            List<RANK> lista = online.validarCalf();
                        for(int r=0;r < lista.size();r++){
                            int listuser =Integer.parseInt(lista.get(r).getIdUs());
                            System.out.println(listuser);
                        }
           
            rk.setIdUs(request.getParameter("idU"));
            rk.setRank(request.getParameter("RANK"));
            rk.setIdEm(request.getParameter("idE"));
            online.insertarCalificacion(rk);
            
            response.sendRedirect("local_principal.jsp?e="+rk.getIdEm());
            
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
