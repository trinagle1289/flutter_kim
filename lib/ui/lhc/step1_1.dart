import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_kim_lhc/main.dart';
import 'package:path_provider/path_provider.dart';

var videoFile = 'video/tmp.mp4';

void main() => const Step1of1App();

/// 步驟 1-1 介面
class Step1of1App extends StatelessWidget {
  const Step1of1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          flexibleSpace: Container(
            color: Colors.blue,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('步驟一', style: TextStyle(fontSize: 40)),
        ),
        body: const Center(
          child: CameraField(),
        ),
      ),
    );
  }
}

/// 相機區域
class CameraField extends StatefulWidget {
  const CameraField({super.key});

  @override
  State<CameraField> createState() => CameraFieldState();
}

/// 相機區域狀態
class CameraFieldState extends State<CameraField> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  var isRecording = false;

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 350,
                height: 500,
                child: CameraPreview(cameraController),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 10,
              ),
            ),
            Positioned(
              top: 500,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 10,
              ),
            ),
            Positioned(
              top: 510,
              left: 0,
              right: 0,
              child: Container(
                color: const Color(0xFFFFDCB2),
                height: 70,
                child: const Center(
                  child: Text(
                    '請保持在受測者的正右方拍攝',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (isRecording) {
                      try {
                        var videoFile =
                            await cameraController.stopVideoRecording();
                        await videoFile.saveTo(
                            "${getApplicationDocumentsDirectory()}/$videoFile");
                        setState(() {
                          isRecording = false;
                        });
                      } catch (e) {
                        debugPrint("Error $e");
                      }
                      Navigator.push(
                        // 點擊按鈕時導航到第二個畫面
                        context,
                        MaterialPageRoute(
                            builder: (context) => getLhcApp("1-2")),
                      );
                    } else {
                      await createVideoFolder();
                      try {
                        await cameraController.startVideoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      } catch (e) {
                        debugPrint("Error $e");
                      }
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isRecording ? Colors.red : Colors.blue),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(170, 50)),
                  ),
                  child: Text(isRecording ? '停止錄影' : '開始錄影',
                      style: const TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Future<void> initState() async {
    super.initState();
    await startCamera();
  }

  @override
  Future<void> dispose() async {
    await cameraController.dispose();
    super.dispose();
  }

  /// 開始使用相機
  Future<void> startCamera() async {
    // 獲取可用相機
    cameras = await availableCameras();

    // 若無可用相機，則直接離開程式
    if (cameras.isEmpty) {
      return;
    }

    // 取得相機控制器
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    // 初始化相機控制器
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      debugPrint("ERROR in startCamera():\n$e");
    });
  }

  /// 建立影像資料夾
  Future<void> createVideoFolder() async {
    var appDir = await getApplicationDocumentsDirectory();
    var videoPath = '${appDir.path}/videos/';
    await Directory(videoPath).create();

    // 如果路徑存在則表示成功建立資料夾
    if (await (Directory(videoPath).exists())) {
      debugPrint('Create Video Folder In Path: $videoPath');
    }
  }
}
