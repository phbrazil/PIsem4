/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.model.venda;

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
public class tbVenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private int idpacote;
    private int idcliente;
    private String dthvenda;
    private double total;
    String tipoPagamento;
    int ingressos;

    public int getIngressos() {
        return ingressos;
    }

    public void setIngressos(int ingressos) {
        this.ingressos = ingressos;
    }
    
    

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }
    

    public int getIdpacote() {
        return idpacote;
    }

    public void setIdpacote(int idpacote) {
        this.idpacote = idpacote;
    }
    
    

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public String getDthvenda() {
        return dthvenda;
    }

    public void setDthvenda(String dthvenda) {
        this.dthvenda = dthvenda;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
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
        if (!(object instanceof tbVenda)) {
            return false;
        }
        tbVenda other = (tbVenda) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "orbis.controller.busca.tbVenda[ id=" + id + " ]";
    }
    
}
