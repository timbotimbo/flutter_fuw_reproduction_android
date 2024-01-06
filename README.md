# flutter_fuw_reproduction_android
A Flutter project to run flutter_unity_widget on Android without any Unity setup. Intended for reproducing platformview bugs.

## Project creation
Project created using flutter create using flutter 3.13.9. 
- `pubspec.yaml` and `main.dart` wer modified to include the flutter_unity_widget.
- The unity export script modified `android/settings.gradle`
```diff
+ include ":unityLibrary"
+ project(":unityLibrary").projectDir = file("./unityLibrary")
```

The `android/unityLibrary` folder contains an export made from Unity using `flutter_unity_widget`.  
Normally this folder should be ignored in git, but in this repo it is deliberately included to be able to run this example without having to use the Unity software.  

The export was made using the (outdated) Unity version 2019.4.40.  
This is the last Unity version that precompiles the export, which make distribution much easier.  

The unity project is currently omitted to reduce the repo size.