/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.model.cidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author killuminatti08
 */
@Entity
public class tbCidades implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name="idCidade")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String UF;
    private String NomeMunic;

    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

    public String getNomeMunic() {
        return NomeMunic;
    }

    public void setNomeMunic(String NomeMunic) {
        this.NomeMunic = NomeMunic;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
        if (!(object instanceof tbCidades)) {
            return false;
        }
        tbCidades other = (tbCidades) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "orbis.model.cidades.tbCidades[ id=" + id + " ]";
    }
    
}
