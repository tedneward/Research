<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Research Notes</h1>
	</div>

	<!-- 
	<p>The notes listed below are in reverse-chronological order of modification (most recent first), with no categorization attached. The menu has categories and tags listed. Or browse to your hearts' content.</p>
	-->

	<a href="#a">A</a> | <a href="#b">B</a> | <a href="#c">C</a> | <a href="#d">D</a> | <a href="#e">E</a> | <a href="#f">F</a> |
	<a href="#g">G</a> | <a href="#i">I</a> | <a href="#j">J</a> | <a href="#k">K</a> | <a href="#l">L</a> | <a href="#m">M</a> | 
	<a href="#n">N</a> | <a href="#o">O</a> | <a href="#p">P</a> | <a href="#q">Q</a> | <a href="#r">R</a> | <a href="#s">S</a> | 
	<a href="#t">T</a> | <a href="#u">U</a> | <a href="#v">V</a> | <a href="#w">W</a> | <a href="#x">X</a> | <a href="#y">Y</a> | 
	<a href="#z">Z</a>
	
	<#list pages?sort_by("title") as page>
  		<#if (page.status == "published")>
  			<p><a href="${page.uri} id="${page.title[0]}"><em><#escape x as x?xml>${page.title}</#escape></em></a>: ${page.summary!"(No summary)"} (${page.date?string("dd MMMM yyyy")})</p>
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


<#include "footer.ftl">