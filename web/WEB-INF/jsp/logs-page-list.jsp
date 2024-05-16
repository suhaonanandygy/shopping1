<%--
  Created by IntelliJ IDEA.
  User: 苏
  Date: 2024/5/14
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
                    <small>显示所有用户操作记录</small>
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
                    <th>用户昵称</th>
                    <th>活动名称</th>
                    <th>性质</th>
                    <th>ip地址</th>
                    <th>活动时间</th>
                    <th>商品数量</th>
                    <th>商品价格</th>
                    <th>商品ID</th>


                </tr>

                </thead>
                <tbody>
                <%--@elvariable id="pageInfo" type="com.github.pagehelper.PageInfo"--%>
                <c:if test="${!empty pageInfo.list }">
                    <c:forEach var="user_activity_logs" items="${pageInfo.list}">
                        <tr>
                            <td ><input name=""  type="checkbox"></td>
                            <td > ${user_activity_logs.id}</td>
                            <td > ${user_activity_logs.user_name}</td>
                            <td > ${user_activity_logs.activity_type}</td>
                            <td > ${user_activity_logs.category}</td>
                            <td > ${user_activity_logs.ip_address}</td>
                            <td > ${user_activity_logs.activity_time}</td>
                            <td > ${user_activity_logs.quantity}</td>
                            <td > ${user_activity_logs.price}</td>
                            <td > ${user_activity_logs.product_id}</td>


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
                    <li><a href="${pageContext.request.contextPath}/admin/find_allLogs?page=1" rel="external nofollow" >首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/find_allLogs?page=${pageInfo.pageNum-1}" rel="external nofollow" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#" rel="external nofollow" >${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/admin/find_allLogs?page=${ page_Num}" rel="external nofollow" >${ page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/find_alLogs?page=${pageInfo.pageNum+1}" rel="external nofollow" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/admin/find_allLogs?page=${pageInfo.pages}" rel="external nofollow" >末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>



</body>
</html>
