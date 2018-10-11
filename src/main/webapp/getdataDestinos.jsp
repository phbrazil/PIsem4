<%@page import="orbis.controller.autoComplete.destinos"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    
    System.out.println("entrei no jsp");
    destinos db = new destinos();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String projetos = (String) iterator.next();
        out.println(projetos);
    } while (iterator.hasNext());

%>