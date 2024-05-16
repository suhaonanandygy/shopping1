<%--
  Created by IntelliJ IDEA.
  User: 苏
  Date: 2024/5/12
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="statics/layui/layui.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>销售人员登录</small>
                </h1>
            </div>
        </div>
        <span style="color: red; font-size: large"> ${LOGIN_MSG} </span>
        <form action=" ${pageContext.request.contextPath}/business/businessLogin" >
            <div class="form-group">
                <label for="business_account">销售人员账户</label>
                <input type="text" class="form-control" id="business_account" name="business_account" required>
            </div>
            <div class="form-group">
                <label for="business_password">销售人员密码</label>
                <input type="text" class="form-control" id="business_password" name="business_password">
            </div>



            <div class="form-group">
                <button type="submit" class="btn btn-default">登陆</button>
            </div>

            <div class="remember">
                <input type="checkbox" name="remember" id="check" value="1"/>记住我
            </div>



        </form>
    </div>




</div>
</body>
</html>
