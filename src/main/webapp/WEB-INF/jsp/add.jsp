<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新增页面</title>
</head>
<body>

<h1 style="color: red;text-align:center;font-size: 200px">学员信息添加</h1>


<form action="/con/add1" method="post">

    <div style="text-align: center">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name"></td>
            </tr>

            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" value="男" name="gender">男
                    <input type="radio" value="女" name="gender">女
                </td>
            </tr>

            <tr>
                <td>年龄</td>
                <td><input type="text" name="age"></td>
            </tr>

            <tr>
                <td>电话</td>
                <td><input type="text" name="telephone"></td>
            </tr>

            <tr>
                <td>email</td>
                <td><input type="text" name="email"></td>
            </tr>

            <tr>
                <td>班级</td>
                <td>
                    <select name="classid" id="">
                        <option value="0">请选择</option>

                        <c:forEach var="ca" items="${requestScope.ca}">
                            <option value="${list.classid}">${ca.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" value="提交">
                </td>
            </tr>

        </table>
    </div>


</form>

</body>
</html>
