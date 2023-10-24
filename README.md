# flutter_kim_lhc

此 Flutter 專案用於人因危害風險的評估，主要檢測 KIM-LHC(人工物料搬運) 的風險值評估，目前注重於 Android 的開發
<br>

#### 使用插件:
* camera: ^0.10.5+5
* export_video_frame: ^0.0.7
* image: ^4.1.3
* image_picker: ^1.0.4
* path: ^1.8.3
* path_provider: ^2.1.1
* permission_handler: ^11.0.1
* tflite_flutter: ^0.10.3
<br>

#### Android Manifest 所需權限:
* android.permission.READ_EXTERNAL_STORAGE
* android.permission.WRITE_EXTERNAL_STORAGE
* android.permission.MANAGE_EXTERNAL_STORAGE
* android.permission.CAMERA
<br>

#### Android build.gradle 所需設定:
* minSdkVersion 26
* compileSdkVersion 33
<br>

#### Android Manifest 添加權限方法:
以 android.permission.READ_EXTERNAL_STORAGE 為例，將此段程式碼放置於 android/app/src/main/AndroidManifest.xml 內的第二行中
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<br>

#### Android build.gradle 設定方法:
1. 修改 android/app/build.gradle 中的 minSdkVersion 和 compileSdkVersion 的參數為相應數值
2. 以 minSdkVersion 為例，從 android/app/build.gradle 中進行修改，
   改為 minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()。
   接著再新增 android/local.properties 內容為 flutter.minSdkVersion=26
<br>

#### 新增 Flutter 套件指令
```bat
flutter pub add camera export_video_frame image image_picker path path_provider permission_handler tflite_flutter
```
<br>

#### Flutter 插件連結
* [camera](https://pub.dev/packages/camera)
* [export_video_frame](https://pub.dev/packages/export_video_frame)
* [image](https://pub.dev/packages/image)
* [image_picker](https://pub.dev/packages/image_picker)
* [path](https://pub.dev/packages/path)
* [path_provider](https://pub.dev/packages/path_provider)
* [permission_handler](https://pub.dev/packages/permission_handler)
* [tflite_flutter](https://pub.dev/packages/tflite_flutter)