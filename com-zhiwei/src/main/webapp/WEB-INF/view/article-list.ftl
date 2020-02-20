<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<#include "common.ftl">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<#--<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />-->
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新闻管理</title>

</head>
<body>
<#include "commonHead.ftl">


<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		新闻管理
		<span class="c-gray en">&gt;</span>
		新闻列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>

	<#--aaaaaaaaaaaa-->
	<div class="Hui-article">
		<article class="cl pd-20">

			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
<#--				<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>-->
				<a class="btn btn-primary radius" data-title="发布新闻"  onClick="article_add()" href="Javascript:;"><i class="Hui-iconfont">&#xe600;</i> 发布新闻</a>
			  <#--   <a class="btn btn-primary radius" data-title="发布新闻" href="${ctx}/news/add"><i class="Hui-iconfont">&#xe600;</i> 发布新闻</a>-->
				</span>
				<#--<span class="r">共有数据：<strong>54</strong> 条</span>-->
			</div>
			<div id="app" class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">序号</th>
                            <th width="80">新闻编号</th>
							<th>标题</th>
							<th width="80">分类</th>
							<th width="200">发布时间</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>

<#--
					<#list  news as item >
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td>${item_index+1}</td>
							<td>${item.number}</td>
							<td class="text-l"><u style="cursor:pointer" class="text-primary" onclick="article_content('新闻内容','${ctx}/news/show/contentPage?id=${item.id}','90%','90%')" title="查看">${item.title}</u></td>
							&lt;#&ndash;   <c:if test="${goodsCategory.isHot eq 0}">&ndash;&gt;
					        <td><#if item.type ==1>格力新闻</#if><#if item.type ==2>行业动态</#if><#if item.type ==3>最新活动</#if></td>
							<td>${item.date?string('yyyy-MM-dd HH:mm:ss')}</td>
							<td class="f-14 td-manage">
                                <a style="text-decoration:none" class="ml-5" onClick="article_edit('新闻编辑','${ctx}/news/detail?id=${item.id}&artnum=${item.number}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${item.number}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
						</tr>
					</#list>-->





	<tr  v-for="(n,index) in newsList" class="text-c">
		<td><input type="checkbox" value="" name=""></td>
		<td>{{index+1}}</td>
		<td>{{n.number}}</td>
		<td class="text-l"><u style="cursor:pointer" class="text-primary">{{n.title}}</u></td>
		<#--   <c:if test="${goodsCategory.isHot eq 0}">-->
		<td><span  v-if="n.type==1">格力新闻</span><span   v-if="n.type==2">行业动态</span><span   v-if="n.type==3">企业文化</span></td>
		<td>{{n.date}}</td>
		<td class="f-14 td-manage">
			<a style="text-decoration:none" class="ml-5" v-on:click="article_edit('编辑',n.id,n.number)" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
			<a style="text-decoration:none" class="ml-5" v-on:click="article_del(this,n.number)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
		</td>
	</tr>


					</tbody>
				</table>
			</div>
		</article>
	</div>


	<#--aaaaaaaaa-->

</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${ctx}/lib/vue/vuejs-2.5.16.js"></script>
<script type="text/javascript" src="${ctx}/lib/vue/axios-0.18.0.js"></script>

<script type="text/javascript">




	var  vue = new Vue({
		el:"#app",
		data:{
			newsList:[]
		},
		methods:{
			findAll:function () {
				var _this=this;
				axios.get("/news/listInfo").then(function (response) {
					//console.log(response);
					_this.newsList=response.data;
				//	console.log(_this.newsList);
				}).catch(function (err) {
					console.log(err);

				})

			},
			article_edit:function(title,id,number){

				//console.log(id);
				//console.log(number);
				var url = '/news/detail?id='+id+'&artnum='+number;
				//console.log(url);
				var index = layer.open({
					type: 2,
					area: ['90%', '90%'],
					// offset: 'rb', //右下角弹出
					title:title,
					content: url,
					end: function () {
						location.reload();
					}

				});


			},
			article_del:function(obj,number){
				//console.log(obj);

				//return;

				axios.get("/news/newsDel",{
					params:{
						number:number

					}
				}).then(function (response) {
					//console.log(response);
					//_this.newsList=response.data;
					//	console.log(_this.newsList);

					if(response.data.code==200){
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {icon: 1, time: 1000});
					}else{
						layer.msg('删除失败!', {icon: 2, time: 1000});
					}

				}).catch(function (err) {
					console.log(err);

				})

			}



		},

		created(){
			this.findAll();
		}

	})



/*
    $('.table-sort').dataTable({
        "aaSorting": [[ 0, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
        ]
    });*/


    /*新闻-内容*/
    function article_content(title,url,w,h){
       /* var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);*/

        var index = layer.open({
            type: 2,
            area: ['80%', '80%'],
            // offset: 'rb', //右下角弹出
            title:title,
            content: url,
        /*    end: function () {
                location.reload();
            }*/
        });

    //    layer_show(title,url,w,h);
    }

/*资讯-添加*/
function article_add(){
	var url='${ctx}/news/add';
	var index = layer.open({
		type: 2,
		area: ['90%', '90%'],
		// offset: 'rb', //右下角弹出
		title:"增加",
		content: url,
		end: function () {
			location.reload();
		}
	});
	//layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url){
	var index = layer.open({
		type: 2,
		area: ['90%', '90%'],
		// offset: 'rb', //右下角弹出
		title:"修改",
		content: url,
		end: function () {
			location.reload();
		}

	});
	//layer.full(index);
	//layer.full(index);
}
/*资讯-删除*/
function article_del(obj,number){
	layer.confirm('确认要删除吗？',function(index){
	    /*console.log(obj);
	    alert(index);*/
	   // alert(id);
		$.ajax({
            type: 'POST',
			url: '${ctx}/news/newsDel',
            data:{
                number: number
            },
			dataType: 'json',
			success: function(data){
			   // if(data.code==200) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
            //    }
			},
			error:function(data) {
				layer.msg('删除失败!', {icon: 2, time: 1000});
			},
		});		
	});
}



/*新闻信息-批量删除*/

/*新闻信息回显*/





/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>