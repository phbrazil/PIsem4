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
import orbis.DAO.pacote.destinosAutoCompleteDAO;

public class destinos {
    
	private int totalprojetos;
        
        destinosAutoCompleteDAO projetosnome = new destinosAutoCompleteDAO();
	private String data = projetosnome.AutoComplete();
	private List<String> projetos;
	public destinos() {
            System.out.println("entrei na destinos");
		projetos = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(data, ",");
		
		while(st.hasMoreTokens()) {
			projetos.add(st.nextToken().trim());
		}
		totalprojetos = projetos.size();
	}
	
	public List<String> getData(String query) {
		String country = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalprojetos; i++) {
			country = projetos.get(i).toLowerCase();
			if(country.contains(query)) {
				matched.add(projetos.get(i));
			}
		}
		return matched;
	}
}