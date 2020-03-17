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
			<h1 style="font-size: 24px; margin: 0;" class="">公文展示</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">公文展示</a>
		</div>
	</div>

	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12 thistable">
			<div class="bgc-w box box-primary">
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>							
					<th scope="col">公文标题</th>
					<th scope="col">发布时间</th>
					<th scope="col">公文状态</th>
					<th scope="col">公文内容</th>
				</tr>
               <#if prolist?? && (prolist?size > 0)>
				<#list prolist as prolist>
					<tr>
						<td><span>${(prolist.processName)!''}</span></td>
						<td><span>${(prolist.endTime)!''}</span></td>
						<#list statusname as status>
								<#if status.statusId==prolist.statusId>
								<td><span class="label ${status.statusColor}">${status.statusName}</span></td>
								</#if>
						</#list>
						<td><a href="particular?id=${prolist.processId}&typename=${(prolist.typeNmae)!''}" class="label xiugai">
						<span class="glyphicon glyphicon-search"></span> 查看</a> </td>
					</tr>
				</#list>
				</#if>
			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/paging.ftl"/>
</div>

</div>
</div>
