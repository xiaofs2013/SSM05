<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>展示页面</title>

    <script src="/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="../boot/bootstrap.min.css"/>

</head>
<body>


<h1 style="text-align: center">学员管理系统</h1>


<table class="table table-bordered table-hover table-striped">

    <tr>
        <td><a href="add">添加学员</a></td>
    </tr>

    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>年龄</td>
        <td>电话</td>
        <td>email</td>
        <td>班级</td>
        <td>操作</td>
    </tr>


    <c:forEach var="stu" items="${requestScope.list}">
        <tr>
            <td>${stu.id}</td>
            <td>${stu.name}</td>
            <td>${stu.gender}</td>
            <td>${stu.age}</td>
            <td>${stu.telephone}</td>
            <td>${stu.email}</td>
            <td>${stu.classes.name}</td>
            <td><a href="/con/del?id=${stu.id}" onclick="confirm('杀不杀？')">删除</a></td>
        </tr>
    </c:forEach>


</table>


<div style="text-align: center" class="col-lg-5 col-lg-offset-4">
    <table class="table table-bordered table-hover table-striped">
        <tr>
            <td><a href="javascript:goPage(1)">首页</a></td>
            <td><a href="javascript:goPage(${page.currPage-1})">上一页</a></td>
            <c:forEach var="i" begin="1" end="${page.totalPage}">
                <td>
                    <a href="javascript:goPage(${i})">${i}</a>
                </td>
            </c:forEach>
            <td><a href="javascript:goPage(${page.currPage+1})">下一页</a></td>
            <td><a href="javascript:goPage(${page.totalPage})">尾页</a></td>
        </tr>
    </table>
</div>


</body>


<script>


    function goPage(p) {
        //1.判断接收的参数（当前页）的上下限
        var total = ${page.totalPage};
        if (p > total) {
            p = total;
        }
        if (p < 1) {
            p = 1;
        }
        location.href = "/con/show?currPage=" + p;
    }


</script>
</html>
