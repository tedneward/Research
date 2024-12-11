<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>Tag: ${tag}</h1>
	</div>
	
	<!--<ul>-->
	<ul>
		<#list tagged_documents?sort_by("title") as doc>
		<li><a href="${config.site_host}/${doc.uri}" target="_blank">${doc.title}</a></li>
		</#list>
	</ul>
	
<#include "footer.ftl">