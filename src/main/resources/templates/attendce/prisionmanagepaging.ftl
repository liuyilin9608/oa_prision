<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="prisionedit" class="label label-success" style="padding: 5px;">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</a> 
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm prisionsearch"
					placeholder="查找..." />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default"><span
						class="glyphicon glyphicon-search prisionsearchgo"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>				
					<th scope="col">囚号</th>
					<th scope="col">姓名</th>
					<th scope="col">监区号</th>
					<th scope="col">囚房号</th>
					<th scope="col">性别</th>
					<th scope="col">入狱时间</th>
					<th scope="col">入狱原因</th>
					<th scope="col">原刑期</th>
					<th scope="col">现刑期</th>
					<th scope="col">刑期变化原因</th>
					<th scope="col">健康</th>
					<th scope="col">学习</th>
					<th scope="col">劳动</th>
					<th scope="col">操作</th>
				</tr>
				<#list prisions as prision>
					<tr>
						<td><span>${(prision.prisionId)!''}</span></td>
						<td><span>${(prision.prisionName)!''}</span></td>
						<td><span>${(prision.prisionArea)!''}</span></td>
						<td><span>${(prision.prisionRoom)!''}</span></td>
						<td><span>${(prision.sex)!''}</span></td>
						<td><span>${(prision.intime?datetime)!''}</span></td>
						<td><span>${(prision.inreason)!''}</span></td>
						<td><span>${(prision.prisionTermOld)!''}</span></td>
						<td><span>${(prision.prisionTermNew)!''}</span></td>
						<td><span>${(prision.changeReason)!''}</span></td>
						<td><span>${(prision.health)!''}</span></td>
						<td><span>${(prision.education)!''}</span></td>
						<td><span>${(prision.work)!''}</span></td>				
						<td><a  href="prisionedit?prisionId=${prision.prisionId}" class="label xiugai"><span
								class="glyphicon glyphicon-edit"></span> 修改</a> <a
							onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
							href="prisiondelete?prisionId=${prision.prisionId}" class="label shanchu"><span
								class="glyphicon glyphicon-remove"></span> 删除</a></td>
					</tr>
				</#list>
			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/paging.ftl"/>
</div>
