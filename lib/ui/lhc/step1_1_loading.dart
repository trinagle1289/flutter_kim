import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kim_lhc/main.dart';

import 'package:export_video_frame/export_video_frame.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img_lib;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

part 'step1_1_loading.g.dart';

void main() => runApp(ProviderScope(child: Step1of1LoadingApp()));

/// 步驟 1-1 的載入介面(用於計算身體姿勢結果)
class Step1of1LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Loading Screen",
        home: Scaffold(
          appBar: getTitleAppBar("步驟一(1/3)"),
          body: _BodyField(),
        ),
      );
}

/// 介面身體區域
class _BodyField extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyFieldState();
}

class _BodyFieldState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    /// 加載文字
    var loadingText = ref.watch(_loadingTextProvider);

    return Center(
      child: Text(
        loadingText,
        style: const TextStyle(fontSize: 40),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 分析影片，結束後導向到下一個頁面
    analyze().then(
      (_) async {
        // 設定介面文字，然後 Delay 1 秒，最後導向到介面 1-2
        ref.read(_loadingTextProvider.notifier).finish();
        // Future.delayed(const Duration(seconds: 2));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => getLhcApp("1-2")));
      },
    );
  }
}

/// 加載文字
@riverpod
class _LoadingText extends _$LoadingText {
  final _text = "正在評估姿勢結果...\n請勿離開此畫面";

  @override
  String build() => _text;

  /// 完成評估
  void finish() => state = "評估結束";
}

/// 將影片內容進行分析
/// 會讓使用者先選取剛剛錄製的影片，之後會對此影片進行分析
Future<void> analyze() async {
  // 取得影片路徑
  var videoPath =
      (await ImagePicker().pickVideo(source: ImageSource.gallery))?.path;

  // 將影像轉換成影像串流(每 30 毫秒一幀)
  var stream = ExportVideoFrame.exportImagesFromFile(
          File(videoPath!), const Duration(milliseconds: 30), 1.0)
      .asBroadcastStream();

  // 清除暫存影像
  debugPrint(await ExportVideoFrame.cleanImageCache()
      ? "clean success"
      : "clean failed");

  /// 取得影像串流長度
  var streamLen = await stream.length;

  // 設定起始和結束的所抓到的圖片
  var startFrames = List<img_lib.Image?>.empty();
  var endFrames = List<img_lib.Image?>.empty();

  // 取得前面和最後 5 個的畫面
  for (var i = 0; i < streamLen; i++) {
    if (i < 5) {
      var bytes = (await stream.elementAt(i + 1)).readAsBytesSync();
      var img = img_lib.decodeImage(bytes);
      startFrames.add(img);
    }
    if (i < streamLen - 5) {
      var bytes = (await stream.elementAt(i + 1)).readAsBytesSync();
      var img = img_lib.decodeImage(bytes);
      endFrames.add(img);
    }
  }

  var path = (await getApplicationCacheDirectory()).path;
  for (var i = 0; i < startFrames.length; i++) {
    var png = img_lib.encodePng(startFrames[i]!);
    var pngPath = "$path/$i.png";
    var success = await img_lib.writeFile(pngPath, png);

    debugPrint(success
        ? "success to save image in cache"
        : "failed to save image in cache");

    Gal.putImage(pngPath, album: "start frame");
  }
}

/// 等比例縮放圖片為正方形大小(其他區域會被繪製成黑色)
img_lib.Image resizeImgInSquare(img_lib.Image imgIn, int edge) {
  // 圖片長寬所除的數值
  var divNum = max(imgIn.width / edge, imgIn.height / edge);
  // 等比例縮放後的圖片
  var resizedImg = img_lib.Image.fromResized(imgIn,
      width: imgIn.width ~/ divNum, height: imgIn.height ~/ divNum);

  // 建立輸出影像
  var imgOut = img_lib.Image(width: edge, height: edge);

  // 將縮放後的圖片和輸出影像進行合成(輸出影像為背景)
  if (resizedImg.height > resizedImg.width) {
    var moveX = (edge - resizedImg.width) ~/ 2;
    imgOut = img_lib.compositeImage(imgOut, resizedImg, dstX: moveX);
  } else {
    var moveY = (edge - resizedImg.height) ~/ 2;
    imgOut = img_lib.compositeImage(imgOut, resizedImg, dstY: moveY);
  }

  return imgOut;
}
