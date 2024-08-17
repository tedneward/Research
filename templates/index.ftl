<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Research Notes</h1>
	</div>

	<a href="#A">A</a> | <a href="#B">B</a> | <a href="#C">C</a> | <a href="#D">D</a> | <a href="#E">E</a> | <a href="#F">F</a> |
	<a href="#G">G</a> | <a href="#H">H</a> | <a href="#I">I</a> | <a href="#J">J</a> | <a href="#K">K</a> | <a href="#L">L</a> | <a href="#M">M</a> | 
	<a href="#N">N</a> | <a href="#O">O</a> | <a href="#P">P</a> | <a href="#Q">Q</a> | <a href="#R">R</a> | <a href="#S">S</a> | 
	<a href="#T">T</a> | <a href="#U">U</a> | <a href="#V">V</a> | <a href="#W">W</a> | <a href="#X">X</a> | <a href="#Y">Y</a> | 
	<a href="#Z">Z</a>

	<hr />
	
	<#list pages?sort_by("title") as page>
  		<#if (page.status == "published")>
  			<p><a href="${page.uri}" id="${page.title[0]}"><em><#escape x as x?xml>${page.title}</#escape></em></a>: ${page.summary!"(No summary)"}</p>
  		</#if>
  	</#list>
	
	<hr />


<#include "footer.ftl">