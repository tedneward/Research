title=DropboxMQ
tags=distribution, messaging, jvm
summary=Filesystem-based JMS implementation.
~~~~~~

[Website](http://dropboxmq.sourceforge.net/) | [Last release (2014)](./dropboxmq_1.2.zip)

# Quick Start Guide
## Producing or Consuming Messages (Common Tasks)
Whether producing or consuming messages, DropboxMQ applications need to do some common tasks before getting to the nuts and bolts of producing or consuming.

1. Creating a Dropbox
Creating a dropbox is as easy as creating a handful of directories in a shared directory known as the root directory. Still the preferred method for creating both queue and topic dropboxes is to use the create-dropbox script as described in the Administrative Guide.

2. Gathering the Jars
DropboxMQ only requires three jars. dropboxmq-0.5.jar, connector-api-1.5.jar and commons-logging-1.1.jar are all included in the DropboxMQ download.

3. JNDI Lookups
A JNDI lookup is the preferred method for retrieving ConnectionFactory and Destination objects. The first step of a JNDI lookup is creating a InitialContext and the environment properties provided to the InitialContext constructor are the primary mechanism for configuring DropboxMQ. See the complete list of JNDI properties on the Configuration Guide.

```
Properties properties = new Properties();
// properties.load() would probably be more suitable
properties.setProperty( Context.INITIAL_CONTEXT_FACTORY,
        "net.sf.dropboxmq.jndi.InitialContextFactoryImpl" );
properties.setProperty( "net.sf.dropboxmq.root", "/dropboxmq" );
InitialContext initialContext = new InitialContext( properties );

ConnectionFactory connectionFactory
        = (ConnectionFactory)initialContext.lookup( "ConnectionFactory" );
Destination destination
        = (Destination)initialContext.lookup( "TestQueue1" );
```

4. Creating a Connection and a Session
```
Connection connection = connectionFactory.createConnection();
Session session = connection.createSession(
        false, Session.AUTO_ACKNOWLEDGE );
```
## Producing a Message

```
MessageProducer producer = session.createProducer( destination );
TextMessage message = session.createTextMessage( "Hello World!" );

producer.send( message );
```

After executing the above code, you will notice a new file in /dropboxmq/TestQueue1/incoming/target. The name of file will be something similar to 4.1140911283485000-1299715532.T. For an explaination of each of the fields contained in the filename look here. Also note that the contents of the file are exactly the text of the TextMessage ("Hello World!").

## Consuming a Message
```
connection.start();

MessageConsumer consumer = session.createConsumer( destination );
TextMessage message = (TextMessage)consumer.receiveNoWait();

System.out.println(
        message == null ? "No message found" : message.getText() );
```

That's it! You will notice that after executing this code the message file that was in the target directory is now in the processed directory. For a complete and compile-able listing of the code above look here.

---

# Administrative Guide

## Environment Variables
Most administrative tasks described here use two environment variables: DROPBOXMQ_HOME and DROPBOX_ROOT.  DROPBOXMQ_HOME is used to locate the DropboxMQ distribution directory and defaults to the parent directory of the directory containing the DropboxMQ tool in use. DROPBOX_ROOT specifies the parent directory containing the dropboxes to be administered. DROPBOX_ROOT defaults to the current working directory but should be set explicitly to assure administrative tasks are performed in the proper location.

UNIX:	 	
```
$ export DROPBOXMQ_HOME=/opt/dropboxmq
$ export DROPBOX_ROOT=/dropbox
$ export PATH=$DROPBOXMQ_HOME/bin:$PATH
```
Windows:
```
C:\> set DROPBOXMQ_HOME=C:\dropboxmq
C:\> set DROPBOX_ROOT=C:\dropbox
C:\> set PATH=%DROPBOXMQ_HOME%\bin;%PATH%
```
NOTE: UNIX commands in this guide were written for the /bin/sh shell and its derivatives.

## Creating Queues and Topics
Creating a dropbox for a queue or topic is as easy as creating a handful of directories in the shared DROPBOX_ROOT directory. Still the preferred mechanism for creating queues and topics is by calling create-dropbox.

```
create-dropbox -? | -h | --help | /? | /h | /help
    Display this help text.
create-dropbox { -q | --queue | /q | /queue } queue-name1
               { -q | --queue | /q | /queue } queue-name2
               { -t | --topic | /t | /topic } topic-name1
               { -t | --topic | /t | /topic } topic-name2
    Create the one or more queues and/or topics listed.
```

Here is how to create a queue called TestQueue1:

UNIX: `$ create-dropbox --queue TestQueue1`
Windows: `C:\> create-dropbox /queue TestQueue1`

Or a queue called ThisQueue and a topic called ThatTopic at the same time:

UNIX: `$ create-dropbox -q ThisQueue -t ThatTopic`
Windows: `C:\> create-dropbox /q ThisQueue /t ThatTopic`

## Message Routing
DropboxMQ messages can be routed from one destination to another or simply routed to a holding location and consumed later. Routes are listed in a routing.properties file located in the incoming directory. Each route is defined by a name and a JMS message selector in the format of {route-name}.selector={selector}. An active consumer must attempt to consume messages for any routes to be used. When multiple routes are defined and active, selectors are applied in the alphabetical order of the names. If no selectors match a message, it is delivered to the consumer as normal.

### Example routing.properties
The following property file defines two routes. The first route is named route1 and will route messages with a priority less than 200 and a reply-to of ReplyQueue1. The second route is named route2 and will route messages with a JMSType of WorkOrder, Manifestdoc or CatalogQuery. If both routes are active and a message arrives with priority of 250, reply-to of ReplyQueue1 and a type of ManifestDoc, the message will be routed to route1 (route1 comes before route2 alphabetically).

```
route1.selector=JMSPriority < 200 and JMSReplyTo \= 'ReplyQueue1'
route2.selector=JMSType in ('WorkOrder', 'ManifestDoc', \
        'CatalogQuery')
```

### Directing Routes
When an active route has been selected, messages are moved to that route's directory. This directory is located in the routing directory of the dropbox and has the same name as the route defined in the routing.properties file. On UNIX file systems, this directory can actually be a symbolic link to another dropbox's target directory thereby causing messages to be routed from one dropbox to another.

### Activating and Deactivating Routes
Once the route's selector is defined and the route's directory is in place, the route is ready to be activated. To activate a route, simply create an in-use file in the routing directory with a filename of the form {route-name}.in-use. The following example shows how to activate route1 for TestQueue1:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming/routing
$ touch route1.in-use
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming\routing
C:\...\routing> echo route > route1.in-use
```
To deactivating a route, remove the in-use file:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming/routing
$ rm route1.in-use
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming\routing
C:\...\routing> del route1.in-use
```

## Flow Control
DropboxMQ has several mechanisms for controlling if and how quickly messages are produced and consumed. It is important to note that these mechanisms are only implemented by DropboxMQ clients. Shell scripts or other non-JMS clients sending and receiving messages will not be affected by these locks and controls.

Note: If any flow mechanisms are active, any affected DropboxMQ client will log a warning message once every five minutes per affected producer/consumer.

### The Global Read Lock
The Global Read Lock, when in place, prevents all consumers from consuming messages. All DropboxMQ consumers that attempt to consume messages when the lock is place will behave exactly as though no messages exist.

To create the Global Read Lock:

UNIX:
```
$ cd $DROPBOX_ROOT
$ touch global-read-lock
```
Windows:
```
C:\> cd %DROPBOX_ROOT%
C:\dropbox> echo lock > global-read-lock
```

To remove the Global Read Lock:

UNIX:
```
$ cd $DROPBOX_ROOT
$ rm global-read-lock
```
Windows:
```
C:\> cd %DROPBOX_ROOT%
C:\dropbox> del global-read-lock
```

### Local Read Locks
Local Read Locks also prevent consumers from consuming messages, but these locks only affect consumers for a single destination.

To create a Local Read Lock on the TestQueue1 queue:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming
$ touch read-lock
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming
C:\...\incoming> echo lock > read-lock
```
To remove a Local Read Lock on the TestQueue1 queue:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming
$ rm read-lock
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming
C:\...\incoming> del read-lock
```

### Write Lock Properties
Write Lock Properties control if a producer attempting to send a message to a particular destination will be permitted to do so and if there will be any delay in doing so. Write locks can be dangerous because they can cause a DropboxMQ client to hang for an indeterminate amount of time. There are two values that can be specified in the Write Lock Properties:

Name:	`delay-milliseconds`
Type:	long
Default:	-1 (indefinitely)
Example:	8000 (8 seconds)

Specifies how long a producer will wait before being permitted to send a message. If -1 is specified, the producer will wait indefinitely or until the target-limit requirement is met.

Name:	`target-limit`
Type:	int
Default:	0
Example:	1000

Specifies the maximum number of messages that can be waiting on a destination. If fewer than this number of messages are waiting in the target directory, any message will be sent without delay (regardless of the delay-milliseconds value). If 0 is specified, each message will be delayed by the time specified in delay-milliseconds (or indefinitely if delay-milliseconds is -1).

If the property file doesn't exist, messages are not delayed at all. If the property file exists, but no properties are defined, messages will be delayed indefinitely (values default to delay-milliseconds of -1 and target-limit of 0). This means that all messages producers of a particular destination can be quickly locked out by simply touching a write-lock.properties file similarly to how read-locks are created.

To create a Write Lock Properties file on the TestQueue1 queue specifying an 8 second delay when more than 1000 messages exist:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming
$ echo "delay-milliseconds=8000" > write-lock.properties
$ echo "target-limit=1000" >> write-lock.properties
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming
C:\...\incoming> echo delay-milliseconds=8000 > write-lock.properties
C:\...\incoming> echo target-limit=1000 >> write-lock.properties
```
To remove a Write Lock Properties file on the TestQueue1 queue:

UNIX:
```
$ cd $DROPBOX_ROOT/TestQueue1/incoming
$ rm write-lock.properties
```
Windows:
```
C:\> cd %DROPBOX_ROOT%\TestQueue1\incoming
C:\...\incoming> del write-lock.properties
```
NOTE: UNIX commands in this guide were written for the /bin/sh shell and its derivatives.

---

# Configuration Guide

DropboxMQ can run in many different environments. This guide lists all public configuration settings.

## Standalone or JNDI Configuration
Whether running in a standalone application or as part of an application server, the simplest way to interact with DropboxMQ is through JNDI lookups to JMS administered objects. The following properties can be passed to the InitialConext to configure DropboxMQ:

Name:	java.naming.factory.initial
Type:	java.lang.String
Default:	No default, required
Example:	net.sf.dropboxmq.jndi.InitialContextFactoryImpl

Specifies the JNDI factory to use. This property must be set to net.sf.dropboxmq.jndi.InitialContextFactoryImpl to lookup DropboxMQ objects.

Name:	net.sf.dropboxmq.root
Type:	java.lang.String
Default:	No default, required
Example (UNIX):	/var/dropboxmq/root
Example (Windows):	C:\\DropboxMQ\\root

Specifies the file path to the root directory that contains dropboxes. More information about the dropbox root can be found here.

Name:	net.sf.dropboxmq.clientId
Type:	java.lang.String
Default:	No default
Example:	MyJMSApp

Specifies the JMS client id of any connections. Client ids must be unique for all clients connected at a given time. If no client id is specified, a unique id is generated for each connection.

Name:	net.sf.dropboxmq.redeliveryAttempts
Type:	java.lang.Integer
Default:	0

Limits the number of times a message will be moved back to the target directory as the result of the message being recovered. If a message is being recovered and the number of redelivery attempts has been exceeded, the message will be moved to the error directory. Otherwise recovering a message causes it to be moved back to the target directory. Message recovery typically happens as the result of an application error while consuming a message. A message that has been moved to the error directory can always be manually moved to the target directory to attempt additional redeliveries.

Name:	net.sf.dropboxmq.deleteProcessedMessages
Type:	java.lang.Boolean
Default:	false

If true, successfully consumed messages, successfully committed transactions and successfully rolled-back transactions will be deleted. The default behaviour is to move successfully consumed messages to the processed directory, successfully committed transactions to the committed directory and successfully rolled-back transactions to the rolled-back directory.

Name:	net.sf.dropboxmq.deleteExpiredMessages
Type:	java.lang.Boolean
Default:	false

If true, expired messages will be deleted. The default behaviour is to move expired messages to the expired directory.

Name:	net.sf.dropboxmq.deleteCompleteTransactions
Type:	java.lang.Boolean
Default:	true

If true, committed and rolled-back transactions will be deleted. The default behaviour is to move committed transactions to the committed directory and rolled-back transactions to the rolled-back directory.

Name:	net.sf.dropboxmq.preserveDeletedDropboxes
Type:	java.lang.Boolean
Default:	true

If true, dropboxes being deleted by a call to TemporaryQueue.delete(), TemporaryTopic.delete() or DirectoryStructure.deleteDropbox() will not actually delete the dropbox but instead rename it to {name}.deleted-{timestamp}. If false, the dropbox and any messages contained within it will be deleted.

Name:	net.sf.dropboxmq.connectionFactories
Type:	java.lang.String
Default:	ConnectionFactory
Example (UNIX):	cf:cf2
Example (Windows):	cf;cf2

A path separator (':' on UNIX, ';' on Windows) separated list of ConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.consumeExpiredMessages
Type:	java.lang.Boolean
Default:	false

If true, expiration checks not performed and messages are consumed regardless of whether they are expired or not.

Name:	net.sf.dropboxmq.queueConnectionFactories
Type:	java.lang.String
Default:	QueueConnectionFactory
Example (UNIX):	qcf:qcf2
Example (Windows):	qcf;qcf2

A path separator (':' on UNIX, ';' on Windows) separated list of QueueConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.topicConnectionFactories
Type:	java.lang.String
Default:	TopicConnectionFactory
Example (UNIX):	tcf:tcf2
Example (Windows):	tcf;tcf2

A path separator (':' on UNIX, ';' on Windows) separated list of TopicConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.xaConnectionFactories
Type:	java.lang.String
Default:	XAConnectionFactory
Example (UNIX):	xacf:xacf2
Example (Windows):	xacf;xacf2

A path separator (':' on UNIX, ';' on Windows) separated list of XAConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.xaQueueConnectionFactories
Type:	java.lang.String
Default:	XAQueueConnectionFactory
Example (UNIX):	xaqcf:xaqcf2
Example (Windows):	xaqcf;xaqcf2

A path separator (':' on UNIX, ';' on Windows) separated list of XAQueueConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.xaTopicConnectionFactories
Type:	java.lang.String
Default:	XATopicConnectionFactory
Example (UNIX):	xatcf:xatcf2
Example (Windows):	xatcf;xatcf2

A path separator (':' on UNIX, ';' on Windows) separated list of XATopicConnectionFactorys that will be created and accessible from JNDI.

Name:	net.sf.dropboxmq.pollingInterval
Type:	java.lang.Long
Default:	300 (milliseconds)

Specifies in milliseconds the amount of time a message consumer will wait between scans of the target directory when waiting for an extended amount of time for a message. Note that if this property is too small, DropboxMQ will spend a noticeable amount of CPU even when idle. If this property is too large, there may be some delay before messages are consumed.

Name:	net.sf.dropboxmq.targetScanTimeout
Type:	java.lang.Long
Default:	30000 (30 seconds)

Specifies in milliseconds the amount of time DropboxMQ will use a directory listing of the target directory before the listing is considered stale, causing DropboxMQ to rescan the directory. Note that if this property is too small and a dropbox has a large backlog (hundreds of messages), DropboxMQ will spend much time sorting incoming messages. If this property is too large, low priority messages may be consumed before late arriving high priority messages.

Name:	net.sf.dropboxmq.messageTranscoderFactory
Type:	java.lang.String
Default:	net.sf.dropboxmq.messagetranscoders.DefaultMessageTranscoderFactory
Example:	com.example.MyMessageTranscoderFactory

Specifies the implementation of net.sf.dropboxmq.messagetranscoders.MessageTranscoderFactory that will be used. This factory will be used to create message comparators and transcoders. The comparators are used for sorting messages. The transcoders implement net.sf.dropboxmq.messagetranscoders.MessageTranscoder and are used for encoding and decoding message metadata (priority, message id, properties, etc.). Custom factories can be used to read and write metadata for messages that were produced by or will be consumed by clients that do not use DropboxMQ.

## JCA Configuration
When running in a Java Connector Architecture (JCA) compliant application server, applications can opt to use DropboxMQ through its resource adapter.

### Resource Adapter Configuration Properties

Name:	root

See above.

Name:	redeliveryAttempts

See above.

Name:	deleteProcessedMessages

See above.

Name:	deleteExpirededMessages

See above.

Name:	deleteCompleteTransactions

See above.

Name:	preserveDeletedDropboxes

See above.

Name:	consumeExpiredMessages

See above.

Name:	pollingInterval

See above.

Name:	targetScanTimeout

See above.

Name:	messageTranscoderFactory

See above.

Name:	classLoadedProperties
Type:	java.lang.String
Default:	No name defined, class loaded properties will not be used.
Example:	resources/dropboxmq.properties

Specifies the name of a property file that is accessible to the class loader. The DropboxMQ resource adapter will load this file and use the values it contains to configure DropboxMQ. See below.

### Endpoint Configuration Properties
For each endpoint consumer (i.e.: Message Driven Bean), the application container will prepare and configure the consumer with the properties defined in the activation-config element of the deployment descriptor. Resource adapter properties may also be defined for a endpoint consumer, but if undefined, values are inherited from th resource adapter. See above for the complete list of resource adapter properties.

Name:	destination
Type:	java.lang.String
Default:	No default, required though may be specified through a class-loaded property.
Example:	jms/MyQueue

The destination from which messages will be consumed.

Name:	destinationType
Type:	java.lang.String
Default:	No default, destination type not specified.
Example:	javax.jms.Queue

Not actually used. Provided only for compatibility with xdoclet. Must be not specified, javax.jms.Queue or javax.jms.Topic.

Name:	acknowledgeMode
Type:	java.lang.String
Default:	Auto-acknowledge

The acknowledge mode (see Session.getAcknowledgeMode()) in which messages will be consumed. Valid values are Auto-acknowledge, Dups-ok-acknowledge, Client-acknowledge, and Session-transacted (only value per endpoint).

In Auto-acknowledge mode, messages are acknowledged (fully consumed) immediately as the endpoint begins processing. Dups-ok-acknowledge is not implemented and therefore behaves exactly as Auto-acknowledge mode does.

Client-acknowledge mode causes the DropboxMQ resource adapter to acknowledge messages immediately after the message has been successfully processed ( MessageListener.onMessage() returns without throwing an exception).

If Session-transacted mode is used, a transaction is opened before the message is sent and closed after the message is consumed. If MessageListener.onMessage() completes without exception, the transaction is committed. Otherwise, the transaction is rolled back.

Name:	clientId
Type:	java.lang.String
Default:	No default, no client id defined.
Example:	MyApp

The client id (see Connection.setClientID()) of the consumer.

Name:	maxPoolSize
Type:	java.lang.Integer
Default:	1

The maximum number of endpoint consumers that will be processing messages at any given time.

Name:	subscriptionDurability
Type:	java.lang.String
Default:	Not-durable

If set to exactly Durable, subscriptionName is set to a valid subscription name and destination references a topic destination, a durable subscription will be established if one does not already exist and the endpoint consumer will consume messages from this subscription. See Session.createDurableSubscriber() .

Name:	subscriptionName
Type:	java.lang.String
Default:	No default, subscription name not specified.
Example:	MySubscription

The durable subscription name that will be established when consuming from topics. See Session.createDurableSubscriber() .

Name:	messageSelector
Type:	java.lang.String
Default:	No default, no message selector specified, all messages selected.
Example:	JMSPriority > 4000

A message selector expression that will be used to selectively process messages. Only messages where the expression evaluates to true will be processed.

Name:	maxMessages
Type:	java.lang.Integer
Default:	1

The number of messages that will be allocated per endpoint before the endpoint starts processing messages. This value may be set to a number larger than one to reduce context switching in situations where the time to process each message is very short (less than one second). When volume is low, an endpoint may start processing with fewer than maxMessages but there will be a small delay.

Name:	classLoadedPropertiesName
Type:	java.lang.String
Default:	No default, no name specified and classLoadedProperties will not be used for this endpoint.
Example:	MyMDB

The name of the endpoint in the class-loaded properties file. All property values (except for classLoadedPropertiesName) can be specfied in the class-loaded property file in the format <classLoadedPropertiesName>.<property name>. See below.

## Class-Loaded Properties
Class-loaded properties allow DropboxMQ to be configured by a property file loaded by the ClassLoader and thereby, in most cases, loaded from a file not in a binary archive (.ear, .jar, etc.). This allows such binary archives to have static content while the configuration properties are dynamic for the given runtime environment. Values specified in the class-loaded properties file take precedence over values specified through JCA.

To use class-loaded properties, first configure the classpath of the Java container to reference a directory that will contain the property file. See your container's documentation to learn how to modify the classpath. Next, specify the file name of the class-loaded property file in the JCA configuration with the classLoadedProperties property. Finally, create the property file. It can contain top level properties such as root or endpoint specific properties such as MyMDB.maxPoolSize.

```
root=/var/dropboxmq/root
MyMDB.maxPoolSize=5
```
