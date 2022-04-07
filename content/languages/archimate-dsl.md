title=Archimate DSL
tags=language, architecture
summary=A DSL for generating Archimate diagrams from source.
~~~~~~

[Source](https://github.com/mmorga/archimate-dsl)

Example
```
model(
  "DSL Example",
  version: "1.0",
  documentation: "This is an example of the DSL"
) do |model|
  bs = business_service "take order"
  bi = business_interface "store front"
  br = business_role "order taker"
  ba = business_actor "sales"
  bf = business_function "order initiation"
  bo = business_object "order", documentation: <<~MARKDOWN
    I can explain all about my order object here.

    I can use markdown

    * bullets
    * and things
  MARKDOWN

  bi.assigned_to(bs)
  bf.realizes(bs)
  bf.accesses(bo)
  ba.assigned_to(br)
  br.composes(bi)
  br.assigned_to(bf)

  business_interface "email"

  app_api = application_interface "app api"
  app = application_component "app"
  app_svc = application_service "app svc"
  app_func = application_function "app func"

  app_svc.serves(bf)
  app_api.serves(br)

  composition source: app, target: app_api
  assignment source: app_api, target: app_svc
  assignment source: app, target: app_func
  realization source: app_func, target: app_svc

  app_portal_interface = application_interface "portal interface"
  app.composes(app_portal_interface)

  view "Everything"
  view "Something", elements: [bs, bi, br, ba, bf]
  view "Application Behavior", viewpoint: application_behavior_viewpoint
  view "Business Process Cooperation", viewpoint: business_process_cooperation_viewpoint
end
```