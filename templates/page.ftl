<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1><#escape x as x?xml>${(content.title)!"No Title"}</#escape></h1>
		<h3>${(content.summary)!"No summary"}</h3>
		<!-- tag tag tag -->
	</div>

	<script type="module">
	import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
	mermaid.initialize({ startOnLoad: true });
	</script>

	<p>${content.body}</p>

	<hr />

	Tags:
	<#list content.tags as tag>
	<a href="/tags/${tag}.html">${tag}</a>&nbsp;&nbsp;
	</#list>

	<p><em>Last modified ${content.date?string("dd MMMM yyyy")}</em></p>

	<hr />

<#include "footer.ftl">
