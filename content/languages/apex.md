title=Apex
tags=language, platform, salesforce, object-oriented
summary=A strongly typed, object-oriented programming language that allows developers to execute flow and transaction control statements on Salesforce servers in conjunction with calls to the API. Using syntax that looks like Java and acts like database stored procedures, Apex enables developers to add business logic to most system events, including button clicks, related record updates, and Visualforce pages. Apex code can be initiated by Web service requests and from triggers on objects.
~~~~~~

[Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dev_guide.htm) | [Reference](https://resources.docs.salesforce.com/232/latest/en-us/sfdc/pdf/salesforce_apex_reference_guide.pdf)

As a language, Apex is:

* Integrated
    Apex provides built-in support for common Lightning Platform idioms, including:
    * Data manipulation language (DML) calls, such as INSERT, UPDATE, and DELETE, that include built-in DmlException handling
    * Inline Salesforce Object Query Language (SOQL) and Salesforce Object Search Language (SOSL) queries that return lists of sObject records
    * Looping that allows for bulk processing of multiple records at a time
    * Locking syntax that prevents record update conflicts
    * Custom public API calls that can be built from stored Apex methods
    * Warnings and errors issued when a user tries to edit or delete a custom object or field that is referenced by Apex
* Easy to use
    Apex is based on familiar Java idioms, such as variable and expression syntax, block and conditional statement syntax, loop syntax, object and array notation. Where Apex introduces new elements, it uses syntax and semantics that are easy to understand and encourage efficient use of the Lightning Platform. Therefore, Apex produces code that is both succinct and easy to write.
* Data focused
    Apex is designed to thread together multiple query and DML statements into a single unit of work on the Salesforce server. Developers use database stored procedures to thread together multiple transaction statements on a database server in a similar way. Like other database stored procedures, Apex does not attempt to provide general support for rendering elements in the user interface.
* Rigorous
    Apex is a strongly typed language that uses direct references to schema objects such as object and field names. It fails quickly at compile time if any references are invalid. It stores all custom field, object, and class dependencies in metadata to ensure that they are not deleted while required by active Apex code.
* Hosted
    Apex is interpreted, executed, and controlled entirely by the Lightning Platform.
* Multitenant aware
    Like the rest of the Lightning Platform, Apex runs in a multitenant environment. So, the Apex runtime engine is designed to guard closely against runaway code, preventing it from monopolizing shared resources. Any code that violates limits fails with easy-to-understand error messages.
* Easy to test
    Apex provides built-in support for unit test creation and execution. It includes test results that indicate how much code is covered, and which parts of your code could be more efficient. Salesforce ensures that all custom Apex code works as expected by executing all unit tests prior to any platform upgrades.
* Versioned
    You can save your Apex code against different versions of the API. This enables you to maintain behavior.

Apex is tailored for data access and data manipulation on the platform, and it enables you to add custom business logic to system events. While it provides many benefits for automating business processes on the platform, it is not a general purpose programming language.

Apex cannot be used to:

* Render elements in the user interface other than error messages
* Change standard functionality—Apex can only prevent the functionality from happening, or add additional functionality
* Create temporary files
* Spawn threads

After reviewing the basics, you are ready to write your first Apex program—a very simple class, trigger, and unit test.

*Case-insensitive. Fundamentally based on Java, but I don't think it runs in a JVM; the docs imply it's interpreted. There also appear to be a number of limits to Apex-hosted code (like ceilings on the number of database queries that can be executed). Fascinating in that it appears to really combine an OO language with a server-side stored-proc language like T/SQL or PL/SQL.*

*Tutorial talks about how to create a custom object (drive the GUI to **Create|Custom Object** and give it a name and fields), then a class that will be the target of a trigger invocation (class looks pretty much just like Java, or more accurately SQL/J), and then the trigger looks like this:*

```
trigger HelloWorldTrigger on Book__c (before insert) {
 
   Book__c[] books = Trigger.new;
 
   MyHelloWorld.applyDiscount(books);
}
```

*Reference guide lists a number of namespaces that provide functionality that aren't core to the language; looks like Apex is a one-stop shopping experience, with no concept of "libraries" per se.*

