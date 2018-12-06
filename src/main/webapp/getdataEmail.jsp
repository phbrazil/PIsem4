<%@page import="orbis.controller.autoComplete.email"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    email db = new email();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String emails = (String) iterator.next();
        out.println(emails);
        System.out.println(emails+"+++++++++");
    } while (iterator.hasNext());

%>