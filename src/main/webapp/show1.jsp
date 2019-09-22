<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--easyUI/themes/default/easyui.css--%>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <%--必须先引用jqury再引用EasyUI--%>
    <script src="js/jquery.easyui.min.js"></script>
</head>
<body>

<input type="button" value="加载表格信息" id="but1">


<div id="showStudent"></div>

<input type="button" value="跳转" onclick="bb()">


<table class="easyui-datagrid" style="width:400px;height:250px"
       data-options="url:'con/test1',fitColumns:true,singleSelect:true">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">编号</th>
        <th data-options="field:'name',width:100">姓名</th>
        <th data-options="field:'age',width:100,align:'right'">年龄</th>
    </tr>
    </thead>
</table>

<br>

<input type="button" value="加载表格信息2" id="but2">
<br>
<table id="dg"></table>

</body>

<script language="JavaScript">
    $(function () {   //加载事件  jquery的代码块 类似于JAVA代码中的main方法块
        $("#but1").click(function () {
            //使用ajax实现交互
            /*$.ajax({            //中括号里面给了大括号 大括号里面的就是json
                type: "get",    //发送请求的方式
                url: "con/test1",     //指定服务器地址
                //data:"name=John&location=Boston",   //将客户端的数据发送到服务器 类似于地址后面加个问号 参数为  ?name=John&location=Boston
                dataType: "json",  //指定服务器返回客户端数据的格式
                success: function (data) {  //回调函数 data表示服务器返回给客户端的数据
                    alert("Data Saved: " + data);
                    var table = "<table border='1'>";
                    table = table + "<tr><td>编号</td><td>姓名</td><td>年龄</td><td>性别</td><td>电话</td><td>邮箱</td><td>班级</td></tr>";
                    for (var i = 0; i < data.length; i++) {
                        var s = data[i];
                        table = table + "<tr><td>" + s.id + "</td><td>" + s.name + "</td><td>" + s.age + "</td><td>" + s.gender + "</td><td>" + s.telephone + "</td><td>" + s.email + "</td>+<td>" + s.classid + "</td></tr>";
                    }
                    table = table + "</table>";
                    //显示表格
                    $("#showStudent").html(table);
                }
            })*/

            //使用jquery的psot方法或者get方法发送异步请求
            //需要四个参数 $post("服务器地址",给服务器传递的参数,回调函数,"json")
            //封装的特别简洁

            $.post("con/test1", null, function (data) {

                alert("Data Saved: " + data);
                var table = "<table border='1'>";
                table = table + "<tr><td>编号</td><td>姓名</td><td>年龄</td><td>性别</td><td>电话</td><td>邮箱</td><td>班级</td><td>操作</td></tr>";
                for (var i = 0; i < data.length; i++) {
                    var s = data[i];
                    table = table + "<tr><td>" + s.id + "</td><td>" + s.name + "</td><td>" + s.age + "</td><td>" + s.gender + "</td><td>" + s.telephone + "</td><td>" + s.email + "</td>+<td>" + s.classid + "</td>+<td>" + "<input type='button' onclick='aa(" + s.id + ")' value='删除' id='delete'>" + "</td></tr>";
                }
                table = table + "</table>";
                //显示表格
                $("#showStudent").html(table);

            }, "json");
        })


        $("#but2").click(function () {
            $('#dg').datagrid({
                url: 'con/getDataByPage',
                fitColumns: true,
                singleSelect: true,
                pagination: true,
                pageSize: 3,
                pageList: [3, 6, 10, 20],
                columns: [[
                    {field: 'id', title: '编号', width: 100},
                    {field: 'name', title: '姓名', width: 100},
                    {field: 'age', title: '年龄', width: 100, align: 'right'}
                ]]
            });
        })

        /*个性化单元格 实现年月日正常显示的方法：
        *
        * formatter: function(value,row,index){
                       //value表示当前列值，row表示当前行对象，index表示行索引
                        //返回值为单元格内容
                        //return "<input type='button' value='请点我吧'>";
                          var date=new Date(value);
                          var year=date.getFullYear();
                          var m=date.getMonth()+1;
                          var d=date.getDay();
                          var str=year+"年"+m+"月"+d+"日";
                          return str;
                      }
                      *
        * */

    });

    function aa(id) {
        $.post("/con/dell", {"id": id}, function (data) {
            location.href = "/show1.jsp";
        }, "json");

    }

    function bb() {
        location.href = "/index.jsp";
    }


</script>
</html>
