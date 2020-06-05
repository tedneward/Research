<#include "header.ftl">

	<#include "menu.ftl">

	<#if (content.title)??>
	<div class="page-header">
		<h1><#escape x as x?xml>${content.title}</#escape></h1>
	</div>
	<#else></#if>

	<p>${content.body}</p>

	<hr />

  <h3>Detail Pages:</h3>
  <ul>
  <#list published_pages?sort_by("title") as page>
  <#if page.summary??>
  <#if page.tags?seq_contains(content.category)>
  <li><em><a href="/${page.uri}" target="_blank">${page.title}</a></em> ${page.summary}</li>
  </#if>
  </#if>
  </#list>
  </ul>

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>

	<hr />

<#include "footer.ftl">
