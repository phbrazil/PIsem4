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
import orbis.DAO.pacote.destinosAutoCompleteDAO;
import orbis.DAO.pacote.tbPacote;

public class destinos {

    private int totalprojetos;

    destinosAutoCompleteDAO projetosnome = new destinosAutoCompleteDAO();
    private List<tbPacote> data = projetosnome.AutoComplete();
    private String destinos;
    private List<String> destinoLista;

    public destinos() {
        
        //aqui faz  uma gambis de converter uma lista de Pacote para uma lista de String do destino
        for (Iterator iterator = data.iterator(); iterator.hasNext();) {
            tbPacote pacote = (tbPacote) iterator.next();
            destinos = destinos + "," + pacote.getLocalDestino();
        }

        destinoLista = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(destinos, ",");

        while (st.hasMoreTokens()) {
            destinoLista.add(st.nextToken().trim());
        }
        totalprojetos = destinoLista.size();
    }

    public List<String> getData(String query) {
        String country = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for (int i = 0; i < totalprojetos; i++) {
            country = destinoLista.get(i).toLowerCase();
            if (country.contains(query)) {
                matched.add(destinoLista.get(i));
            }
        }
        return matched;
    }
}
