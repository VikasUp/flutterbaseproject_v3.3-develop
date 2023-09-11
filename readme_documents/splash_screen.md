### Changes required for the Splash Screen
##### Android (Reference : https://flutter.dev/docs/development/ui/advanced/splash-screen#android-launch-screen )
* ***Step 1*** ( This color will be displayed while loading Android Resources for Flutter app at the time of Fresh install. )
  First of all, get a (hashcode of a) single primary color of your application design or background color of application splash screen design.
  Open, ```styles.xml``` file from ```android/app/src/main/res/values/``` folder and change the value of ```<color name="splash_background">YOUR_COLOR_HASHCODE</color>``` tag to your color hashcode.
```xml
<resources>
    ...
    <color name="splash_background">#F96332</color>
</resources>
```
If you need to know where this resource is used, open file ```launch_background``` of ```../main/res/drawable/``` folder. There you'll see color resource that we've specified.
```xml
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@color/splash_background" />
</layer-list>
```
* ***Step 2*** ( This changes will display screen while loading Flutter resources after completing loading of Android Resources)
  Open,  ```AndroidManifest.xml``` file of ```../app/src/main/``` folder to add below code snippet between ```<application></application>``` tag.
```xml
<meta-data
    android:name="io.flutter.embedding.android.SplashScreenDrawable"
    android:resource="@drawable/launch_background"
/>
```
Resource ```launch_background``` is nothing but it's the same file that we configure to get displayed when Android Resource were getting built.
( **Note** : If you do not have this ```<metaa-data></metaa-data>``` tag than you can add it otherwise it it's there do not worry for step 2.)

##### iOS (Reference : https://flutter.dev/docs/development/ui/advanced/splash-screen#android-launch-screen)
* Open iOS module in the xCode by clicking ```Runner.xcworkspace``` file reside in **```ios```** folder of your project directory.
* Open ```LaunchScreen.storyboard``` file of ```Runner/Runner/``` module and select for ```LaunchImage``` inside ```View_controller```.
* Change ```Background``` property to ```Custom``` color of ```LaunchImage``` from Right side panel. ( Panel will be displayed when you select ```LaunchImage```.)
* Add your color hashcode value to ```RGB Sliders``` of ```Color Sliders``` when Custom color selection window get open.


##### ( **```Note```** : Notes for adding Image for Splash Screen will be updated in future.)
