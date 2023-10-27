import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'step1_1_copy.g.dart';

late List<CameraDescription> _cameras; // 相機列表
late CameraController _controller; // 相機控制器

void main() => runApp(ProviderScope(child: Step1of1App()));

/// 步驟 1-1 介面
// ignore: use_key_in_widget_constructors
class Step1of1App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('步驟一', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.blue,
          flexibleSpace: Container(color: Colors.blue),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _bodyField(ref),
      ),
    );
  }
}

/// 相機區域
class _CameraField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraFieldState();
}

/// 相機區域狀態
class _CameraFieldState extends State<_CameraField> {
  @override
  Widget build(BuildContext context) {
    Widget emptyWidget = Container();

    try {
      if (!_controller.value.isInitialized) {
        return emptyWidget;
      } else {
        return MaterialApp(
          home: CameraPreview(_controller),
        );
      }
    } catch (e) {
      return emptyWidget;
    }
  }

  @override
  void initState() {
    super.initState();
    initCameraState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  /// 設定相機參數
  Future<void> setCameraData() async {
    await requestPermissions(); // 請求權限

    // 尋找可用相機
    _cameras = await availableCameras();

    // 設定相機控制器
    _controller = CameraController(
      _cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
  }

  /// 初始化相機狀態
  Future<void> initCameraState() async {
    await setCameraData();

    // 初始化控制器
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      debugPrint("Camera Error: ${e.toString()}");
    });
  }
}

/// 介面的 body 區域
Scaffold _bodyField(WidgetRef ref) {
  // 錄影按鈕
  var recordBtnColor = ref.watch(_recordBtnColorProvider);
  var recordBtnText = ref.watch(_recordBtnTextProvider);

  return Scaffold(
    body: Stack(
      children: [
        // 相機區域
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 350,
            height: 500,
            child: _CameraField(),
          ),
        ),

        // 介紹欄
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

        // 錄影按鈕
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ElevatedButton(
              onPressed: () async {
                ref.read(_recordBtnColorProvider.notifier).changeState();
                ref.read(_recordBtnTextProvider.notifier).changeState();

                if (!ref.read(_recordBtnColorProvider.notifier).isRecording()) {
                  await _controller.startVideoRecording();
                } else {
                  (await _controller.stopVideoRecording()).saveTo();
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(recordBtnColor),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(170, 50)),
              ),
              child: Text(recordBtnText, style: const TextStyle(fontSize: 30)),
            ),
          ),
        ),
      ],
    ),
  );
}

/// 錄影按鈕顏色
@riverpod
class _RecordBtnColor extends _$RecordBtnColor {
  final _color = Colors.blue;

  @override
  Color build() => _color;

  /// 是否正在錄影
  bool isRecording() => state == Colors.red ? true : false;

  /// 切換狀態
  void changeState() =>
      state == Colors.red ? state = Colors.blue : state = Colors.red;
}

/// 錄影按鈕文字
@riverpod
class _RecordBtnText extends _$RecordBtnText {
  @override
  String build() => "開始錄影";

  /// 是否正在錄影
  bool isRecording() => state == "結束錄影" ? true : false;

  /// 切換狀態
  void changeState() => state == "結束錄影" ? state = "開始錄影" : state = "結束錄影";
}

/// 請求權限
Future<void> requestPermissions() async =>
    await [Permission.camera, Permission.storage].request();
