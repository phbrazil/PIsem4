<%@page import="orbis.controller.autoComplete.CPF"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    System.out.println("entrei aqui no jsp");
    CPF db = new CPF();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String cpfs = (String) iterator.next();
        out.println(cpfs);
    } while (iterator.hasNext());

%>