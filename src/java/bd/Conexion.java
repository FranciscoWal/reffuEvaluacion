package bd;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import modelos.Comentario;
import modelos.Empresa;
import modelos.Publicacion;
import modelos.RANK;
import modelos.Usuario;

public class Conexion {
    Connection con;
    Statement smt;
    ResultSet rs;
    ResultSet rs1;
    PreparedStatement ps;
    
        public void conectar(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reff_u","root","C_9$Yf5YWkUcsKAC/?");
            System.out.println("Conexión realizada correctamente");
            smt=con.createStatement();
            
        }
        catch(ClassNotFoundException e){
            System.out.println("Error en el ClassForName " + e);
        }
        catch(SQLException e){
            System.out.println("Error en los parámetros de la conexión " + e);
        }
    }
    public void desconectar(){
        try {
            con.close();
            System.out.println("BD desconectada");
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión " + ex);
        }
    }
    
    public void insertarUsuario(Usuario usuario){
        try {

            String sql="INSERT INTO USUARIO"
                    + "(nombre,usuario,correo,contrasenya,telefono,foto )"
                    + " VALUES "
                    + "(?,?,?,?,?,?)";
            conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getContraseña());
            ps.setString(5, usuario.getTelefono());
            ps.setBlob(6, usuario.getFoto());
            ps.executeUpdate();
            System.out.println("SQL " + sql);
            desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en la sentencia SQL" + ex);
        }
    }
        public void insertarEmpresa(Empresa empresa){
        try {

            String sql="INSERT INTO EMPRESA"
                    + "(nombre,nombre_empresa,correo,contrasenya,telefono,foto )"
                    + " VALUES "
                    + "(?,?,?,?,?,?)";
            conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, empresa.getNombre());
            ps.setString(2, empresa.getNombre_empresa());
            ps.setString(3, empresa.getCorreo());
            ps.setString(4, empresa.getContraseña());
            ps.setString(5, empresa.getTelefono());
            ps.setBlob(6, empresa.getFoto());
            ps.executeUpdate();
            System.out.println("SQL " + sql);
            desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en la sentencia SQL" + ex);
        }        
    }
        
        public int validar(Usuario usuario, Empresa empresa){
            int resultado=0;
            try {
                String sql="SELECT id_usuario,correo,contrasenya FROM USUARIO "
                        + "WHERE correo= '"+usuario.getCorreo() +"' AND contrasenya='" + usuario.getContraseña()+"'";
                conectar();
                rs=smt.executeQuery(sql);
                
                while(rs.next()){
                    usuario.setId(rs.getString("id_usuario"));
                    resultado=1;
                    return resultado;
                }
                
            } catch (SQLException ex) {
                System.out.println("Error al encontrar al usuario" + ex);;
            }
            try {
                String sql="SELECT id_empresa,correo,contrasenya FROM EMPRESA "
                        + "WHERE correo= '"+empresa.getCorreo() +"' AND contrasenya='" + empresa.getContraseña()+"'";
                conectar();
                rs1=smt.executeQuery(sql);
                
                while(rs1.next()){
                    empresa.setId(rs1.getString("id_empresa"));
                    resultado=2;
                    return resultado;
                }
                
            } catch (SQLException ex) {
               System.out.println("Error al encontrar al usuario" + ex);;
            }

            return 0;
            }
        
        public List<Usuario> mostrarId(int id){
        try {
            List<Usuario> listaUsuarios=new ArrayList<Usuario>();
            String sql= "SELECT * FROM USUARIO Where id_usuario='"+id+"'";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getString("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setUsuario(rs.getString("usuario"));
                u.setCorreo(rs.getString("correo"));
                u.setContraseña(rs.getString("contrasenya"));
                u.setTelefono(rs.getString("telefono"));
                u.setFoto(rs.getBinaryStream("foto"));
                listaUsuarios.add(u);
            }
            desconectar();
            return listaUsuarios;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }
        
        
    
        
        
    public void listarUserImg(int id, HttpServletResponse response){
        String sql= "SELECT * FROM USUARIO Where id_usuario='"+id+"'";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream=response.getOutputStream();
            conectar();
            rs=smt.executeQuery(sql);
            if(rs.next()){
                inputStream=rs.getBinaryStream("foto");
            }
            bufferedInputStream= new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            int i=0;
            while ((i=bufferedInputStream.read())!=-1) {
                bufferedOutputStream.write(i);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            inputStream.close();
            outputStream.close();
        } catch (Exception e) {
        }
    }
    
    public void listarEmpImg(int id, HttpServletResponse response){
        String sql= "SELECT * FROM EMPRESA Where id_empresa='"+id+"'";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream=response.getOutputStream();
            conectar();
            rs=smt.executeQuery(sql);
            if(rs.next()){
                inputStream=rs.getBinaryStream("foto");
            }
            bufferedInputStream= new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            int i=0;
            while ((i=bufferedInputStream.read())!=-1) {
                bufferedOutputStream.write(i);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            inputStream.close();
            outputStream.close();
        } catch (Exception e) {
        }
    }
        
    public List<Empresa> mostrarIdE(int id){
        try {
            List<Empresa> listaEmpresa=new ArrayList<Empresa>();
            String sql= "SELECT * FROM EMPRESA Where id_empresa='"+id+"'";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                Empresa e = new Empresa();
                e.setId(rs.getString("id_empresa"));
                e.setNombre(rs.getString("nombre"));
                e.setNombre_empresa(rs.getString("nombre_empresa"));
                e.setCorreo(rs.getString("correo"));
                e.setContraseña(rs.getString("contrasenya"));
                e.setTelefono(rs.getString("telefono"));
                e.setFoto(rs.getBinaryStream("foto"));
                listaEmpresa.add(e);
            }
            desconectar();
            return listaEmpresa;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }
    
    public int modificarUsuario(Usuario u){
    int regs=0;
    String sql= "UPDATE USUARIO SET nombre='"+u.getNombre()+"',"
        + "usuario='"+u.getUsuario()+"', correo='"+u.getCorreo()+"',"
        + "contrasenya='"+u.getContraseña()+ "', telefono='"+u.getTelefono()+"'"
        + " WHERE id_usuario="+u.getId()+";" ;
        System.out.println("SQL " + sql);
        try {
            conectar();
            regs=smt.executeUpdate(sql);
            desconectar();
            System.out.println("Se modificó el registro");
       } catch (SQLException ex) {
            System.out.println("El registró no se pudo modificar" + ex);
        }
        return regs;
    }

    public int modificarEmpresa(Empresa e){
    int regs=0;
    String sql= "UPDATE EMPRESA SET nombre='"+e.getNombre()+"',"
        + "nombre_empresa='"+e.getNombre_empresa()+"', correo='"+e.getCorreo()+"',"
        + "contrasenya='"+e.getContraseña()+ "', telefono='"+e.getTelefono()+"'"
        + " WHERE id_empresa="+e.getId()+";" ;
        System.out.println("SQL " + sql);
        try {
            conectar();
            regs=smt.executeUpdate(sql);
            desconectar();
            System.out.println("Se modificó el registro");
       } catch (SQLException ex) {
            System.out.println("El registró no se pudo modificar" + ex);
        }
        return regs;
    }    
            
    public int borrarUsuario(int id){
    int regs=0;
    String sql= "DELETE FROM USUARIO WHERE id_usuario='"+ id + "';" ;
    System.out.println("SQL " + sql);
        try {
            conectar();
            regs=smt.executeUpdate(sql);
            desconectar();
            System.out.println("Se eliminó el registro");
       } catch (SQLException ex) {
            System.out.println("El registró no se pudo eliminar" + ex);
        }
        return regs;
    }
    
    public int borrarEmpresa(int id){
    int regs=0;
    String sql= "DELETE FROM Empresa WHERE id_empresa='"+ id + "';" ;
    System.out.println("SQL " + sql);
        try {
            conectar();
            regs=smt.executeUpdate(sql);
            desconectar();
            System.out.println("Se eliminó el registro");
       } catch (SQLException ex) {
            System.out.println("El registró no se pudo eliminar" + ex);
        }
        return regs;
    }
    
    public void insertarPublicacion(Publicacion publicacion){
        try {

            String sql="INSERT INTO PUBLICACION"
                    + "(titulo,descripcion,foto,fec_pub,id_empresa1)"
                    + " VALUES "
                    + "(?,?,?,?,?)";
            conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, publicacion.getTitulo());
            ps.setString(2, publicacion.getDescripcion());
            ps.setBlob(3, publicacion.getFoto());
            ps.setString(4, publicacion.getFec_pub());
            ps.setString(5, publicacion.getId_empresa1());
            ps.executeUpdate();
            System.out.println("SQL " + sql);
            desconectar();
        } catch (SQLException ex) {
            System.out.println("Error en la sentencia SQL" + ex);
        } 
    }    
    
    public List<Publicacion> mostrarIdP(){
        try {
            List<Publicacion> listaPublicacion=new ArrayList<Publicacion>();
            String sql= "  SELECT * FROM PUBLICACION ORDER BY id_publicacion DESC;";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                Publicacion p = new Publicacion();
                p.setId_publicacion(rs.getString("id_publicacion"));
                p.setTitulo(rs.getString("titulo"));
                p.setFoto(rs.getBinaryStream("foto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setFec_pub(rs.getString("fec_pub"));
                p.setId_empresa1(rs.getString("id_empresa1"));
                listaPublicacion.add(p);
            }
            desconectar();
            return listaPublicacion;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }
     public List <RANK> mostrarPromRank(String id){
        
        try{
            List<RANK> listaPromRank = new ArrayList<RANK>();
            String sql = "SELECT round(avg(calif),1) as rank1 ,id_empresa2"
                    + " from CALIFICA"
                    + " WHERE id_empresa2 = "+id
                    + " group by id_empresa2";
            System.out.println("hola"+id);
            conectar();
            rs=smt.executeQuery(sql);
            while (rs.next()){
                RANK c = new RANK();
                c.setIdEm(rs.getString("id_empresa2"));
                c.setRank(rs.getString("rank1"));
                listaPromRank.add(c);
            }
            System.out.println("sql= "+sql);
            desconectar();
            return listaPromRank;
            
            
        } catch(SQLException ex){
            System.out.println("Error " + ex
            +"SQL= ");
            return null;
        }
     }
             public void insertarCalificacion(RANK rk){
            try {
                String sql="INSERT INTO CALIFICA"
                        + "(id_usuario2,calif,id_empresa2)"
                        + " VALUES "
                        + "('"+rk.getIdUs()+"'"+",'"+rk.getRank()+"'"
                        + ",'"+rk.getIdEm()+"')";
                System.out.println("SQL " + sql);
                conectar();
                smt.executeUpdate(sql);
                desconectar();
            } catch (SQLException ex) {
                System.out.println("Error en la sentencia SQL" + ex);
            }
    }     
        
    public List <RANK> validarCalf(){
        
        try{
            List<RANK> listaCalifica = new ArrayList<RANK>();
            String sql = "SELECT * from CALIFICA";
            
            conectar();
            rs=smt.executeQuery(sql);
            while (rs.next()){
                RANK c = new RANK();
                c.setIdEm(rs.getString("id_empresa2"));
                c.setRank(rs.getString("calif"));
                c.setIdUs(rs.getString("id_usuario2"));
                listaCalifica.add(c);
            }
            System.out.println("sql= "+sql);
            desconectar();
            return listaCalifica;
            
            
        } catch(SQLException ex){
            System.out.println("Error " + ex
            +"SQL= ");
            return null;
        }
        
    }    
    
    public List<Publicacion> mostrarIdPNor(String id){
        try {
            List<Publicacion> listaPublicacion=new ArrayList<Publicacion>();
            String sql= "  SELECT * FROM PUBLICACION WHERE id_publicacion='"+id+"';";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                System.out.println("Mostrar idPNorm"+id);
                Publicacion p = new Publicacion();
                p.setId_publicacion(rs.getString("id_publicacion"));
                p.setTitulo(rs.getString("titulo"));
                p.setFoto(rs.getBinaryStream("foto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setFec_pub(rs.getString("fec_pub"));
                p.setId_empresa1(rs.getString("id_empresa1"));
                listaPublicacion.add(p);
            }
            desconectar();
            return listaPublicacion;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }

    public void listarPubImg(int id, HttpServletResponse response){
        String sql= "SELECT * FROM PUBLICACION Where id_publicacion='"+id+"';";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream=response.getOutputStream();
            conectar();
            rs=smt.executeQuery(sql);
            if(rs.next()){
                inputStream=rs.getBinaryStream("foto");
            }
            bufferedInputStream= new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            int i=0;
            while ((i=bufferedInputStream.read())!=-1) {
                bufferedOutputStream.write(i);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            inputStream.close();
            outputStream.close();
        } catch (IOException | SQLException e) {
        }
    }    
    
    public List<Publicacion> mostrarIdPS(String id){
        try {
            List<Publicacion> listaPublicacion=new ArrayList<>();
            String sql= "SELECT * FROM PUBLICACION WHERE id_empresa1="+id+";";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                Publicacion p = new Publicacion();
                p.setId_publicacion(rs.getString("id_publicacion"));
                p.setTitulo(rs.getString("titulo"));
                p.setFoto(rs.getBinaryStream("foto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setFec_pub(rs.getString("fec_pub"));
                p.setId_empresa1(rs.getString("id_empresa1"));
                listaPublicacion.add(p);
            }
            desconectar();
            return listaPublicacion;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }
    
        public void insertarComentario(Comentario comentario){
            try {

                String sql="INSERT INTO COMENTAR"
                        + "(comentario,fec_com,id_usuario1,id_publicacion1)"
                        + " VALUES "
                        + "('"+comentario.getComentario()+"'"+",'"+comentario.getFec_com()+"'"
                        + ",'"+comentario.getId_usuario1()+"','"+comentario.getId_publicacion1()+"')";
                System.out.println("SQL " + sql);
                conectar();
                smt.executeUpdate(sql);
                desconectar();
            } catch (SQLException ex) {
                System.out.println("Error en la sentencia SQL" + ex);
            }
    }     
        
    public List<Comentario> mostrarIdC(String id){
        try {
            List<Comentario> listaComentario=new ArrayList<>();
            String sql= "select u.id_usuario as id, u.usuario as usu, u.foto as foto, c.comentario as com, c.fec_com as fecha, c.id_publicacion1 as ide " +
                        "from USUARIO as u inner join COMENTAR as c " +
                        "on(u.id_usuario=c.id_usuario1) "+
                        "where c.id_publicacion1 ="+id +               
                        " order by fecha;";
            conectar();
            rs=smt.executeQuery(sql);
            while(rs.next()){
                
           
                Comentario c = new Comentario();
                
                c.setComentario(rs.getString("com"));
                c.setFec_com(rs.getString("fecha"));
                c.setId_usuario1(rs.getString("id"));
                c.setId_publicacion1(rs.getString("ide"));
                c.setFoto(rs.getBinaryStream("foto"));
                c.setUsuario(rs.getNString("usu"));
                
                listaComentario.add(c);
                
            }
            desconectar();
            return listaComentario;
       } catch (SQLException ex) {
            System.out.println("Error" + ex);
            return null;
        }
    }
      
}
