<%@ page import="models.Film" %>
<%@ page import="jspclass.Requester" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonSyntaxException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    if(session.getAttribute("isLogged") == null || !((boolean)session.getAttribute("isLogged"))) {
%>
<jsp:forward page="page-login.jsp"/>
<%
    }
%>

<%
    Long accountId = (Long)session.getAttribute("account_id");

    Film[] films = new Film[0];

    Requester requester = new Requester();


    try {

        if(accountId != null) {

            films = requester.getWatched((Long) session.getAttribute("account_id"));
        } else {

        }
    } catch (IllegalStateException | JsonSyntaxException e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Просмотренные</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
</head>
<body class="sidebar-mini fixed">
<div class="wrapper">
    <!-- Navbar-->
    <header class="main-header hidden-print"><a class="logo" href="films.jsp">USee</a>
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button--><a class="sidebar-toggle" href="#" data-toggle="offcanvas"></a>
            <!-- Navbar Right Menu-->
            <div class="navbar-custom-menu">
                <ul class="top-nav">

                    <!-- User Menu-->
                    <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"></i></a>
                        <ul class="dropdown-menu settings-menu">
                            <li><a href="page-login.jsp?target=logout"><i class="fa fa-sign-out fa-lg"></i> Выход</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Side-Nav-->
    <aside class="main-sidebar hidden-print">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image"><img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"></div>
                <div class="pull-left info">
                    <p><%= session.getAttribute("account_login")%></p>
                    <p class="designation">Пользователь</p>
                </div>
            </div>
            <!-- Sidebar Menu-->
            <ul class="sidebar-menu">
                <li><a href="films.jsp"><i class="fa fa-dashboard"></i><span>Фильмы</span></a></li>
                <li class="active"><a href="watched.jsp"><i class="fa fa-laptop"></i><span>Просмотренные</span></a></li>


            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <div class="page-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Просмотренные фильмы</h1>
            </div>
        </div>
        <div class="col-md-12">
            <div class="card">
                <h3 class="card-title">Просмотренные фильмы</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Имя</th>
                        <th>Рейтинг</th>
                        <th>Продолжительность</th>
                        <th>Год</th>
                        <th>Описание</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i = 0; i < films.length; i++) {
                    %>
                    <form action="do_shows.jsp" method="post">
                        <tr>
                            <td><%=films[i].getId()%></td>
                            <td><%=films[i].getName() + "/" + films[i].getSubname()%></td>
                            <td><%=films[i].getRating()%></td>
                            <td><%=films[i].getTime()%></td>
                            <td><%=films[i].getYear()%></td>
                            <td><%=films[i].getDescription()%></td>
                            <td>
                                <%--<input type="submit"  name="button" value="Просмотрено" class="btn btn-primary btn-block">--%>
                                <input type="hidden" name="id" value="<%=films[i].getId()%>">
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Javascripts-->
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>