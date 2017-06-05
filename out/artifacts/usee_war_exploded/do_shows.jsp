<%@ page import="jspclass.Requester" %><%--
  Created by IntelliJ IDEA.
  User: pek18
  Date: 05.06.2017
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = String.valueOf(request.getParameter("id"));

    Requester requester = new Requester();

    if("\"lol\"".equals(requester.sendWatched((Long) session.getAttribute("account_id"), id))) {
        session.setAttribute("adding_film", "Успешно добавлен в просмотренные");
    } else {
        session.setAttribute("adding_film", "Ошибка добавления");
    }
%>

<jsp:forward page="films.jsp"/>