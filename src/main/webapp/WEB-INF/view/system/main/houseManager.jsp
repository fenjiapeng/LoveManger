<%--
  Created by IntelliJ IDEA.
  Car: YQF
  Date: 2019/10/14
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>房屋管理</title>
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
            <label class="layui-form-label">价格:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="rentprice" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入价格" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房屋类型:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="housetype" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入房屋类型" style="height: 30px;border-radius: 10px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房屋描述:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="description" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入房屋描述" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">是否出租:</label>
            <div class="layui-input-inline">
                <input type="radio" name="isrenting" value="1" title="已出租">
                <input type="radio" name="isrenting" value="0" title="未出租">
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
<table class="layui-hide" id="carTable" lay-filter="carTable"></table>
<div id="carToolBar" style="display: none;">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-btn-radius" lay-event="deleteBatch">
        批量删除
    </button>
</div>
<div id="carBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="viewImage">查看大图</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">

                    <div class="layui-form-item">
                        <label class="layui-form-label">编号:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="id" autocomplete="off" class="layui-input"
                                   placeholder="请输入房屋编号" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">房屋类型:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="housetype" autocomplete="off" class="layui-input"
                                   placeholder="请输入房屋类型" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="location" autocomplete="off" class="layui-input"
                                   placeholder="请输入地址" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="carimgDiv">
                        <%--显示要上传的图片--%>
                        <img class="layui-upload-img thumbImg" id="showHouseImg">
                        <%--保存当前显示图片的地址--%>
                        <input type="hidden" name="houseimg" id="houseimg">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <label class="layui-form-label">房屋描述:</label>
                <div class="layui-input-block" style="padding: 5px">
                    <input type="text" name="description" autocomplete="off" class="layui-input"
                           placeholder="请输入房屋描述" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">出租价格:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="rentprice" class="layui-input" lay-verify="required|number"
                               placeholder="请输入出租价格" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">出租押金:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="deposit" class="layui-input" lay-verify="required|number"
                               placeholder="请输入出租押金" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">是否出租:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isrenting" value="1" title="已出租">
                        <input type="radio" name="isrenting" value="0" checked="checked" title="未出租">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                    <button type="button"
                            class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                            lay-filter="doSubmit" lay-submit="">提交
                    </button>
                    <button type="reset"
                            class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
                        重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<%--查看大图弹出的层开始--%>
<div id="viewCarImageDiv" style="display: none;text-align: center">
    <img alt="车辆图片" width="700px" height="450px" id="view_carimg">
</div>

<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script type="text/javascript">

    layui.use(['jquery','table','form','upload','layer'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form = layui.form;
        var upload = layui.upload;
        var layer = layui.layer;


        //渲染数据
        tableIns = table.render({
            elem:'#carTable',//渲染的表格对象
            url: "${pageContext.request.contextPath}/loadAllHouse",//数据接口
            title: "房屋数据表",
            toolbar: "#carToolBar",
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

        //模糊查询
        $("#doSearch").click(function () {
            //获取表单参数
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${pageContext.request.contextPath}/loadAllHouse?"+params,
                page:{curr: 1}
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
            }else if(layEvent =='del'){
                layer.confirm("是否确认删除！",function (index) {
                    $.get("${pageContext.request.contextPath}/deleteHouse",{"id":data.id},function (result) {
                        layer.msg(result.msg);
                        //刷新
                        tableIns.reload();
                    })
                });
            }else if (layEvent == 'edit'){
                openUpdateHouse(data);
            }
        })

        //更新方法
        function  openUpdateHouse(data){
                mainIndex = layer.open({
                    type:1,
                    title: '修改房屋信息',
                    content: $("#saveOrUpdateDiv"),
                    area: ['700px','480px'],
                    success:function (index) {
                        //显示数据
                        form.val("dataFrm",data);
                        //显示上传图片
                        $("#showHouseImg").attr("src","${pageContext.request.contextPath}/downloadSowFile?path="+data.houseimg);
                        // 设置点击提交时，图片的提交地址
                        url = "${pageContext.request.contextPath}/updateHouse";
                        $("#id").attr("readonly","readonly");
                    }
                })
        }
        //查看大图da方法
        function showHouseImg(data) {
            layer.open({
                type:1,
                title:'图片展示',
                content:$('#viewCarImageDiv'),
                area:['750px','500px'],
                success: function (index) {
                    //通过改变img的src属性让图片展示
                    $('#view_carimg').attr("src","${pageContext.request.contextPath}/downloadSowFile?path="+data.houseimg);
                }
            })
        }

        //监听头部工具栏
        table.on('toolbar(carTable)',function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddHouse();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        })

        var mainIndex;
        var url;
        //打开添加yemain
        function openAddHouse() {
          mainIndex = layer.open({
                type:1,
              title: '添加房屋信息',
              content: $("#saveOrUpdateDiv"),
              area: ['700px','480px'],
              success:function (index) {
                  //清除表单数据
                  $("#dataFrm")[0].reset();
                  //显示上传图片
                  $("#showHouseImg").attr("src","${pageContext.request.contextPath}/downloadSowFile?path=images/layui.png");
                  //设置图片的value
                  $("#houseimg").val("images/layui.png");
                  // 设置点击提交时，图片的提交地址
                  url = "${pageContext.request.contextPath}/addHouse";
                  $("#id").removeAttr("readonly","readonly");

              }
            })
        }


        //保存数据提交表单

        form.on("submit(doSubmit)",function (obj) {
            //获取表单数据
           var params = $("#dataFrm").serialize();
            $.post(url , params ,function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                //刷新
                tableIns.reload();
            })
        })
        //上传图片
        upload.render({
            elem:"#carimgDiv",
            url:"${pageContext.request.contextPath}/uploadFile",
            method:"post",
            acceptMime: "images/*",
            field:"multipartFile",
            done:function (res,index,upload) {
                //设置图片属性，让图片在弹出层显示
                $("#showHouseImg").attr("src","${pageContext.request.contextPath}/downloadSowFile?path="+res.data.src);
                //设置input中的value值，保存数据库
                $("#houseimg").val(res.data.src);
                //设置背景样式
                $("#carimgDiv").css("background","#fff");
            }
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

