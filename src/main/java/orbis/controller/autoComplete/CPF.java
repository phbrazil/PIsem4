/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.autoComplete;

/**
 *
 * @author paulo.bezerra
 * funciona com hibernate -- Original era em ResultSet
 */
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import orbis.DAO.autoComplete.CPFAutoComplete;
import orbis.DAO.autoComplete.destinosAutoComplete;
import orbis.model.cliente.tbCliente;
import orbis.model.pacote.tbPacote;

public class CPF {

    private int totalCPF;

    CPFAutoComplete cpf = new CPFAutoComplete();
    private List<tbCliente> data = cpf.AutoComplete();
    private String cpfs;
    private List<String> cpfLista;

    public CPF() {
        
        //aqui faz  uma gambis de converter
        //uma lista de Pacote para uma lista 
        //de String do destino
        
        for (Iterator iterator = data.iterator(); iterator.hasNext();) {
            tbCliente cliente = (tbCliente) iterator.next();
            cpfs = cpfs + "," + cliente.getCpfCliente();
        }

        cpfLista = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(cpfs, ",");

        while (st.hasMoreTokens()) {
            cpfLista.add(st.nextToken().trim());
        }
        totalCPF = cpfLista.size();
    }

    public List<String> getData(String query) {
        String country = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for (int i = 0; i < totalCPF; i++) {
            country = cpfLista.get(i).toLowerCase();
            if (country.contains(query)) {
                matched.add(cpfLista.get(i));
            }
        }
        return matched;
    }
}
