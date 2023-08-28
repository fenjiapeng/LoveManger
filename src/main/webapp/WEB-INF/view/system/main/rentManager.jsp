<%--
  Created by IntelliJ IDEA.
  Rent: YQF
  Date: 2019/10/14
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>出租单管理</title>
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
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="rentid" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入出租单号" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="startTime" id="startTime" readonly="readonly"
                       class="layui-input layui-input-inline"
                       placeholder="请输入出租开始时间" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="endTime" id="endTime" readonly="readonly"
                       class="layui-input layui-input-inline"
                       placeholder="请输入出租结束时间" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出租单状态:</label>
            <div class="layui-input-inline">
                <input type="radio" name="rentflag" value="1" title="已归还">
                <input type="radio" name="rentflag" value="0" title="未归还">
            </div>
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch" style="margin-top: 4px">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                    style="margin-top: 4px">重置
            </button>
        </div>
    </div>
</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="rentTable" lay-filter="rentTable"></table>
<div id="rentToolBar" style="display: none;">
</div>

<script type="text/html" id="rentBar">
    {{#  if(d.rentflag == 1){ }}
    <a class="layui-btn layui-btn-green layui-btn-xs layui-btn-radius" lay-event="exportRent">导出出租单</a>
    {{#  } else { }}
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
<%--    <a class="layui-btn layui-btn-green layui-btn-xs layui-btn-radius" lay-event="exportRent">导出出租单</a>--%>
    {{#  } }}
</script>


<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentid" lay-verify="required"  placeholder="请输入出租单号"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">起租时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="begindate" id="begindate" readonly="readonly" lay-verify="required" placeholder="请输入起租时间" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="returndate" id="returndate" readonly="readonly" lay-verify="required" placeholder="请输入归还时间" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" lay-verify="required" readonly="readonly" placeholder="请输入身份证号"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">房屋编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="id" lay-verify="required" readonly="readonly"  placeholder="请输入房屋编号" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出租价格:</label>
                <div class="layui-input-inline">
                    <input type="text" name="price" lay-verify="required" placeholder="请输入出租价格" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">操作员:</label>
                <div class="layui-input-inline">
                    <input type="text" name="opername" id="opername" lay-verify="required" placeholder="请输入操作员" readonly="readonly" class="layui-input">
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
    layui.use(['table','form','layer','jquery','laydate'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        var laydate= layui.laydate;

        //查询条件的
        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });
        //编辑修改弹出层的
        laydate.render({
            elem:'#begindate',
            type:'datetime'
        });
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        });
        tableIns = table.render({
            elem:"#rentTable",
            url:"${pageContext.request.contextPath}/loadAllRent",
            title:"出租单管理",
            toolbar:"#rentToolBar",
            height: 400,
            cellMinWidth: 100,
            page:true,
            limits: [7,14,21] //每页条数选项
            ,limit: 7 ,//每页默认显示的条数
            cols:[[
                {type:'checkbox',fixed:'left'},
                {field:'rentid',title:'出租单编号',align:'center',width:'200'},
                {field:'price',title:'租金',align:'center',width:'90'},
                {field:'begindate',title:'开始时间',align:'center',width:'150'},
                {field:'returndate',title:'结束时间',align:'center',width:'150'},
                {field:'rentflag',title:'出租状态',align:'center',width:'100',templet:function (d) {
                        return d.rentflag='0'?'<font>已出租</font>':'<font>未出租</font>'
                    }},
                {field:'identity',title:'客户身份证号码',align:'center',width:'200'},
                {field:'id',title:'房屋编号',align:'center',width:'100'},
                {field:'opername',title:'操作员',align:'center',width:'150'},
                {field:'createtime',title:'创建时间',align:'center',width:'200'},
                {fixed: 'right',title: '操作',toolbar:"#rentBar",align: "center",width: "150"},
            ]],
            done:function (date,curr,count) {
                if (date.data.length=0 && curr !=1){
                    tableIns.reload({
                        page:{
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
                url:"${pageContext.request.contextPath}/loadAllRent?"+params,
                page:{curr: 1}
            })
        })

        let mainIndex;
        let url;
        //监听行工具栏事件
        table.on("tool(rentTable)",function (obj){
            console.log("obj", obj)
            //获取当前的行数据
            var data = obj.data;
            console.log("data", data);
            //获取事件
            var layEvent = obj.event;
            if(layEvent == 'edit'){
                updateRent(data);
            }else if(layEvent == 'del'){
                layer.confirm("您是否确认删除"+ data.rentid +"这个出租单吗？",function (index){

                    //发送ajax请求
                    $.get("${pageContext.request.contextPath}/deleteRent",{rentid:data.rentid},function (res){
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload;
                    })
                })
            }
        })


        //打开编辑页面
        function updateRent(data) {
            //打开更新窗口
            mainIndex = layer.open({
                type: 1,
                title:'订单修改页面',
                content: $("#saveOrUpdateDiv"),
                area:(["700px","350px"]),
                success:function (index) {
                    form.val("dataFrm",data);
                    url="${pageContext.request.contextPath}/updateRent";
                }
            });
        }
        //提交表单
        form.on("submit(doSubmit)",function(obj) {
            //获取表单数据
            var params = $("#dataFrm").serialize();
            $.post(url,params,function (obj) {
                layer.msg(obj.msg);
                layer.close(mainIndex);
                //刷新
                tableIns.reload();
            })
        })
    })

</script>
<script type="text/javascript">
    layui.use('form',function(){
        const form = layui.form;
        form.render();
    });
</script>
</body>
</html>

