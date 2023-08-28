<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>客户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--<link rel="icon" href="favicon.ico">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/public.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="childrenBody">

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">客户姓名:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="custname" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入客户名称" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">客户地址:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="address" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入客户地址" style="height: 30px;border-radius: 10px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">客户电话:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="phone" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入客户电话" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">客户职业:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="career" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入客户职业" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女">
            </div>
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch" style="margin-top: 4px">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                    style="margin-top: 4px">重置
            </button>
            <button type="button"
                    class="layui-btn layui-btn-green layui-icon layui-icon-download-circle layui-btn-radius layui-btn-sm"
                    id="doExport" style="margin-top: 4px">导出
            </button>
        </div>
    </div>

</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>
<div id="customerToolBar" style="display: none;">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-btn-radius" lay-event="deleteBatch">
        批量删除
    </button>
</div>
<div id="customerBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="custname" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" placeholder="请输入客户地址" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户职业:</label>
                <div class="layui-input-inline">
                    <input type="text" name="career" placeholder="请输入客户职业" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入客户电话" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                <button type="button"
                        class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                        lay-filter="doSubmit" lay-submit="">提交
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                </button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script type="text/javascript">


    var tableIns;
    layui.use(['jquery','layer','form','table'],function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;

        //渲染数据
        tableIns = table.render({
            elem: "#customerTable",//目标表格
            url: "${pageContext.request.contextPath}/loadAllCustomer",//数据接口
            title: "客户数据表",
            toolbar: "#customerToolBar",
            height: 400,
            cellMinWidth: 100,
            page:true,
            limits: [7,14,21] //每页条数选项
            ,limit: 7 ,//每页默认显示的条数
            cols:[[//表
                {type:'checkbox',fixed:'left'},
                {field:"identity",title:"身份证号", align:"center",width:"200"},
                {field:"custname",title:"姓名", align:"center",width:"120"},
                {field:"sex",title:"性别", align:"center",width:"100",templet:function (d) {
                        return d.sex=='1'?'<font>男</font>':'<font>女</font>'
                    }},
                {field:"address",title:"地址", align:"center",width:"200"},
                {field:"phone",title:"手机", align:"center",width:"150"},
                {field:"career",title:"职业", align:"center",width:"150"},
                {field:"createtime",title:"创建时间", align:"center",width:"200"},
                {fixed:"right" ,title: "操作", toolbar:"#customerBar",align: "center",width: "150"},
            ]],

            done:function (date,curr,count){
                //不是第一页，如果返回的数据是0，返回上一页
                if (date.data.length==0 && curr !=1){
                    tableIns.reload({
                        page: {
                            curr:curr-1
                        }
                    })
                }
            }
        })

        //找到查询的按钮,添加一个单击事件
        $("#doSearch").click(function (){
            //获取查询表单的的参数
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url:"${pageContext.request.contextPath}/loadAllCustomer?"+params,
                page:{curr: 1}
            })
        })


        //头部工具栏事件
        table.on("toolbar(customerTable)",function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddCustomer();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        })


        //打开添加yemian
        var url;
        var mainIndex;
        function openAddCustomer() {
            mainIndex = layer.open({
                type: 1,
                title:"添加客户",
                content:$("#saveOrUpdateDiv"),
                area:["700px","320px"],
                success:function (index) {
                    $("#dataFrm")[0].reset();
                    url="${pageContext.request.contextPath}/addCustomer";
                }
            })
        }
        //提交保存
        form.on("submit(doSubmit)",function (obj) {
            //获取参数
            var params = $("#dataFrm").serialize();
            //请求后台接口
            $.post(url,params,function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                //刷新表格
                tableIns.reload;
            })
        })

        //监听行工具栏事件
        table.on("tool(customerTable)",function (obj) {
            //获取当前行的数据
            var data = obj.data;
            if (obj.event == 'del'){
                layer.confirm("是否删除["+data.custname+"]",function (index){
                    $.get("${pageContext.request.contextPath}/deleteCustomer",{identity:data.identity},
                    function (res) {
                        //res为后端删除的返回值
                        layer.msg(res.msg);
                        //刷新表格数据
                        tableIns.reload();
                    })
                })
            }else if (obj.event == 'edit'){
                //打开一个窗口
                openUpdateCustomer(data);
            }
        });
        //打开更新窗口
        function openUpdateCustomer(data) {
            mainIndex= layer.open({
                type:1,
                title:"修改客户信息",
                content: $("#saveOrUpdateDiv"),
                area: ["700px","350px"],
                success:function (index) {
                    //打开窗口，数据要进行显示
                    form.val("dataFrm",data);
                    //设置url
                    url = "${pageContext.request.contextPath}/updateCustomer";
                }
            });
        }
    })
</script>
</body>
</html>

