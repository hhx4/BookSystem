<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员页面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("a.deleteClass").click(function () {
                return confirm("确认删除" + $(this).parent().find("td:first").text() + "?");
            });
        });
    </script>
</head>
<body>

<div id="header">
    <img src="../../static/img/logo.gif" class="logo_img" alt="">
    <span class="wel_word">图书管理系统</span>
    <%@include file="/pages/common/manager_menu.jsp" %>
</div>

<div id="main">
    <table>
        <tr>
            <td>名称</td>
            <td>价格</td>
            <td>作者</td>
            <td>销量</td>
            <td>库存</td>
            <td colspan="2">操作</td>
        </tr>
    <c:forEach items="${requestScope.page.items}" var="book">
        <tr>
            <td>${book.name}</td>
            <td>${book.price}</td>
            <td>${book.author}</td>
            <td>${book.sales}</td>
            <td>${book.stock}</td>
            <td><a href="manager/bookServlet?action=getBook&id=${book.id}&pageNo=${requestScope.page.pageNo}">修改</a></td>
            <td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">删除</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><a href="pages/manager/book_edit.jsp?pageNO=${requestScope.page.pageTotal}">添加图书</a></td>
    </tr>
    </table>
    <%@include file="/pages/common/page_nav.jsp"%>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>