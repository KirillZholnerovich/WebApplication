<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String target = request.getParameter("target");

    if(target != null && target.equals("logout")) {
        if(session.getAttribute("isLogged") != null) {
            session.removeAttribute("isLogged");
        }

        if(session.getAttribute("login_message") != null) {
            session.removeAttribute("login_message");
        }

        if(session.getAttribute("account_id") != null) {
            session.removeAttribute("account_id");
        }

        if(session.getAttribute("account_login") != null) {
            session.removeAttribute("account_login");
        }

        if(session.getAttribute("account_password") != null) {
            session.removeAttribute("account_password");
        }
    }

    if(session.getAttribute("isLogged") != null && (boolean)session.getAttribute("isLogged")) {
%>
<jsp:include page="films.jsp"/>
<%
} else {
%>
<jsp:include page="page-login.jsp" />
<%
    }
%>