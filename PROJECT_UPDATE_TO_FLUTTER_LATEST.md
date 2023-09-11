# Upgrade you project to flutter latest version (1.22.2 or above)
Upgrading our project to latest compatible `Flutter` version requires our system `Flutter SDK` to be configured such a way that our existing project will work smoothly with updated `flutter` version with minimal updates.

### Maintain multiple flutter versions.
___

To keep up more than one flutter version in your system, you need to download the specific `.zip` file for the flutter version you want to keep up  other than the existing one. 

As of now, all our projects are getting build with flutter version `1.17.5`. To download updated `flutter` version (`1.22.2` or above) go to below links and download zip as per your system.
##### macOS

https://flutter.dev/docs/development/tools/sdk/releases?tab=macos

##### Windows

https://flutter.dev/docs/development/tools/sdk/releases?tab=windows



___

There is also a way to update `flutter SDK` using a command as  below. If it will not work please follow procedure mentioned above. 

``` 
$ flutter upgrade 
``` 

**This command will update your existing  `flutter sdk` version to latest one and if it did not work properly with current project than we required to download older version (`1.17.5` or which we used earlier with project) again.**



Once done, just run `flutter --version` and `flutter doctor` to make sure which `flutter` and dart version does your system have. This is how it's gonna look like 

```sh
$ flutter --version 
Flutter 1.22.3 • channel stable • https://github.com/flutter/flutter.git 
Framework • revision 8874f21e79 (2 weeks ago) • 2020-10-29 14:14:35 -0700
Engine • revision a1440ca392 
Tools • Dart 2.10.3 
```
___

Now, we have to configure our system to work with our two separate `flutter` version comes the tricky part. 

### macOS 

##### STEP 1:  

Create another folder along with folder where your existing `flutter sdk` is located & name it `flutter_1.22.x`.  (x is your specific downloaded version)

##### STEP 2: 

Unzip the downloaded file from the above link in the newly created folder, i.e. `flutter_1.22.x`. 

##### STEP 3: 

Open `Finder` and press `CMD + Shift + h`. Once the finder window is open, press `CMD + Shift + .`. 

##### STEP 4: 

Open the file `.bash_profile` with `TextEdit`, and you will find the following line inside the file. 

``` 
export PATH="$PATH:/Users/sunflowermacmini/Documents/Development/flutter/bin" 
``` 

##### STEP 5: 

Copy and paste that line below it, and rename the second last endpoint of the copied line with `flutter_1.22.x`, and comment the first line with a `#`. So now it's going to look like this. 

``` 
# export PATH="$PATH:/Users/sunflowermacmini/Documents/Development/flutter/bin" 
export PATH="$PATH:/Users/sunflowermacmini/Documents/Development/flutter_1.22.x/bin"
``` 

To switch back to the older flutter version, just comment the newly added line in `.bash_profile` file and uncomment the above line like this. 

``` 
export PATH="$PATH:/Users/sunflowermacmini/Documents/Development/flutter/bin" 
# Comment the above line and uncomment the below line to use Flutter 1.22.x 
# export PATH="$PATH:/Users/sunflowermacmini/Documents/Development/flutter_1.22.x/bin" 
``` 

So eveytime, when you need to switch between `flutter` versions, just un-comment the respective line.

**NOTE**

If you're using `zsh` shell, then follow the same steps (4 & 5) in `.zprofile` file. 

##### STEP 6: 

Quit and restart all the applications that are using terminal, such as VSCode, Android Studio, Xcode, etc. 

##### STEP 7: 

Just to make sure, again run `flutter --version` and `flutter doctor` to make sure everything is fine.


### Windows 

You will have a `Path` variable defined in `Environment Variables` for `flutter`. 

##### STEP 1: 

Create another folder where your existing `flutter sdk` has been installed & name it `flutter_1.22.x`. (x is your specific downloaded version)

##### STEP 2:

Unzip the downloaded file from the above mentioned link in the newly created folder, i.e. `flutter_1.22.x`. 

##### STEP 3: 

Press `Start` and start typing `evn` and select `Edit environment variables for your account`, and under `User Variables` find and select `Path`, and click on edit. 

##### STEP 4: 

There will be and existing variable with path `C:\src\flutter\bin`. Replace the word `flutter` with `flutter_1.22.x`.
Here, we are done. 

So every time, when you need to switch between `flutter` versions, we need to update this value in path.


**NOTE: Make sure to use stable channel of `flutter`, NEVER use `beta`, `dev` or `master`***. 
Now that we have more than one `flutter` version, let's move ahead with making our project compatible for the latest `flutter` version.



### Upgrading Existing Projects
___  

##### STEP 1: 

Take the latest pull from `develop` branch of the peoject and create a sepreate branch for the following changes. 

##### STEP 2: 

Open `pubspec.yaml` file and upgrade the version number for the following pubs. 

**1. environment:** 

* sdk: ">=2.7.0 <3.0.0" ----------> ">=2.8.0 <3.0.0" 



**2. dependencies:** 

flutter: 

sdk: flutter

* Service locator

get_it: ^2.0.1 ----------> ^5.0.1 

* Bloc for state management

flutter_bloc: ^3.1.0 ----------> ^6.0.6 

* Value equality

equatable: ^1.0.0 ----------> ^1.2.5 

* Functional programming

dartz: ^0.8.6 ----------> ^0.9.2 

* Remote API

chopper: ^2.4.1 ----------> ^3.0.6

built_value: ^7.0.8 ----------> ^7.1.0 

* Local cache

shared_preferences: ^0.5.3+4 ----------> ^0.5.12+2 

* Other Packages

provider: ^4.0.1 ----------> ^4.3.2+2 

flutter_launcher_icons: ^0.7.4 ----------> ^0.8.1 

animations: ^1.0.0+5 ----------> ^1.1.2 

flutter_spinkit: ^4.1.2 ----------> ^4.1.2+1

adaptive_dialog: ^0.6.4 ----------> ^0.9.0+1




**FlutterFire plugin for Analytics, Crashlytics, Notification, Performance**

* firebase_core: ^0.4.5 ----------> ^0.5.1

* firebase_analytics: ^5.0.15 ----------> ^6.1.0

* firebase_crashlytics: ^0.1.3+3 ----------> ^0.2.1+1 

* firebase_messaging: ^6.0.16 ----------> ^7.0.3 

* firebase_performance: ^0.3.2 ----------> ^0.4.0+2 



**Code Quality - Lint** 

* lint: ^1.2.0 ----------> ^1.3.0 



**3. dev_dependencies:_** 

flutter_test: 

sdk: flutter 

mockito: ^4.1.0 ----------> ^4.1.3 

chopper_generator: ^2.3.4 ----------> ^3.0.5

built_value_generator: ^7.1.0 

build_runner: ^1.10.2



Please make sure to upgrade any other pubs that you're using for `flutter 1.22.x` apart from the above listed ones. 



**NOTE: Please make sure to `UPGRADE` any other `PUBS` that you're using in the project apart from the above listed ones.**

##### STEP 3: 

Save the file and run the following command 

``` 
$ flutter pub get 
``` 

##### STEP 4: 

Once, the above command gets executed properly. you need to run the `biuld_runner` command, i.e. as follows 

```sh 
flutter pub run build_runner watch --delete-conflicting-outputs 
``` 

The `--delete-conflicting-outputs` flag will delete all the existing `.g.dart` files and create them again, fresh and new compatible for the flutter version.




### **`IMPORTANT`**
___ 

If project seems broken and display red error for `vsync` for `AnimationController`, just restart your IDE (VS Code or Android Studio) and open your project again. If still errors are there, now it's time to restart whole system to take effect of our changes.



Once they're gone, now we can run our project. If it seems project has some error while executing, 

1. Remove `ios/Podfile`, `ios/podfile.lock` & `pubspec.lock` file.

2. Perform `flutter clean` & than `flutter pub get`

3. Run project now



This will definitely  work. If still some issues are there, ping in our **Mobile Team**. 



##### Known Errors
___ 

* **Issue/Error-** logs about having lower iOS version set for some packages

**Solution-** Perform previous 3 steps to get rid of it

2. **Issue/Error-** logs about having loswer iOS version specified for project

**Solution-** This will only happen if you have updated `xCode 12` with you (We recommond all to have it now). It needs lowest `iOS` version 9 (not 8) to be set for iOS app. So, open iOS module of `flutter` app and update it. 



We are done with everything on the `flutter` side. Now let's see what we need to take care on platform specific side. 



#### Only for macOS users 
___ 

As you are maintaining  the multiple versions of `flutter`, similarly you must be maintaining  multiple versions of `Xcode` as well. 

So to specify the which `Xcode` version is to be used while building `flutter` apps, please follow the below mentioned steps. 

##### STEP 1: 

Launch `Xcode`, and press `CMD + ,`. This will open the `Preferences` window. 

##### STEP 2: 

Guide yourself to the `Locations` tab. Below there you will find an option of `Commmand Line Tool`. 

##### STEP 3: 

On tapping the options besides it, a list of available `Xcode` version will open up. Select the version you want to use while building the `flutter` apps. 


Hence, we are done with maintaining  multiple `flutter` versions on a single system. 



 