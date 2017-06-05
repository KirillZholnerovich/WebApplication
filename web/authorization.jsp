<%@ page import="jspclass.Requester" %>
<%--<%@ page import="Models.AccountModel" %>--%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="models.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String button = request.getParameter("button");
    if(button != null) {
        String type = new String(button.getBytes("ISO-8859-1"), "UTF8");

        if(type.equals("Войти")) {
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            Requester requester = new Requester();
            if (login != null && password != null && !login.equals("") && !password.equals("")) {
                String accountModelString = requester.getAccount(login, password);
                Account accountModel = new Gson().fromJson(accountModelString, Account.class);
                if(accountModel.getId() != -1) {
//                    if(session.getAttribute("isLogged") == null) {
//                        session.setAttribute("isLogged", true);
//                    } else {
//                        session.setAttribute("isLogged", true);
//                    }

                    session.setAttribute("isLogged", true);

                    session.setAttribute("account_id", accountModel.getId());
                    session.setAttribute("account_login", accountModel.getLogin());
                    session.setAttribute("account_password", accountModel.getPassword());
                } else {
                    session.setAttribute("isLogged", false);
                    session.setAttribute("login_message", accountModel.getLogin());
                    %>
<jsp:forward page="page-login.jsp"/>

<%
                }

            } else {
                getServletConfig().getServletContext().setAttribute("login", "false");
%>
<jsp:forward page="page-login.jsp"/>
<%
            }
        } else {
%>
<%--<jsp:forward page="registration.jsp"/>--%>
<%
        }
%>
<%
    }
%>
<jsp:forward page="index.jsp"/>


