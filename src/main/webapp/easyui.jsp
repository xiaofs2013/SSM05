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

使用EasyUI


<div id="cc" class="easyui-layout" style="width:600px;height:400px;">
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;">


        <div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
            <div title="Tab1" style="padding:20px;display:none;">
                tab1
            </div>
            <div title="Tab2" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">
                tab2
            </div>
            <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">
                tab3
            </div>
        </div>


    </div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">


        <div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"
             data-options="iconCls:'icon-save',modal:true">
            Window Content
        </div>

        <input type="button" value="添加学生" id="but1"><br>

        <div id="cc" class="easyui-calendar" style="width:180px;height:180px;"></div>

    </div>
</div>


</body>


<script language="JavaScript">

    $(function () {
        $("#but1").click(function () {
            $('#win').window({
                title: "标题",
                width: 600,
                height: 400,
                modal: true,
                iconCls: 'icon-save',
                resizable: true
            });
        })
    })

</script>

</html>
