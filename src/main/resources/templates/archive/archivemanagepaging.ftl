<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="archiveedit" class="label label-success" style="padding: 5px;">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</a> 
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm archivesearch"
					placeholder="查找..." />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default"><span
						class="glyphicon glyphicon-search archivesearchgo"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>			
					
					<th scope="col">正题名</th>
					<th scope="col">副题名</th>
					<th scope="col">信息分类号</th>
					<th scope="col">管室代号</th>
					<th scope="col">全宗号</th>
					<th scope="col">微缩号</th>
					<th scope="col">实体分类号</th>
					<th scope="col">案卷号</th>
					<th scope="col">保管期限</th>
					<th scope="col">加密级别</th>
					<th scope="col">附注</th>
					<th scope="col">第一责任者</th>
					<th scope="col">其他责任者</th>
					<th scope="col">页数</th>
					<th scope="col">规格</th>
					<th scope="col">主题词</th>
					<th scope="col">存入时间</th>
					<th scope="col">操作</th>
				</tr>
				<#list archives as archive>
					<tr>
						<td><span>${(archive.title)!''}</span></td>
						<td><span>${(archive.subtitle)!''}</span></td>
						<td><span>${(archive.classno)!''}</span></td>
						<td><span>${(archive.roomno)!''}</span></td>
						<td><span>${(archive.totelno)!''}</span></td>
						<td><span>${(archive.minino)!''}</span></td>
						<td><span>${(archive.entityno)!''}</span></td>
						<td><span>${(archive.archno)!''}</span></td>
						<td><span>${(archive.retention)!''}</span></td>
						<td><span>${(archive.securityLevel)!''}</span></td>
						<td><span>${(archive.note)!''}</span></td>
						<td><span>${(archive.firstResp)!''}</span></td>
						<td><span>${(archive.otherResp)!''}</span></td>
						<td><span>${(archive.page)!''}</span></td>
						<td><span>${(archive.norm)!''}</span></td>
						<td><span>${(archive.keyword)!''}</span></td>
						<td><span>${(archive.inputTime)!''}</span></td>
						<td><a  href="archiveedit?archiveId=${archive.archId}" class="label xiugai"><span
								class="glyphicon glyphicon-edit"></span> 修改</a> <a
							onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
							href="archivedelete?archiveId=${archive.archId}" class="label shanchu"><span
								class="glyphicon glyphicon-remove"></span> 删除</a></td>
					</tr>
				</#list>
			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/paging.ftl"/>
</div>
