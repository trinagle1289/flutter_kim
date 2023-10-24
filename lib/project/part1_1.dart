import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'part1_2.dart';

void main() => runApp(camera());

class camera extends StatelessWidget {
  const camera({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          flexibleSpace: Container(color: Colors.blue,),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('步驟一', style: TextStyle(fontSize: 40)),
        ),
        body: const Center(
          child: cameraWidget(),
        ),
      ),
    );
  }
}

class cameraWidget extends StatefulWidget{
  const cameraWidget({Key? key}) : super(key: key);

  @override
  _cameraWidget createState() => _cameraWidget();
}
class _cameraWidget extends State<cameraWidget> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  List<String> videoFiles = [];
  bool isRecording = false;


  @override
  void initState() {
    super.initState();
    startCamera();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );


    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> fileinphone() async {
    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String videoPath = '${appDir.path}/videos/';
      print('Video Path (fileinphone): $videoPath');
      await Directory(videoPath).create(recursive: true);
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> fileinflutter() async {
    try {
      final Directory appDir = await getApplicationSupportDirectory();
      final String videoPath = path.join(appDir.path, 'videos');
      print('Video Path (fileinflutter): $videoPath');
      await Directory(videoPath).create(recursive: true);
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<List<String>> readVideoFiles() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String videoPath = '${appDir.path}/videos/';

    try {
      final List<FileSystemEntity> files = Directory(videoPath).listSync();
      List<String> fileNames = [];

      for (var file in files) {
        if (file is File) {
          fileNames.add(path.basename(file.path));
        }
      }

      return fileNames;
    } catch (e) {
      print('Error reading video files: $e');
      return [];
    }
  }


  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            Align(alignment: Alignment.topCenter,
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
                color: Color(0xFFFFDCB2),
                height: 70,
                child: Center(
                  child: Text('請保持在受測者的正右方拍攝',
                    style: TextStyle(fontSize: 20),),
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
                        await cameraController.stopVideoRecording();
                        setState(() {
                          isRecording = false;
                        });
                      } catch (e) {
                        print("Error $e");
                      }
                      Navigator.push( // 點擊按鈕時導航到第二個畫面
                        context,
                        MaterialPageRoute(builder: (context) => aftercamera()),
                      );
                    } else {
                      await fileinphone();
                      await fileinflutter();
                      try {
                        await cameraController.startVideoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      } catch (e) {
                        print("Error $e");
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
                    minimumSize: MaterialStateProperty.all<Size>(Size(170, 50)),
                  ),
                  child: Text(isRecording ? '停止錄影' : '開始錄影',
                      style: TextStyle(fontSize: 30)),
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

}



