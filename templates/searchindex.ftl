<#--
    Search Index Generator
    Generates a JSON file containing all pages for client-side search
-->
[
<#list published_pages as page>
  {
    "title": "<#escape x as x?js_string>${(page.title)!"Untitled"}</#escape>",
    "uri": "<#escape x as x?js_string>${page.uri}</#escape>",
    "summary": "<#escape x as x?js_string>${(page.summary)!""}</#escape>",
    "tags": [<#list page.tags as tag>"<#escape x as x?js_string>${tag}</#escape>"<#if tag_has_next>,</#if></#list>],
    "category": "<#escape x as x?js_string>${(page.category)!"general"}</#escape>",
    "date": "<#escape x as x?js_string>${(page.date?string("yyyy-MM-dd"))!"2020-01-01"}</#escape>"
  }<#if page_has_next>,</#if>
</#list>
]