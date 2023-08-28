<%--
  Created by IntelliJ IDEA.
  Car: pageContext.request.contextPath
  Date: 2020 3/8
  Time 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>出租管理</title>
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
</head>
<body class="childrenBody">

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>

<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="identity" id="identity" autocomplete="off"
                       class="layui-input layui-input-inline"
                       placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
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
<div id="content" style="display: none;">
    <table id="carTable" lay-filter="carTable"></table>
    <div id="carBar" style="display: none;">
        <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="rentCar">出租</a>
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="viewImage">查看大图</a>
    </div>
</div>

<%--添加和修改的弹出层开始--%>
<div style="display: none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentid" lay-verify="required" readonly="readonly" placeholder="请输入出租单号"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">起租时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="begindate" id="begindate" lay-verify="required" placeholder="请输入起租时间" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="returndate" id="returndate" lay-verify="required" placeholder="请输入还车时间" class="layui-input">
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
                    <input type="text" name="id" lay-verify="required" readonly="readonly"  placeholder="请输入车牌号" class="layui-input">
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
                        lay-filter="dosubmit" lay-submit="">提交
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                </button>
            </div>
        </div>
    </form>
</div>

<%--查看大图弹出的层开始--%>
<div id="viewCarImageDiv" style="display: none;text-align: center">
    <img alt="出租图片" id="view_carimg">
</div>

<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery','table','form','laydate','layer'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form = layui.form;
        var laydate = layui.laydate;
        var layer = layui.layer;

        //渲染日期表格
        laydate.render({
            elem:'#begindate',
            type:'datetime'
        });
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        })
        //初始化数据表格
        var tableIns;
        function initHouseDate(){
            tableIns = table.render({
                elem:'#carTable',//渲染的表格对象
                url: "${pageContext.request.contextPath}/loadAllHouse",//数据接口
                title: "房屋数据表",
                height: 400,
                cellMinWidth: 100,
                page:true,
                limits: [7,14,21] //每页条数选项
                ,limit: 7 ,//每页默认显示的条数
                cols:[[
                    {type:'checkbox',ficed:'left'},
                    {field:'id',title:'编号' ,align:'center',width:'50'},
                    {field:"housetype",title:"房屋类型", align:"center",width:"150"},
                    {field:"location",title:"地址", align:"center",width:"200"},
                    {field:"rentprice",title:"租金(月/元)", align:"center",width:"100"},
                    {field:"deposit",title:"押金/元", align:"center",width:"90"},
                    {field:"isrenting",title:"是否出租", align:"center",width:"150",templet:function (d) {
                            return d.isrenting=='1'?'<font>已出租</font>':'<font>未出租</font>'
                        }},
                    {field:"description",title:"描述", align:"center",width:"200"},
                    {field:"houseimg",title:"图片", align:"center",width:"100",templet:function (d) {
                            return "<img width='40' height='40' src=${pageContext.request.contextPath}/downloadSowFile?path="+d.houseimg+">"
                        }},
                    {field:"createtime",title:"创建时间", align:"center",width:"200"},
                    {fixed:"right" ,title: "操作", toolbar:"#carBar",align: "center",width: "200"},
                ]],
            })
        }

        //根据身份证号码查询
        $("#doSearch").click(function () {
            //获取表单数据
            var params = $("#searchFrm").serialize();
            //检查客户是否存在
            $.post("${pageContext.request.contextPath}/checkCustomerExit",params,function (obj) {
                if (obj.code>=0){
                    $("#content").show();
                    initHouseDate();
                }else {
                    layer.msg("客户不存在,请检查！");
                    //影藏
                    $("#content").hide();
                }
            })
        })
        //监听行工具栏
        table.on('tool(carTable)',function (obj) {
            //获取当前行数据
            var data = obj.data;
            //获取事件
            var layEvent = obj.event;
            if (layEvent=='viewImage'){
                showHouseImg(data);
            }else if(layEvent =='rentCar'){
               //出租
                openRentHouse(data);
            }
        })
        //打开出租页面
        var mainIndex;
        function openRentHouse(data) {
            mainIndex = layer.open({
                type:1,
                title:'添加出租',
                content:$('#saveOrUpdateDiv'),
                area:['700px','380px'],
                success: function (index) {
                    //清空数据表单
                    $("#dataFrm")[0].reset();
                    //获取参数
                    var price = data.rentprice;
                    var identity = $("#identity").val();
                    var id = data.id;
                    //获取后台数据
                    $.get("${pageContext.request.contextPath}/initRentFrom",{
                        identity:identity,
                        price:price,
                        id:id
                    },function (obj) {
                        form.val("dataFrm",obj);
                    })
                }
            })
        }

        //差看图片
        function showHouseImg(data) {
            layer.open({
                type:1,
                title:'图片展示',
                content:$('#viewCarImageDiv'),
                area:['1100px','500px'],
                success: function (index) {
                    //通过改变img的src属性让图片展示
                    $('#view_carimg').attr("src","${pageContext.request.contextPath}/downloadSowFile?path="+data.houseimg);
                }
            })
        }
        //提交表单
        form.on("submit(dosubmit)",function(obj) {
            //获取表单数据
            var params = $("#dataFrm").serialize();
            $.post("${pageContext.request.contextPath}/saveRent",params,function (obj) {
                layer.msg(obj.msg);
                layer.close(mainIndex);
                $("#content").hide();
            })
        })
    })

</script>
</body>
</html>

