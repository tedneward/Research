<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1>All Pages</h1>
	</div>
	
	<ul>
		<#list published_pages?sort_by("title") as page>
		<li><em><a href="/${page.uri}" target="_blank">${page.title}</a></em> ${page.summary}</li>
		</#list>
	</ul>

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>

	<hr />

<#include "footer.ftl">
