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
		<h1 style="font-size: 24px; margin: 0;" class="">犯人管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">犯人管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box">
			<!--盒子头-->
			<form action="prisionedit" method="post" onsubmit="return check();">
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
								<label class="control-label"><span>犯人姓名</span></label> <input
									name="prisionName" class="form-control usernameonliy" value="${(prision.prisionName)!''}"/>
									
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>监区号</span></label> <input
									name="prisionArea" class="form-control" value="${(prision.prisionArea)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>囚房号</span></label> <input
									name="prisionRoom" class="form-control" value="${(prision.prisionRoom)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"> <span>性别</span>
								</label> <select class="form-control" name="sex" value="${(prision.sex)!''}">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>出生日期</span></label> <input
									name="birthday" class="form-control" onclick="WdatePicker()" value="${(prision.birthday)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>入狱日期</span></label> <input
									name="intime" class="form-control" onclick="WdatePicker()" value="${(prision.intime)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>罪行</span></label> <input
									name="inreason" class="form-control" value="${(prision.inreason)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>原刑期</span></label> <input
									name="prisionTermOld" class="form-control" value="${(prision.prisionTermOld)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>现刑期</span></label> <input
									name="prisionTermNew" class="form-control" value="${(prision.prisionTermNew)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>刑期变更原因</span></label> <input
									name="changeReason" class="form-control" value="${(prision.changeReason)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>近期健康情况</span></label> <input
									name="health" class="form-control" value="${(prision.health)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>近期学习情况</span></label> <input
									name="education" class="form-control" value="${(prision.education)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>近期劳动情况</span></label> <input
									name="work" class="form-control" value="${(prision.work)!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>其它备注</span></label> <input
									name="remark" class="form-control" value="${(prision.remark)!''}"/>
							</div>
							
							<input type="hidden" name="prisionId" value="${(prision.prisionId)!''}"/>
						</div>
	
					</div>
				</div>
				<!--盒子尾-->
				<div class="box-footer">
					<input class="btn btn-primary" id="save" type="submit" value="保存" />
					<input class="btn btn-default" id="cancel" type="submit" value="取消"
						onclick="window.history.back();" />
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
	$.post("useronlyname",{"prisionName":$(this).val()},function(data){
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
			if (index == 9 || index == 10 || index == 11 || index == 12 || index == 13 || index == 14) {
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
