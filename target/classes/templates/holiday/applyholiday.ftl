<#include "/common/commoncss.ftl">
<link rel="stylesheet" href="css/common/tanchuang.css" />
<style>
.modal-open {
    overflow: auto;
}
.box-header{
  text-align: center;
  border-bottom: 0px solid #f4f4f4;
}
.title{
	text-align: center;
}

.inpu{
 margin-top: -6px;

}

.control-label{
	display:inline-block;
	font-weight: 400;
}
.bo{
	margin: 0px auto;
	width: 80%;
}


.table th,.chebox,.table>tbody>tr>td{
font-weight: 400;
 text-align: center;
}
.inside{
width: 100%;
}
.inside thead{
background-color: rgba(76, 175, 95, 0.06);
}
.inside>tbody>tr>td{
 border-top: 0px solid #ddd;
}
.inside>tbody>tr>td{
border-bottom: 1px solid #ddd;
border-left: 1px solid #ddd;
}
.tdrig{
border-right: 1px solid #ddd;
}
.bo>tbody>tr>td,.inside>thead>tr>th {
    border-top: 0px solid #ddd;
    border-bottom: 0px solid #ddd;
    border-left: 0px solid #ddd;
}
.text {
	min-height: 100px;
}
.shuoming{
min-height: 120px;
}
.reciver{
	position: relative;
    float: right;
    margin-top: -28px;
    right: 5px;
    cursor: pointer;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">请假申请</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">请假申请</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		
		<div class="bgc-w box">
			<form action="uploadholiday" method="post" onsubmit="return check();" >
			<div class="box-header">
				<table class="bo table ">
			
				<tr >
					<td colspan="14" class="title"><h2>请假申请</h2></td>
			
				</tr>
				<tr style="opacity: 0;">
					<td colspan="14">11</td>
				</tr>
				<tr >
					<td colspan="14" style="text-align: left;">
						<!--錯誤信息提示  -->
					<div class="alert alert-danger alert-dismissable" style="display:none;" role="alert">
						错误信息:<button class="thisclose close" type="button">&times;</button>
						<span class="error-mess"></span>
					</div>
					</td>

				<tr >
					<td class="title" ><label class="control-label">申请人</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu"
					readonly="readonly" style="background-color:#fff;" value="${username}"/></td>
					
					<td class="title" ><label class="control-label">审核人员</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu cheng"
					    readonly="readonly" style="background-color:#fff;" name="auditor"/>
							<div class="reciver">
								<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
							</div>
					</td>
				</tr>
				
				<tr >
					<td class="title" ><label class="control-label">开始日期</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu holistart"  name="proId.startTime"/></td>
					<td class="title" ><label class="control-label">结束日期</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu holiend" name="proId.endTime"/></td>
				</tr>
				<tr >
					<td class="title" ><label class="control-label">代班人员</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu cheng"
					    readonly="readonly" style="background-color:#fff;" name="handuser"/>
						<div class="reciver">
								<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
						</div>
					</td>
					<td class="title" ><label class="control-label">请假类型</label></td>
					<td colspan="6">
						<select class="form-control inpu" name="typeId">
							<#list overtype as out>
							<option value="${out.typeId}">${out.typeName}</option>
							</#list>
						</select>
					</td>
				</tr>
				</tr>
					<td class="title"><label class="control-label">请假天数</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu" name ="leaveDays"  /></td>
					<td class="title"><span >紧急程度</span></td>
					<td colspan="6">
						<select class="form-control inpu" name="proId.deeply">
							<#list processType as type>
							<option value="${type.typeId}">${type.typeName}</option>
							</#list>
						</select>
					</td>
				</tr>
				<tr >
					<td class="title" ><label class="control-label">请假原因</label></td>
					<td  colspan="6"><textarea class="form-control text"  name="leaveReason"></textarea></td>
					
				</tr>
				<tr>
				    <td colspan="14" style="text-align: right;" >
					<input   type="text" class="day" name="proId.procseeDays" hidden="hidden"/>
					<input   type="text" value="请假申请" name="val" hidden="hidden"/>
						<input class="btn btn-primary" id="save" type="submit" value="保存" />
					</td>
				</tr>
				</table>
			</div>
			</form>
		</div>
	</div>
</div>
<input type="text" class="recive_list" style="display:none;">
<script>
$(function(){
	$('.reciver').on('click',function(){
		$('#myModal').modal("toggle");
		$(this).siblings("input").val("");
		$('.reciver').removeClass("qu");
		$(this).addClass("qu");
	});
	$(".recive_list").change(function(){
		var	$val=$(this).val();
		$(".qu").siblings("input").val($val);
	
	});
});
 $(function(){
		$(".days").focus(function(){
			var $star=new Date($(".holistart").val());
			var $end=new Date($(".holiend").val());
			tt=$end.getTime()-$star.getTime();
			$(".days").val(Math.ceil(tt/ (24*60*60*1000)));
			$(".day").val(Math.ceil(tt/ (24*60*60*1000)));
		});
	})

//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {
	console.log("开始进入了");
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			if($(this).hasClass("cha")){
				return true;
			}
			// 排除哪些字段是可以为空的，在这里排除
			/* if (index == 5||index == 6) {
				return true;
			}  */
			
			// 获取到input框的兄弟的文本信息，并对应提醒；
			console.log(index);
			var errorMess = "红色提示框不能为空!";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			
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
<#include "/common/reciver.ftl">
<script type="text/javascript" src="js/common/data.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>