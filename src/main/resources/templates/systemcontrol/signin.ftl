
<div class="jichu kaoqin " style="cursor: pointer;">
	<div class="wenzi">
			<a class="attendce" style="text-decoration: none; color:white;">
				<h2 class="">
					<#if alist??>
							${alist.attendHmtime}
						<#else>
							未签到
					</#if>
				</h2>
			</a>
			<p>
			状态<span class="glyphicon glyphicon-hand-up"></span>
				<#if alist??>
						${type}
					<#else>
						签到
				</#if>
			</p>
	</div>
	<div class="iconfont">
		<span class="glyphicon glyphicon-time"></span>
	</div>
	<a href="attendceatt" class="moreduo"> 更多 <span
		class="glyphicon glyphicon-circle-arrow-right"></span>
	</a>
</div>

<#if error??>
<#if error=='1'>
	<script>
	$(function(){
		alert("不能签到，不在正常签到时间内！");
	})
</script>

</#if>
<#if error=='2'>
	<script>
	$(function(){
		alert("还没有到签到时间");
	})
</script>

</#if>
<#if error=='3'>
	<script>
	$(function(){
		alert("没有设置该职工的工作类型");
	})
</script>
</#if>

<#if error=='4'>
	<script>
	$(function(){
		alert("已完成今日签到");
	})
</script>
</#if>

<#if error=='5'>
	<script>
	$(function(){
		alert("未到下班签到时间,不要重复上班签到");
	})
</script>
</#if>

<#if error=='6'>
	<script>
	$(function(){
		alert("不要重复下班签到");
	})
</script>
</#if>
</#if>
<script>
	$(".attendce").on('click',function(){
		confirm("您确定签到吗");
		$("#refresh").load('singin');
	});
    
</script>