<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Research Notes</h1>
	</div>

	<!-- 
	<p>The notes listed below are in reverse-chronological order of modification (most recent first), with no categorization attached. The menu has categories and tags listed. Or browse to your hearts' content.</p>
	-->

	<a href="#A">A</a> | <a href="#B">B</a> | <a href="#C">C</a> | <a href="#D">D</a> | <a href="#E">E</a> | <a href="#F">F</a> |
	<a href="#G">G</a> | <a href="#I">I</a> | <a href="#J">J</a> | <a href="#K">K</a> | <a href="#L">L</a> | <a href="#M">M</a> | 
	<a href="#N">N</a> | <a href="#O">O</a> | <a href="#P">P</a> | <a href="#Q">Q</a> | <a href="#R">R</a> | <a href="#S">S</a> | 
	<a href="#T">T</a> | <a href="#U">U</a> | <a href="#V">V</a> | <a href="#W">W</a> | <a href="#X">X</a> | <a href="#Y">Y</a> | 
	<a href="#Z">Z</a>

	<hr />
	
<!-- might need ((page.title)?string[0]).upper_case -->

	<#list pages?sort_by("title") as page>
  		<#if (page.status == "published")>
  			<p><a href="${page.uri}" id="${page.title[0]}"><em><#escape x as x?xml>${page.title}</#escape></em></a>: ${page.summary!"(No summary)"} (${page.date?string("dd MMMM yyyy")})</p>
  		</#if>
  	</#list>
	
	<hr />


<#include "footer.ftl">