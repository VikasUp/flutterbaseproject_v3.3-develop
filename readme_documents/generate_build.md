### How to generate build 

#### Android
https://flutter.dev/docs/deployment/android

#### iOS
https://flutter.dev/docs/deployment/ios

### How to configure CI-CD & Sonar Scanner for your Flutter Project
CI-CD Configuration for a Flutter Project requires to add debug and release configuration for both Android and iOS module.
Follow Instruction from this: [Document Link](https://thesunflowerlab.sharepoint.com/:w:/s/TeamSFL/Ee5bVkxNAuJLrW98UTsZNCAB6OVhPxYLmYYWoLn2l8UnAg?e=cc8Esx)

**CI-CD Checklist**
- Update Schema name to all lower case letter
- Android
  - [Link](https://flutter.dev/docs/deployment/android#signing-the-app)
- iOS
  - Create and put Certificate file
  - Put password in password.rtf file (Make sure to give password: **Sunflower101**)
  - Put provisioning profile in folder
  - Flavor wise setup (develop)
    - debug
      - Generate iOS Development Archive & once done copy .plist file from ipa generated folder to specific folder
    - release
      - Generate iOS Distribution Archive & once done copy .plist file from ipa generated folder to specific folder
    - Copy and paste same file to all other flavor-> debug & flavor->release folder
    - Open file and update provisioningProfile name same as our Flavor and Profile combination
    - Make sure to update schemes to use specific Release build configuration for Archive mode for that scheme
    - ENJOY CI-CD Build Process

#### `.gitlab-ci.yml`

We only have to update Flutter Project Name in this file. So replace YOUR_PROJECT_NAME with flutter Project name value. (i.e- **FlutterBaseProject**, **MobileInkTattoos**, **Resolvedx**)
```dart
variables:
  PROJECT_NAME: "YOUR_PROJECT_NAME"
  IOS_PROJECT_NAME: "Runner"
  FLAVOR: "develop"

include:
  - project: sunflowerlab/operations/pipelines
    ref: OKR-223
    file: 'flutter/stages.yml'
  - project: sunflowerlab/operations/pipelines
    ref: OKR-223
    file: 'flutter/analyse.yml'
  - project: sunflowerlab/operations/pipelines
    ref: OKR-223
    file: 'flutter/archive.yml'
  - project: sunflowerlab/operations/pipelines
    ref: OKR-223
    file: 'flutter/deploy.yml'
``` 
**SONAR SCANNER CheckList**
- Just COPY and PASTE `sonar-project.properties` file
- Sit back and Enjoy Code Analysis Outcome on SFL Sonar Server

We've to create a file if it's not there in project root directory and copy and paste content from here. Not a single change is required in this file. 
###### More details about file content, you can find in this doc: 
[**SONAR PROJECT PROPERTIES FILE DETAILS**](https://thesunflowerlab.sharepoint.com/:w:/s/TeamSFL/EcJJdxDJaXRElNfoBA7YDMcBTqtr1z1H7gF0uVygZoqv2g?e=G7Epff)

```yml
# Project identification
# Project key and Name will be taken from CI-CD gitlab file with extension of _flutter after it. Hence kept commented
# sonar.projectKey=PROJECT_NAME 
# sonar.projectName=PROJECT_NAME
sonar.projectVersion=1.0

# Source code location.
# Path is relative to the sonar-project.properties file. Defaults to .
# Use commas to specify more than one folder.
sonar.sources=lib
# Test Cases will be get enabled in Future for better Coverage outcome
#sonar.tests=test

# Encoding of the source code. Default is default system encoding.
sonar.sourceEncoding=UTF-8

# sonar.host.url=https://sonar.thesunflowerlab.com/
# sonar.login=YOUR_TOKEN 

# Use existing options defined under root project to perform dartanalyzer analysis
sonar.dart.analysis.useExistingOptions=false
```