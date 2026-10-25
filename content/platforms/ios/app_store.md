title=Apple/iOS App Store
tags=platform, ios, appstore
summary=Notes and reminders about Apple AppStore (iOS) submissions.
~~~~~~

[App Store Connect](https://appstoreconnect.apple.com/apps) (auth required)

## Resources

* https://medium.com/@itsuki.enjoy/apple-detail-guide-to-publish-an-app-using-app-store-connect-9b35bb144885 (10 Mar 2024)

## Prerequisites
The things to have in hand before filling out the new entry

* Package name/Bundle Identifier
* App icon
* Screenshots

## Creating a new App in the store
*(as of 6 Oct 2026)*

### Create the app entry

1. "+" button next to "Apps" header in "Apps" page. "New App" from dropdown.
2. The New App dialog has all the usual fields:
    - "Platforms", "Primary Language" self-explanatory
    - "Name" has to be unique across the entire AppStore, it seems!
    - "Bundle ID" (typically the reverse-DNS-named bundle for the app) is a dropdown that apparently gets populated from XCode running on the local machine. For Flutter apps, do a `flutter build ios` ahead of time to get XCode to build a release version and therefore populate that dropdown.
    - "SKU" is entirely org-relative; Apple apparently does nothing with this. (It's found on the App Information submenu once the app is registered in Connect.) Help "?" says it's not visible to users. you cannot change the SKU of an app in App Store Connect once it has been created. https://developer.apple.com/help/app-store-connect/reference/app-information/app-information/

        - Permanent value: According to Apple Developer Documentation, the SKU is an internal, unique ID used by Apple to track sales, and it becomes completely immutable (unchangeable) the moment the app record is created. 
        - No reuse: Once a specific SKU string has been used for an application, it cannot be reused for a different application, even if the original app is deleted.

    - "User Access" is relative to the people that are a part of the development org (that is, you!), not users of the app.
