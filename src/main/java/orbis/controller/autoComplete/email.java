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
import orbis.DAO.autoComplete.destinosAutoComplete;
import orbis.DAO.autoComplete.emailAutoComplete;
import orbis.model.cliente.tbCliente;
import orbis.model.pacote.tbPacote;

public class email {

    private int totalEmail;

    emailAutoComplete cpf = new emailAutoComplete();
    private List<tbCliente> data = cpf.AutoComplete();
    private String emails;
    private List<String> emailLista;

    public email() {
        
        //aqui faz  uma gambis de converter
        //uma lista de Pacote para uma lista 
        //de String do destino
        
        for (Iterator iterator = data.iterator(); iterator.hasNext();) {
            tbCliente cliente = (tbCliente) iterator.next();
            emails = emails + "," + cliente.getEmailCliente();
        }

        emailLista = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(emails, ",");

        while (st.hasMoreTokens()) {
            emailLista.add(st.nextToken().trim());
        }
        totalEmail = emailLista.size();
    }

    public List<String> getData(String query) {
        String country = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for (int i = 0; i < totalEmail; i++) {
            country = emailLista.get(i).toLowerCase();
            if (country.contains(query)) {
                matched.add(emailLista.get(i));
            }
        }
        return matched;
    }
}
