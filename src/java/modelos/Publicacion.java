package modelos;

import java.io.InputStream;

public class Publicacion {
    private String id_publicacion, titulo, producto, descripcion, fec_pub, id_empresa1;
    InputStream foto;

    public Publicacion() {
    }

    public String getId_publicacion() {
        return id_publicacion;
    }

    public void setId_publicacion(String id_publicacion) {
        this.id_publicacion = id_publicacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFec_pub() {
        return fec_pub;
    }

    public void setFec_pub(String fec_pub) {
        this.fec_pub = fec_pub;
    }

    public String getId_empresa1() {
        return id_empresa1;
    }

    public void setId_empresa1(String id_empresa1) {
        this.id_empresa1 = id_empresa1;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    
    
}
