<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1><#escape x as x?xml>${content.title}</#escape></h1>
		<!-- tag tag tag -->
	</div>

	<p>${content.body}</p>

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>

	<hr />

<#include "footer.ftl">
