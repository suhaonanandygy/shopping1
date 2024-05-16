

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>购物商城</title>
    <link href="${pageContext.request.contextPath}/css/slider.css"
          rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/index.css"
          rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/product.css"
          rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/main"> <img
                    src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif"
                    alt="购物商城" />
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${pageContext.request.contextPath}/image/header.jpg"
                 width="320" height="50" alt="正品保障" title="正品保障" />
        </div>
    </div>
    <%@ include file="menu.jsp"%>
</div>

<div class="container productList">
    <div class="span6">
        <div class="hotProductCategory">
            <c:forEach var="c" items="${sessionScope.cList}">
                <dl>
                    <dt>
                        <a
                                href="${pageContext.request.contextPath}/findSortFirst?sortfirst_id=${c.sortfirst_id}&page=1">
                                ${c.sortfirst_name} </a>
                    </dt>
                    <c:forEach items="${c.csList}" var="cs">
                        <dd>
                            <a
                                    href="${pageContext.request.contextPath}/findSortSecond?csid=${cs.sortsecond_id}&page=1">
                                    ${cs.sortsecond_name}</a>
                        </dd>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
    </div>

    <div class="span18 last">
        <div id="result" class="result table clearfix">
            <div class="title">
                <strong>热门商品</strong>
            </div>
            <ul>
                <c:forEach items="${sessionScope.pList}" var="p">
                    <li><a
                            href="${pageContext.request.contextPath}/productFindById?pid=${p.product_id}"
                            target="_blank">
                        <img
                                src="${pageContext.request.contextPath}/${p.product_image}"
                                width="170" height="170" style="display: inline-block;">
                        <span
                                style='color: green;align:center;'>${p.product_name}</span> <span class="price">
										商城价： ￥${p.product_specialprice} </span>
                                          <span
                                              class="click"> 点击率：${p.click_count}
                                          </span>
                    </a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
   <div class="span18 last">
        <div id="result2" class="result table clearfix">
            <div class="title">
                <strong>最新商品</strong> <a target="_blank"></a>
            </div>
            <ul>
                <c:forEach items="${nList}" var="n">
                    <li><a
                            href="${pageContext.request.contextPath}/productFindById?pid=${n.product_id}"
                            target="_blank">
                        <img
                                src="${pageContext.request.contextPath}/${n.product_image}"
                                width="170" height="170" style="display: inline-block;">
                        <span
                                style='color: green'>${n.product_name}</span> <span class="price">
										商城价： ￥${n.product_specialprice} </span>
                        <span class="click">
                            点击率：${n.click_count}
                        </span>
                    </a>

                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="span18 last">
        <div id="result3" class="result table clearfix">
            <div class="title">
                <strong>猜你喜欢商品</strong> <a target="_blank"></a>
            </div>
            <ul>
                <c:forEach items="${mList}" var="m">
                    <li><a
                            href="${pageContext.request.contextPath}/productFindById?pid=${m.product_id}"
                            target="_blank">
                        <img
                                src="${pageContext.request.contextPath}/${m.product_image}"
                                width="170" height="170" style="display: inline-block;">
                        <span
                                style='color: green'>${m.product_name}</span> <span class="price">
										商城价： ￥${m.product_specialprice} </span>
                        <span class="click">
                            点击率：${m.click_count}
                        </span>
                    </a>

                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>

<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="${pageContext.request.contextPath}/image/footer.jpg"
                 width="950" height="52" alt="我们的优势" title="我们的优势">
        </div>
    </div>
    <div class="span24">
        <ul class="bottomNav">
            <li><hr></hr></li>
        </ul>
    </div>

</div>
</body>
</html>