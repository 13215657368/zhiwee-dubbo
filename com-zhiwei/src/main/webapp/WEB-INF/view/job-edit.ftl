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
<script type="text/javascript" src="${ctx}/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>职位管理</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>职位名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  value="${job.role}" id="role" name="role">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>工作地点：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  value="${job.location}"  id="location" name="location">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>学历：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="education" name="education" class="select">
					<option value="0">请选择</option>
					<option  <#if job.education=='1'>selected</#if> value="1">博士</option>
					<option  <#if job.education=='2'>selected</#if> value="2">硕士</option>
					<option  <#if job.education=='3'>selected</#if> value="3">本科</option>
					<option  <#if job.education=='4'>selected</#if> value="4">高中及以下学历</option>
				</select>
				</span> </div>
		</div>



		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>截止日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"   value="${job.date}" id="date" name="date">
			</div>
		</div>






		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>招聘信息：</label>
			<div id ="cont"></div>
			<div class="formControls col-xs-8 col-sm-9">
		<#-- <script id="editor" type="text/plain" style="width:100%;height:400px;"></script>-->
					<textarea   style="width:100%;height:400px;" class="span12 ckeditor"  id="editor" name="content">
                     ${job.details}
				  </textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="job_save_submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 发布更新</button>
			</div>
		</div>
	</form>
	<#--<button onclick="test()" type="button">test</button>-->
	<#--<div id="test">aa</div>-->
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

	/*function test() {
	  //  alert("aaaaa");
       $.ajax({
            type: 'GET',
            url:"${ctx}/jobs/portal/jobInfoTest?id=14",
            dataType: 'json',
            success:function(result) {
                console.log(result);
				/!*alert(JSON.stringify(result));
                $("#test").append(result.details);*!/
            }
        })
    }*/

	/*function test() {
        $.ajax({
            type: 'POST',
            url:"${ctx}/jobs/portal/jobInfo?id=12",
            dataType: 'json',
            success:function(result) {
              console.log(result.details);
              $("#cont").html(result.details);
            }
        })
    }*/

	<#--职位添加-->
	function job_save_submit() {
	    var  id = ${job.id}
	    var role=$("#role").val();
	    var location=$("#location").val();
	    var education= $("#education option:selected").val();
	    var  date = $("#date").val();
	    var   details=UE.getEditor('editor').getContent();
	    $("#test").append('<table width="98%" cellpadding="0" cellspacing="0" class="joinus_tb"><tbody style="box-sizing: border-box; width: 840px;"><tr style="box-sizing: border-box; text-align: center;" class="firstRow"><td height="27" colspan="4" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;"><span style="box-sizing: border-box; font-weight: 700;">招聘岗位：创业实习生</span></td></tr><tr style="box-sizing: border-box; text-align: center;"><td width="17%" height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">招聘人数：</td><td width="33%" height="27" class="joinus_tb_td  " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">10000人</td><td width="17%" height="27" class="joinus_tb_td tdbg tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">招聘部门：</td><td width="33%" height="27" class="joinus_tb_td  " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;"><br/></td></tr><tr style="box-sizing: border-box; text-align: center;"><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">性别要求：</td><td height="27" class="joinus_tb_td " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">不限</td><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">年龄要求：</td><td height="27" class="joinus_tb_td " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;"><br/></td></tr><tr style="box-sizing: border-box; text-align: center;"><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">学历要求：</td><td height="27" class="joinus_tb_td " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">本科及以上</td><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">工作经验：</td><td height="27" class="joinus_tb_td " style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">不限及以上</td></tr><tr style="box-sizing: border-box; text-align: center;"><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">招聘类型：</td><td height="27" class="joinus_tb_td" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">兼职</td><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">发布时间：</td><td height="27" class="joinus_tb_td" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">2018-01-21日</td></tr><tr style="box-sizing: border-box; text-align: center;"><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">工作地区：</td><td height="27" class="joinus_tb_td" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">安徽省内各大创业实习点</td><td height="27" class="joinus_tb_td tdbg" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">截止时间：</td><td height="27" class="joinus_tb_td" style="box-sizing: border-box; padding: 0px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">招满截止日</td></tr><tr style="box-sizing: border-box;"><td height="30" colspan="4" class="joinus_tb_td tdbgtwo" style="box-sizing: border-box; padding: 10px 40px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;">详细说明：<br style="box-sizing: border-box;"/></td></tr><tr style="box-sizing: border-box;"><td height="27" colspan="4" class="joinus_tb_td tdbgtwo" style="box-sizing: border-box; padding: 10px 40px; border-bottom-color: rgb(216, 220, 222); border-right-color: rgb(216, 220, 222); line-height: 24px;"><span style="box-sizing: border-box; font-weight: 700;">一. 岗位职责&nbsp;</span><br style="box-sizing: border-box;"/>1、协助卖场、专卖店导购员、经销商进行格力空调现场推荐及销售；<br style="box-sizing: border-box;"/>2、深入小区，为居民提供空调产品免费咨询、格力产品维修、以旧换新等服务，同时进行格力产品展销。<br style="box-sizing: border-box;"/><br style="box-sizing: border-box;"/><span style="box-sizing: border-box; font-weight: 700;">二. 任职资格</span><br style="box-sizing: border-box;"/>1、在读大一学生优先考虑，能够长期固定在实习地点附近；<br style="box-sizing: border-box;"/>2、积极主动，表达流畅，有一定的影响说服能力；<br style="box-sizing: border-box;"/>3、有一定的营销思维，能够融入客户，推广产品；<br style="box-sizing: border-box;"/><br style="box-sizing: border-box;"/><span style="box-sizing: border-box; font-weight: 700;">三. 为您提供</span><br style="box-sizing: border-box;"/>1、无责任底薪130元/天+空调销售提成+餐补+岗前培训<br style="box-sizing: border-box;"/>2、表现优异者可提供实习证明<br style="box-sizing: border-box;"/>3、提供免费专业培训</td></tr></tbody></table><p><br/></p>');
       //  $("#test").html("<table border="0" cellpadding="0" cellspacing="0"><tr><td>aa</td</tr></table>");
       //  return;
     /*   alert(role);
        alert(location);
        alert(education);
        alert(date);
	    alert(details);*/

        $.ajax({
            type: 'POST',
            url:"${ctx}/jobs/update",
            //     contentType: 'application/json;charset=UTF-8',
            data:{
                id: id,
                role: role,
                location: location,
                education: education,
                date:date,
                details: details
            },
            dataType: 'json',
            success:function(result) {
				if(result.code==200){
					layer.msg('更新成功',{
						icon:1,
						time:1000,
						end:function(){
							//关闭除父级外的子页面
							var index = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index);//关闭当前页
							//parent.location.reload();//刷新父级页面
						}
					})
				}else{
					layer.msg("更新失败，请检查对应信息是否完整",{
						icon:2,
						time:1500,
					})

				}
            }
        })


    }



$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>