/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.model.comentario;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author killuminatti08
 */
@Entity
public class tbComentario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private int idpacote;
    private String nome;
    private String comentario;
    private String email;
    private int nota;
    private String dthComentario;

    public tbComentario(Integer id, int idpacote, String nome, String comentario, String email, int nota, String dthComentario) {
        this.id = id;
        this.idpacote = idpacote;
        this.nome = nome;
        this.comentario = comentario;
        this.email = email;
        this.nota = nota;
        this.dthComentario = dthComentario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    

    public String getDthComentario() {
        return dthComentario;
    }

    public void setDthComentario(String dthComentario) {
        this.dthComentario = dthComentario;
    }

    public int getIdpacote() {
        return idpacote;
    }

    public void setIdpacote(int idpacote) {
        this.idpacote = idpacote;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof tbComentario)) {
            return false;
        }
        tbComentario other = (tbComentario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "orbis.model.comentario.comentario[ id=" + id + " ]";
    }

}
