<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "/common/commoncss.ftl">
<#include "/common/modalTip.ftl"/> 
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
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">公文展示</a>
		</div>
	</div>

	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12 thistable">
			<#include "/document/documentmanagepaging.ftl"/>
		</div>
	</div>