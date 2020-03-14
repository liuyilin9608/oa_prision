<div class="bgc-w box box-primary">
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>							
					<th scope="col">公文标题</th>
					<th scope="col">发布时间</th>
					<th scope="col">公文状态</th>
					<th scope="col">公文内容</th>
				</tr>
				<#list prolist as prolist>
					<tr>
						<td><span>${(prolist.processName)!''}</span></td>
						<td><span>${(prolist.endTime)!''}</span></td>
						<<#list statusname as status>
								<#if status.statusId==prolist.statusId>
								<td><span class="label ${status.statusColor}">${status.statusName}</span></td>
								</#if>
						</#list>
						<td><a href="particular?id=${prolist.processId}&typename=${(prolist.typeNmae)!''}" class="label xiugai"><span
									class="glyphicon glyphicon-search"></span> 查看</a> </td>
					</tr>
				</#list>
			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/paging.ftl"/>
</div>
