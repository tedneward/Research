<#include "header.ftl">

	<#include "menu.ftl">

	<a href="#A">A</a> | <a href="#B">B</a> | <a href="#C">C</a> | <a href="#D">D</a> | <a href="#E">E</a> | <a href="#F">F</a> |
	<a href="#G">G</a> | <a href="#H">H</a> | <a href="#I">I</a> | <a href="#J">J</a> | <a href="#K">K</a> | <a href="#L">L</a> | <a href="#M">M</a> | 
	<a href="#N">N</a> | <a href="#O">O</a> | <a href="#P">P</a> | <a href="#Q">Q</a> | <a href="#R">R</a> | <a href="#S">S</a> | 
	<a href="#T">T</a> | <a href="#U">U</a> | <a href="#V">V</a> | <a href="#W">W</a> | <a href="#X">X</a> | <a href="#Y">Y</a> | 
	<a href="#Z">Z</a>

	<hr />
  <#list published_pages?sort_by("title") as page>
  <#assign hreffedTags = page.tags?map(t -> '<a href="${config.site_host}/tags/${t}/" id="${page.title[0]}">${t}</a>')>
  <p><em><a href="/${page.uri}" target="_blank">${page.title}</a> (${hreffedTags?join(",")})</em>: ${(page.summary)!"(No summary)"}</p>
  <p></p>
  </#list>

  <hr />

<#include "footer.ftl">
