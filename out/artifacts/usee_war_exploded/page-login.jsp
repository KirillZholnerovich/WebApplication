<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Вход в систему</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>USee</h1>
      </div>
      <div class="login-box">
        <form class="login-form" action="authorization.jsp" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>Вход</h3>
            <%
                if(session.getAttribute("isLogged") != null && !((boolean)session.getAttribute("isLogged"))) {
            %>
            <p style="color: red"><%= session.getAttribute("login_message") == null ?
                    "Ошибка" : session.getAttribute("login_message")%>.<br> Пожалуйста, повторите ввод. </p>
            <%
                session.removeAttribute("login_message");
                session.removeAttribute("isLogged");
            } else if(session.getAttribute("doRegister") != null && ((boolean)session.getAttribute("doRegister"))) {
            %>
            <hr width="200px">
            <p style="color: green">Пользователь <b><%= session.getAttribute("registerLogin") == null ?
                    "" : session.getAttribute("registerLogin")%></b> успешно зарегистрирован!<br> Пожалуйста, войдите в систему. </p>
            <%
                    session.removeAttribute("doRegister");
                    session.removeAttribute("registerLogin");
                }
            %>
          <div class="form-group">
            <label class="control-label">Логин</label>
            <input class="form-control" name="login" type="text" placeholder="Email" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">Пароль</label>
            <input class="form-control" name="password" type="password" placeholder="Password">
          </div>

          <div class="form-group btn-container">
            <button name="button" value="Войти" class="btn btn-primary btn-block">Войти&nbsp;<i class="fa fa-sign-in fa-lg"></i></button>
          </div>
        </form>
        <form class="forget-form" action="lol.html">
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block">RESET<i class="fa fa-unlock fa-lg"></i></button>
          </div>
          <div class="form-group mt-20">
            <p class="semibold-text mb-0"><a data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
      </div>
    </section>
  </body>
  <script src="js/jquery-2.1.4.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/plugins/pace.min.js"></script>
  <script src="js/main.js"></script>
</html>