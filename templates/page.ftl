<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1><#escape x as x?xml>${content.title?!"(No title)"}</#escape></h1>
		<h3>${content.summary!""}</h3>
		<!-- tag tag tag -->
	</div>

	<p>${content.body}</p>

	<hr />

	Tags:
	<#list content.tags as tag>
	<a href="/tags/${tag}.html">${tag}</a>&nbsp;&nbsp;
	</#list>

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>

	<hr />

<#include "footer.ftl">
