package modelos;



public class Comentario extends Usuario {
    private String comentario, fec_com, id_usuario1, id_publicacion1;

    public Comentario() {
    }


    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getFec_com() {
        return fec_com;
    }

    public void setFec_com(String fec_com) {
        this.fec_com = fec_com;
    }

    public String getId_usuario1() {
        return id_usuario1;
    }

    public void setId_usuario1(String id_usuario1) {
        this.id_usuario1 = id_usuario1;
    }

    public String getId_publicacion1() {
        return id_publicacion1;
    }

    public void setId_publicacion1(String id_publicacion1) {
        this.id_publicacion1 = id_publicacion1;
    }
    
    
}
