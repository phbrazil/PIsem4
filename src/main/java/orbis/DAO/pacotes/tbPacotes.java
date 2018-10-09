/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacotes;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author ASAPH-001
 */
@Entity
public class tbPacotes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idPacote;
    private String dthevento;
    private int qtdMax;
    private double valor;
    private String localSaida;
    private String localDestino;
    private String roteiro;

    public String getDthevento() {
        return dthevento;
    }

    public void setDthevento(String dthevento) {
        this.dthevento = dthevento;
    }

    public int getQtdMax() {
        return qtdMax;
    }

    public void setQtdMax(int qtdMax) {
        this.qtdMax = qtdMax;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getLocalSaida() {
        return localSaida;
    }

    public void setLocalSaida(String localSaida) {
        this.localSaida = localSaida;
    }

    public String getLocalDestino() {
        return localDestino;
    }

    public void setLocalDestino(String localDestino) {
        this.localDestino = localDestino;
    }

    public String getRoteiro() {
        return roteiro;
    }

    public void setRoteiro(String roteiro) {
        this.roteiro = roteiro;
    }
    
    
    

    public Long getIdPacote() {
        return idPacote;
    }

    public void setIdPacote(Long idPacote) {
        this.idPacote = idPacote;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPacote != null ? idPacote.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof tbPacotes)) {
            return false;
        }
        tbPacotes other = (tbPacotes) object;
        if ((this.idPacote == null && other.idPacote != null) || (this.idPacote != null && !this.idPacote.equals(other.idPacote))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "orbis.DAO.pacotes.tbPacotes[ id=" + idPacote + " ]";
    }
    
}
