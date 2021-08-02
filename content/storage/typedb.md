title=TypeDB
tags=storage
summary=A database with a rich and logical type system. TypeDB empowers you to solve complex problems, using TypeQL as its query language.
~~~~~~

[Website](https://vaticle.com/) | [Source](https://github.com/vaticle/typedb)

[TypeQL Source](https://github.com/vaticle/typeql)

Example schema for a social network graph:
```
define

title sub attribute, value string;

event-date sub attribute, abstract, value datetime;
approved-date sub event-date;

## an abstract relation, only to be subtyped by other relations
request sub relation,
  abstract,
  owns approved-date,
  relates subject,
  relates requester,
  relates respondent;

friendship sub relation,
    relates friend,
    plays friend-request:friendship,
    plays friendship-list:listed;

## an example of subtyping in TypeDB
friend-request sub request,
    relates friendship as subject,
    relates friend-requester as requester,
    relates friend-respondent as respondent;

friendship-list sub relation,
    owns title,
    relates owner,
    relates listed;

person sub entity,
    plays friendship:friend,
    plays friend-request:friend-requester,
    plays friend-request:friend-respondent,
    plays friendship-list:owner;
```

Java client:
```
package com.vaticle.doc.examples;

import com.vaticle.typedb.client.TypeDB;
import com.vaticle.typedb.client.api.connection.TypeDBClient;
import com.vaticle.typedb.client.api.connection.TypeDBOptions;
import com.vaticle.typedb.client.api.connection.TypeDBSession;
import com.vaticle.typedb.client.api.connection.TypeDBTransaction;

import static com.vaticle.typeql.lang.TypeQL.*;

import com.vaticle.typeql.lang.query.*;
import com.vaticle.typedb.client.api.answer.ConceptMap;

import java.util.stream.Stream;

import java.util.List;

public class SocialNetworkQuickstartQuery {
    public static void main(String[] args) {
        TypeDBClient client = TypeDB.coreClient("localhost:1729");
        try (TypeDBSession session = client.session("social_network", TypeDBSession.Type.DATA)) {
            
            TypeDBOptions options = TypeDBOptions.core().infer(true); // enable reasoning
            try (TypeDBTransaction transaction = session.transaction(TypeDBTransaction.Type.WRITE, options)) {
                
                TypeQLMatch query = match(
                        var().rel("employer", var("org")).rel("employee", var("per")).isa("employment"),
                        var("per").has("full-name", var("per-fn")),
                        var("org").has("name", var("org-n"))
                );

                Stream<ConceptMap> answers = transaction.query().match(query);

                answers.forEach(answer -> {
                    System.out.println(answer.get("per-fn").asAttribute().getValue());
                    System.out.println(answer.get("org-n").asAttribute().getValue());
                    System.out.println(" - - - - - - - - ");
                });
            }
        }
    }
}
```


