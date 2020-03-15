<#include "/common/commoncss.ftl">
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">档案管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">档案管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box">
			<!--盒子头-->
			<form action="archiveedit" method="post" onsubmit="return check();">
				<div class="box-header">
					<h3 class="box-title">
						<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
							<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
						</a>
					</h3>
				</div>
				<!--盒子身体-->
				<div class="box-body no-padding">
					<div class="box-body">
						<div class="alert alert-danger alert-dismissable" role="alert"
							style="display: none;">
							错误信息:<button class="close thisclose" type="button">&times;</button>
							<span class="error-mess"></span>
						</div>
						<div class="row">				
						
							<div class="col-md-6 form-group">
								<label class="control-label"><span>正题名</span></label> <input
									name="title" class="form-control usernameonliy" value="${(archive.title)!''}"/>
									
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>副题名</span></label> <input
									name="subtitle" class="form-control" value="${(archive.subtitle)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>信息分类号</span></label> <input
									name="classno" class="form-control" value="${(archive.classno)!''}"/>
							</div>
		
							<div class="col-md-6 form-group">
								<label class="control-label"><span>管室代号</span></label> <input
									name="roomno" class="form-control" value="${(archive.roomno)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>全宗号</span></label> <input
									name="totelno" class="form-control" value="${(archive.totelno)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>微缩号</span></label> <input
									name="minino" class="form-control" value="${(archive.minino)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>实体分类号</span></label> <input
									name="entityno" class="form-control" value="${(archive.entityno)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>案卷号</span></label> <input
									name="archno" class="form-control" value="${(archive.archno)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>保管期限</span></label> <input
									name="retention" class="form-control" value="${(archive.retention)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>加密级别</span></label> <input
									name="securityLevel" class="form-control" value="${(archive.securityLevel)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>附注</span></label> <input
									name="note" class="form-control" value="${(archive.note)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>第一责任者</span></label> <input
									name="firstResp" class="form-control" value="${(archive.firstResp)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>其他责任者</span></label> <input
									name="otherResp" class="form-control" value="${(archive.otherResp)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>页数</span></label> <input
									name="page" class="form-control" value="${(archive.page)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>规格</span></label> <input
									name="norm" class="form-control" value="${(archive.norm)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>主题词</span></label> <input
									name="keyword" class="form-control" value="${(archive.keyword)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>存档日期</span></label> <input
									name="inputTime" class="form-control" onclick="WdatePicker()" value="${(archive.inputTime)!''}"/>
							</div>
							<input type="hidden" name="archId" value="${(archive.archId)!''}"/>
						</div>
	
					</div>
				</div>
				<!--盒子尾-->
				<div class="box-footer">
					<input class="btn btn-primary" id="save" type="submit" value="保存" />
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
<#include "/common/modalTip.ftl"/> 
<script type="text/javascript">
$(".usernameonliy").on("blur",function(){
	console.log("改变了！！~~");
	$.post("useronlyname",{"title":$(this).val()},function(data){
		console.log(data);
		$(".usernameonliyvalue").val(data);
	});
}); 
$(".usernameonliy").focus(function(){
	$(this).parent().removeClass("has-error has-feedback");
	$('.alert-danger').css('display', 'none');
});
function alertCheck(errorMess){
	$('.alert-danger').css('display', 'block');
	// 提示框的错误信息显示
	$('.error-mess').text(errorMess);
	
}
//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {
	console.log("开始进入了");
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			// 排除哪些字段是可以为空的，在这里排除
			if (index == 4 || index == 5 || index == 6 || index == 10 || index == 12 || index == 14) {
				return true;
			}
			// 获取到input框的兄弟的文本信息，并对应提醒；
			var brother = $(this).siblings('.control-label').text();
			var errorMess = "[" + brother + "输入框信息不能为空]";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			// 模态框的错误信息显示
			$('.modal-error-mess').text(errorMess);
			isRight = 0;
			return false;
		} else {
			return true;
		}
	});
	if (isRight == 0) {
		//modalShow(0);
		 return false;
	} else if (isRight == 1) {
		//modalShow(1);
		 return true;
	}
//	return false;
}
</script>
