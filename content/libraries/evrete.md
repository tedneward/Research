title=Evrete
tags=library, jvm, rules, RETE 
summary=A lightweight Java rule engine.
~~~~~~

[Website](https://www.evrete.org/) | [Source](https://github.com/evrete/evrete)

Uses several different approaches to code: Inline, Annotated, and Advanced. Example: "If X croaks and X eats flies - Then X is a frog. If X is a frog - Then X is green." (["Who is Fritz"](https://www.evrete.org/guides/run/who-is-fritz/))

Inline:
```java
package org.evrete.examples.run;

import org.evrete.KnowledgeService;
import org.evrete.api.Knowledge;

public class WhoIsFritzInline {
    public static void main(String[] args) {
        KnowledgeService service = new KnowledgeService();
        Knowledge knowledge = service
                .newKnowledge()
                .newRule()
                .forEach("$s", Subject.class)
                .where("$s.isFrog").where("!$s.green")
                .execute(ctx -> {
                    Subject $s = ctx.get("$s");
                    $s.green = true;
                    ctx.update($s);
                })
                .newRule()
                .forEach("$s", Subject.class)
                .where("$s.croaks").where("$s.eatsFlies").where("!$s.isFrog")
                .execute(ctx -> {
                    Subject $s = ctx.get("$s");
                    $s.isFrog = true;
                    ctx.update($s);
                });

        // Init subject and its known properties
        Subject fritz = new Subject();
        fritz.croaks = true;
        fritz.eatsFlies = true;

        // Insert Fritz and fire all rules
        knowledge.newStatelessSession().insertAndFire(fritz);

        // Fritz should have been identified as a green frog
        System.out.println("Is Fritz a frog?\t" + fritz.isFrog);
        System.out.println("Is Fritz green? \t" + fritz.green);

        service.shutdown();
    }

    public static class Subject {
        public boolean croaks;
        public boolean eatsFlies;
        public boolean isFrog;
        public boolean green;
    }
}
```

Annotated:
```java
package org.evrete.examples.run;

import org.evrete.KnowledgeService;
import org.evrete.api.Knowledge;
import org.evrete.api.RhsContext;
import org.evrete.dsl.annotation.Fact;
import org.evrete.dsl.annotation.Rule;
import org.evrete.dsl.annotation.Where;

public class WhoIsFritzAnnotated {
    public static void main(String[] args) throws Exception {
        KnowledgeService service = new KnowledgeService();
        Knowledge knowledge = service
                .newKnowledge(
                        "JAVA-CLASS",
                        WhoIsFritzAnnotated.RuleSet.class);

        // Init subject and its known properties
        Subject fritz = new Subject();
        fritz.croaks = true;
        fritz.eatsFlies = true;

        // Insert Fritz and fire all rules
        knowledge.newStatelessSession().insertAndFire(fritz);

        // Fritz should have been identified as a green frog
        System.out.println("Is Fritz a frog?\t" + fritz.isFrog);
        System.out.println("Is Fritz green? \t" + fritz.green);

        service.shutdown();
    }

    public static class Subject {
        public boolean croaks;
        public boolean eatsFlies;
        public boolean isFrog;
        public boolean green;
    }

    public static class RuleSet {
        @Rule
        @Where({"$s.isFrog", "!$s.green"})
        public void rule1(RhsContext ctx, @Fact("$s") Subject $s) {
            $s.green = true;
            ctx.update($s);
        }

        @Rule
        @Where({"$s.croaks", "$s.eatsFlies", "!$s.isFrog"})
        public void rule2(RhsContext ctx, @Fact("$s") Subject $s) {
            $s.isFrog = true;
            ctx.update($s);
        }
    }
}
```

Advanced:
```java
package org.evrete.examples.run;

import org.evrete.KnowledgeService;
import org.evrete.api.*;
import org.evrete.api.annotations.NonNull;

import java.util.HashMap;

public class WhoIsFritzAdvanced {
    public static void main(String[] args) {
        KnowledgeService service = new KnowledgeService();
        Knowledge knowledge = service.newKnowledge();
        TypeResolver typeResolver = knowledge.getTypeResolver();

        Type<Subject> subjectType = typeResolver.declare(Subject.class);
        typeResolver.wrapType(new SubjectType(subjectType));

        StatelessSession session = knowledge
                .newRule()
                .forEach("$s", Subject.class)
                .where("$s.croaks && $s.eatsFlies && !$s.isFrog")
                .execute(ctx -> {
                    Subject $s = ctx.get("$s");
                    $s.set("isFrog");
                    ctx.update($s);
                })
                .newRule()
                .forEach("$s", Subject.class)
                .where("$s.isFrog && !$s.green")
                .execute(ctx -> {
                    Subject $s = ctx.get("$s");
                    $s.set("green");
                    ctx.update($s);
                })
                .newStatelessSession();

        // Init subject and its known properties
        Subject fritz = new Subject();
        fritz.set("eatsFlies");
        fritz.set("croaks");

        // Insert Fritz and fire all rules
        session.insertAndFire(fritz);
        System.out.println(fritz);
        service.shutdown();
    }

    public static class Subject extends HashMap<String, Boolean> {
        void set(String prop) {
            super.put(prop, true);
        }
    }

    public static class SubjectType extends TypeWrapper<Subject> {
        SubjectType(Type<Subject> delegate) {
            super(delegate);
        }

        @NonNull
        @Override
        public TypeField getField(@NonNull String name) {
            // Declaring a new field on the fly
            return declareBooleanField(
                    name,
                    obj -> Boolean.TRUE.equals(obj.get(name))
            );
        }
    }
}
```

Some interesting samples, too.
