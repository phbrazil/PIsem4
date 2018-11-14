<%@page import="orbis.controller.autoComplete.cidades"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    cidades db = new cidades();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String cidades = (String) iterator.next();
        out.println(cidades);
    } while (iterator.hasNext());

%>