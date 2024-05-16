<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 苏
  Date: 2024/5/16
  Time: 2:36
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>用户</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>显示所有销售用户</small>
                </h1>
            </div>
        </div>

        <div class="col-md-4 column">
            <div class="page-header">
                <h1>

                    <small><a class="button button-primary" href="${pageContext.request.contextPath}/admin/return">返回</a></small>
                </h1>
            </div>
        </div>


    </div>



    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th><input  name="" type="checkbox"></th>

                    <th>编号</th>
                    <th>昵称</th>
                    <th>密码</th>



                </tr>

                </thead>
                <tbody>
                <c:if test="${!empty pageInfo.list }">
                    <c:forEach var="business" items="${pageInfo.list}">
                        <tr>
                            <td ><input name=""  type="checkbox"></td>
                            <td > ${business.business_id}</td>
                            <td > ${business.business_account}</td>
                            <td > ${business.business_password}</td>



                        </tr>

                    </c:forEach>
                </c:if>
                <%--                <script>--%>
                <%--                    function delUser(userId){--%>
                <%--                        if (confirm("您确定要删除吗")){--%>
                <%--                            location.href="${pageContext.request.contextPath}/user/delete/"+userId;--%>
                <%--                        }--%>
                <%--                    }--%>
                <%--                </script>--%>
                </tbody>
            </table>
        </div>

    </div>

    <hr style="height:1px;border:none;border-top:1px solid #ccc;" />
    <!-- 分页导航栏 -->

    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
        <div class="col-md-6">
            当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
        </div>

        <!-- 分页条 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/admin/find_allBusinessUser?page=1" rel="external nofollow" >首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/find_allBusinessUser?page=${pageInfo.pageNum-1}" rel="external nofollow" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#" rel="external nofollow" >${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/admin/find_allBusinessUser?page=${ page_Num}" rel="external nofollow" >${ page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/find_allBusinessUser?page=${pageInfo.pageNum+1}" rel="external nofollow" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/admin/find_allBusinessUser?page=${pageInfo.pages}" rel="external nofollow" >末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>



</body>
</html>

