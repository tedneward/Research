<#--
    Search Index Generator
    Generates a JSON file containing all pages for client-side search
-->
[
<#list published_pages as page>
  {
    "title": "<#escape x as x?json_string>${(page.title)!"Untitled"}</#escape>",
    "uri": "<#escape x as x?json_string>${page.uri}</#escape>",
    "summary": "<#escape x as x?json_string>${(page.summary)!""}</#escape>",
    "tags": [<#list page.tags as tag>"<#escape x as x?json_string>${tag}</#escape>"<#if tag_has_next>,</#if></#list>],
    "category": "<#escape x as x?json_string>${(page.category)!"general"}</#escape>"
  }<#if page_has_next>,</#if>
</#list>
]