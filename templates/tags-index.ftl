<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>Tags</h1>
	</div>
	
	<!--<ul>-->
	<ul>
		<#list tags?sort_by("name") as tag>
		<li><a href="/${tag.uri}">${tag.name}</a></li>
		</#list>
	</ul>
	
<#include "footer.ftl">
