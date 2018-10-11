/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.autoComplete;

/**
 *
 * @author paulo.bezerra
 */

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import orbis.DAO.pacote.testeAutoComplete;

public class Teste {
	private int totalclientes;
        
        testeAutoComplete clientesnome = new testeAutoComplete();
	private String data = clientesnome.AutoComplete();
	private List<String> clientes;
	public Teste() {
		clientes = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(data, ",");
		
		while(st.hasMoreTokens()) {
			clientes.add(st.nextToken().trim());
		}
		totalclientes = clientes.size();
	}
	
	public List<String> getData(String query) {
		String country = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalclientes; i++) {
			country = clientes.get(i).toLowerCase();
			if(country.contains(query)) {
				matched.add(clientes.get(i));
			}
		}
		return matched;
	}
}