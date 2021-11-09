<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Research Notes</h1>
	</div>

	<!-- 
	<p>The notes listed below are in reverse-chronological order of modification (most recent first), with no categorization attached. The menu has categories and tags listed. Or browse to your hearts' content.</p>
	-->
	
	<#list pages?sort_by("title") as page>
  		<#if (page.status == "published")>
  			<p><a href="${page.uri}"><em><#escape x as x?xml>${page.title}</#escape></em></a>: ${page.summary!"(No summary)"} (${page.date?string("dd MMMM yyyy")})</p>
  		</#if>
  	</#list>
	<#--
	<#list pages?sort_by("date")?reverse[0..*19] as page>
  		<#if (page.status == "published")>
  			<p><a href="${page.uri}"><em><#escape x as x?xml>${page.title}</#escape></em></a>: ${page.summary!"(No summary)"} (${page.date?string("dd MMMM yyyy")})</p>
  		</#if>
  	</#list>
	-->
	
	<hr />

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>


<#include "footer.ftl">