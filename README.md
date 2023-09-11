# Sunflower FlutterBaseProject

### How to change Package name of project

#### Flutter
First of all in open `pubspec.yaml` file and update top most value of name to our project name. We can also update project description if we want to. 
```yaml
name: baseproject
description: A new Flutter application.
```

##### Android
Change the package name in your **```AndroidManifest.xml```** file:
( **Note** : If you're doing this changes than you've to chage package name of all three ```AndroidManifest.xml``` files resides in ```debug``` , ```main``` and ```profile``` folder at location ```android/app/src```)
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="your.package.name">
```

Also in your **build.gradle** file inside app folder
```gradle
defaultConfig {
    applicationId "your.package.name"
    minSdkVersion 16
    targetSdkVersion 27
    versionCode 1
    versionName "1.0"
    testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
}
```

##### Additional Step if you have changed application package name
For the location ```android/app/src/main/kotlin``` change the folder name structure of ```com/sunflowerlab/flutter_sfl_base``` to your package name folder structure ```your/package/name```.

That's it for changing the package name in ```Android```.

##### iOS
Change the **```CFBundleIdentifier```** from your ```Info.plist``` file inside your ```ios/Runner``` directory.
```plist
<key>CFBundleIdentifier</key>
<string>com.your.packagename</string>
```
( **IMPORTANT NOTE** : For iOS, Do not change the ```Display Name``` value of Project ```Runner``` to anything else. Keep it as ```Runner``` as it's mandatory for ```Flutter``` while building ios build.)
and that's it!!! you are done.

### How to change app installed display name
##### Android
For **```Android```**, Make changes to  ```android:label="APP_DISPLAY_NAME"``` property of ```application``` tag with the value of your application display name inside ```AndroidManifest.xml``` file located at ```android/app/src/main``` folder.
```xml
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="flutter_sfl_base"
        android:icon="@mipmap/ic_launcher">
        ....
</application>
```

##### iOS
For **```ios```**, open ```Info.plist``` file located at ```ios/Runner/``` folder and change the ```<string>APP_DISPLAY_NAME</string>``` value of ```<key>CFBundleName</key>``` to your application display name.
```plist
<key>CFBundleName</key>
<string>flutter_sfl_base</string>
```
### How to update app icon
Icons can be in square or circle but in Android system we can define two different icon.
1. android:icon (Main icon)
1. android:roundIcon (Additional round icon - Few Android Devices supports round icon also)
Where as iPhone has single icon with different specification.

To generate **Main app** icon, 
Upload high res icon (of each flavor one by one) on https://appicon.co/ & get icon for Android as well for iOS both.

To generate additional **Round icon**,
1. Goto, https://romannurik.github.io/AndroidAssetStudio/index.html
2. Select **Launcher Icon Generator**
3. Select Image and upload flavor by images one by one
4. Keep **padding** and **background color** as required
5. Download with specific name for round icon (prefer to use: ic_launcher_round)
6. Once icon for all flavor are downloaded, copy paste each flavor icon in specific dimension folder
7. Add/update parameter in `AndroidManifest.xml` file as below,
```dart
<application
        ...
        android:icon="@mipmap/ic_launcher"
        android:roundIcon="@mipmap/ic_launcher_round"
        ...
        >
    ...
</application>
```

### Functionalities in Base Project you should know about

- BLoC pattern(Framework) https://bloclibrary.dev/#/
- Chopper(Rest API) https://pub.dev/packages/chopper
- Flavours(Build variant)  https://medium.com/@salvatoregiordanoo/flavoring-flutter-392aaa875f36
- Unit Test(Mockito) https://flutter.dev/docs/cookbook/testing/unit/mocking
- Animation https://pub.dev/packages/animations
- Launcher icon https://pub.dev/packages/flutter_launcher_icons

### Other SFL Learning Session Recordings
- BLoC
    * Basics - https://web.microsoftstream.com/video/f623390b-1919-43ec-8af2-16c8c0d61fa6
    * Login Demo - https://web.microsoftstream.com/video/3e7da786-56e4-4911-ac5b-3973afa537c9
- Chopper (Multiple Sessions)
    * https://web.microsoftstream.com/video/05a2796c-f63b-40f5-85ba-0d81f0d239d7
    * https://web.microsoftstream.com/video/8524deae-9cda-4069-8c08-44d020f82325
- JSON Parsing (Simple One)
    * https://web.microsoftstream.com/video/068958b3-6c0e-4a0b-adef-1258f35d3f4d
  
### [Changes required for the Splash Screen](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/splash_screen.md)

### [How to generate build](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/generate_build.md)

### [How to add base urls for different profiles](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/create_profiles.md)

### [How to create and  use string constants](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/create_string_const.md)

### [How to create and use service class](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/create_service_class.md)

### [How to add pagination](https://gitlab.com/sunflowerlab/Repositories/BaseProject/flutter/flutterbaseproject/-/blob/TDEBT-1251_BaseProject_Improvements/readme_documents/Pagination.md)
