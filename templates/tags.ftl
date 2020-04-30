<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>Tag: ${tag}</h1>
	</div>
	
	<!--<ul>-->
	<ul>
		<#list tagged_documents as doc>
		<li><a href="/${doc.uri}">${doc.title}</a></li>
		</#list>
	</ul>
	
<#include "footer.ftl">