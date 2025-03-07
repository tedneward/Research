title=Notifications
tags=distribution, concept, notifications
summary=Notes and reading on the subject.
~~~~~~

In order to achieve synchronization decoupling, a synchronous remote invocation is sometimes split into two asynchronous invocations: the first one sent by the client to the server—accompanied by the invocation arguments and a callback reference to the client—and the second one sent by the server to the client to return the reply. This scheme can be easily extended to return several replies by having the server make several callbacks to the client. Such notification-based interaction is widely used to ensure consistency of Web caches [Wessels 1995]: upon download of Web contents, Web proxies receive a promise to be notified if any change occurs at the Web server. This implements a limited form of publish/subscribe interaction in which Web proxies act as subscribers and the Web server as the publisher.

This type of interaction—where subscribers register their interest directly with publishers, which manage subscriptions and send events—corresponds to the so-called observer design pattern [Gamma et al. 1995]. It is generally implemented using asynchronous invocations in order to enforce synchronization decoupling. Although publishers notify subscribers asynchronously, they both remain coupled in time and in space. Furthermore the communication management is left to the publisher and can become burdensome as the system grows in size.

( Notifications: producers and consumers communicate using asynchronous invocations flowing in both directions.)

### Push notification providers

- **[Batch](https://batch.com)**: Batch is a push notification platform built around predictive analytics and smart segmentation algorithms. With Batch, you can efficiently send transactional (one to one) and marketing notifications (one to many) while leveraging our other modules to run a successful retention strategy.

- **[Boxcar](https://boxcar.io/developer)**: Boxcar is reliable and inexpensive push notification platform support iOS and Android. It offers realtime analytics of user behaviour, open source SDK and high availability. It is build on a very flexible business pricing model that is based on speed of delivery, not on the number of devices or push delivered. It means you can use it no matter what is your budget but selecting the speed that match the criticity of your application.

- **[Carnival](http://www.carnival.io)**: Carnival mobile marketing automation drives app engagement and customer conversions. Carnival gives you three channels to engage your users with rich messaging: push notifications to drive app opens; in-app notifications to increase conversions; and a customizable Message Stream to deliver rich, full-screen content. Carnival also offers rich audience segmentation and message automation.

- **[Catapush](https://www.catapush.com)**: Catapush is a simple, reliable and scalable delivery API for transactional push notifications for applications. Ideal for sending data-driven transactional notifications including targeted e-commerce and personalized one-to-one messages.
Get delivery confirmation with real time status for each message sent and build intelligent messaging logic in your real time applications.

- **[Growth Push](http://en.growthpush.com)**: Growth Push is one of the biggest push notification platform in Japan. Growth Push provides Push Notification's analyses and delivery services for Applications developers. It not only optimizes the effectiveness of Push Notifications.

- **[Kahuna](https://www.kahuna.com)**: Kahuna is a smart, multi-channel communication automation platform. Built originally for push, Kahuna also supports email, in-app, and social media communication channels. Kahuna focuses on tracking user actions and delivering across multiple channels, as well as providing intelligent services to suggest the best times and places to deliver messages.

- **[Leanplum](https://www.leanplum.com)**: Leanplum offers a complete Mobile Marketing Automation platform that contains personalized messaging, in-app UI optimization, A/B testing, and analytics. This diverse toolkit enables apps to manage every touch point of the customer journey, from onboarding through conversions. In short, the platform is the end-to-end key to brand survival.

- **[Netmera](http://www.netmera.com)**: Netmera is a Mobile Application Engagement Platform. We offer a series of development tools and app communication features to help your mobile business ignite and soar. Our platform will increase your mobile engagement with SMART campaigns and EASY data analysis features.

- **[OneSignal](https://www.onesignal.com)**: OneSignal is a completely free push notification delivery service. We fund our product development through products offered to enterprise clients. We provide a suite of APIs and tools for mobile developers to send, schedule, localize, and A/B test their notification campaigns. Our highly reliable service has all the features of Parse and developers can use our Parse data importer to ease their switch.

- **[PushBots](https://pushbots.com)**: PushBots is a scalable push notification system for mobile applications that helps save time and effort to effectively communicate with your users. We provide native SDKs (Android, iOS, and Phonegap), REST API, API clients(PHP, Python, NodeJS and dotNET) and an online dashboard to manage and send your push notifications. We also provide analytics, push scheduling and Twitter integration.

- **[PushChamp](https://www.pushchamp.com)**: PushChamp is a cross-platform communication solution, which powers developers and marketeers to engage with their users and track the message deliverability real-time. Currently supported platforms are mobile push notification (Android, iOS, Windows), browser push notification (Chrome, Firefox, Safari), Email and SMS. Some of our features are SMS fallback(in case of push fails), real-time analytics, user profiling and reusable templates.

- **[Pushwoosh](https://www.pushwoosh.com)**: Pushwoosh is a multi-platform push notifications service, which enables developers, marketing reps and product owners to keep in touch with their app users, drive engagement, promote products, push up sales, and track the progress of the campaign with notifications.

- **[Pushy](https://www.pushy.me)**: Pushy is an Android push notifications service up to 2x times faster than the competition. It uses dedicated socket connection to ensure push notification delivery in critical situations. Devices maintain a background connection to Pushy using the MQTT protocol, an extremely light-weight pub/sub protocol that consumes very little network bandwidth and battery. Pushy is perfect for real-time applications. Reliable, scalable, blazing-fast, and budget-friendly.

- **[RadiumOne](https://radiumone.com/connect)**: Connect is a free push notification and in-app analytics tool from RadiumOne. It provides a full suite of analytics tools and is ideal for targeting Push Notifications based on in-app user behavior, as well as coordinating Push with advertising through the integrated RadiumOne Data Management Platform (DMP) and programatic media-buying tools. Messages can be targetted to users based on tagging, segmentation and geolocation.

- **[Urban Airship](https://www.urbanairship.com)**: Urban Airship helps leading brands engage their mobile users and build high-value relationships from the moment customers download an app. Thousands of companies and some of the most demanding brands in retail, media & entertainment, sports and travel & hospitality, trust Urban Airship to deliver the mobile moments that matter to their customers and to their business.

- **[Tapjoy](http://www.tapjoy.com)** : Tapjoy, the mobile app industry’s first personalized monetization platform, utilizes their holistic LTV infrastructure to enable app developers to deliver personalized, contextually relevant engagement and monetization campaigns. This technology offers user-level-segmentation which allows you to send targeted Push Notifications to re-engage your users and alert them of updates in your game or currency sales. Not only that, it allows you to take targeting to the next level by using Predictive Analytics. Choose to utilize unique products that increase conversions from Push Notifications by linking a push notifications to an opportunity to monetize with our Push to Earn product. Most importantly, push is FREE when you monetize with Tapjoy.

- **[TUNE In-App Marketing](https://www.tune.com/in-app-marketing)**: With In-App Marketing, the TUNE Marketing Console (TMC) now gives you ownership of the entire mobile marketing funnel, from first touch to ongoing retention, in one integrated platform. By optimizing user experience and delivering relevant content to the right people at the right time, In-App Marketing drives higher engagement and maximizes each user’s value.

- **[WonderPush](https://www.wonderpush.com)**: WonderPush is a free push notification platform without obligation or credit card, that provides open source SDKs for Android, iOS and JavaScript for easy integration into mobile applications and web sites. Its powerful REST API helps to programmatically deliver 100.000's push notification in a second. Marketers can automate sendings and do behavioral segmentation using the straightforward dashboard.

- **[Xtremepush](https://xtremepush.com)**: XtremePush is a leading mobile analytics, engagement and proximity marketing platform. The platform provides deep analytics and messaging functionality allowing brands to analyse and intelligently engage with their app users using Push notifications and In App Messaging. We also provide Geo Fencing and iBeacon technology enabling location based engagement with app users all through one easy to use platform.
