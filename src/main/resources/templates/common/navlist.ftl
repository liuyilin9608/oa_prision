<div class="col-md-12 green" >
	<!--右侧导航栏-->
	<ul class="nav navbar-nav navbar-right moredeep">
		<li><a href="javascript:changepath('/mytask');" class="green-none white"><span
				class="glyphicon glyphicon-flag"></span>
				<#if task==0>
					<span class="badge red-badge"></span>
				<#else>
					<span class="badge red-badge">${(task)!''}</span>
				</#if>
				</a>
		</li>
		<li class="dropdown">
		<!--设置导航栏头像面板--> 
		<a href="#" class="green-none white" data-toggle="dropdown">
				<img src="/image/${(user.imgPath)!'/timg.jpg'}" class="user-image" /> <span>${user.userName}</span>
		</a> <!--设置点击按钮弹出用户面板层-->
			<ul class="dropdown-menu" style="padding:0;">
				<li class="user-header green"><img src="/image/${(user.imgPath)!'/timg.jpg'}"
					class="img-circle" style="width: 100px;height:100px;" />
					<p class="white" style="">
						<span>${user.dept.deptName} </span> / <span> ${user.role.roleName}</span><br> <small>${user.position.name}</small>
					</p></li>
				<li class="user-footer">
					<div class="pull-left">
						<a href="javascript:changepath('userpanel');" class="btn btn-default">用户面板</a>
					</div>
					<div class="pull-right">
						<a href="loginout" class="btn btn-danger">退出登录</a>
					</div>
				</li>
			</ul>
		</li>
	</li>
</ul>
</div>
<script>
	function changeemail(){
		var email=$('.badge-mail').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-mail').text((emailNum-1));
		}else{
			$('.badge-mail').text("");
		}
	}
	function changeinformation(){
		var email=$('.badge-notice').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-notice').text((emailNum-1));
		}else{
			$('.badge-notice').text("");
		}
	}

</script>