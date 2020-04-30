<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Most recently modified</h1>
	</div>
	<!-- Eventually restrict this to the first twenty or so? -->
	<#list pages?sort_by("date")?reverse[0..*19] as page>
  		<#if (page.status == "published")>
  			<a href="${page.uri}"><h1><#escape x as x?xml>${page.title}</#escape></h1></a>
  			<p>${page.date?string("dd MMMM yyyy")}</p>
  		</#if>
  	</#list>
	
	<hr />

<#include "footer.ftl">