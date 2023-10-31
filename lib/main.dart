import 'package:flutter/material.dart';

import 'ui/title.dart';
import 'ui/lhc/step1_1.dart';
import 'ui/lhc/step1_1_loading.dart';
import 'ui/lhc/step1_2.dart';
import 'ui/lhc/step1_3.dart';
import 'ui/lhc/step2.dart';
import 'ui/lhc/step3.dart';
import 'ui/lhc/step4.dart';
import 'ui/lhc/step5.dart';
import 'ui/lhc/step6_1.dart';
import 'ui/lhc/step6_2.dart';
import 'ui/lhc/step6_3.dart';
import 'ui/lhc/step7.dart';
import 'ui/lhc/step8.dart';

/// 姿勢評級
var step1of1Data = List<String>.filled(2, ""); // 開始結束姿勢標籤(2 個字串)
double step1of2Data = 0.0; // 姿態評級
var step2Data = List<double>.filled(4, 0.0); // 身體姿勢 額外加分的部分(總共 4 類，最多計算 6 分)
double step3Data = 0.0; // 時間評級
double step4Data = 0.0; // 負重評級
String step4GenderData = "男"; // 負重評級性別
double step5Data = 0.0; // 力量傳遞/負重條件
// 不良工作條件
var step6fo1Data = List<double>.filled(2, 0.0); // [搬運/握持受限, 空間條件]
var step6fo2Data = List<double>.filled(2, 0.0); // [手/手臂的位置與動作, 氣候條件]
var step6fo3Data = List<double>.filled(2, 0.0); // [力量傳遞/應用受限, 衣服條件]
double step7Data = 0.0; // 工作協調/時間分佈

/// 主程式
void main() => const TitleApp();

/// 取得 LHC 介面
Widget getLhcApp(String idx) {
  Widget widget;

  switch (idx) {
    case "1-1":
      widget = Step1of1App();
      break;
    case "1-1-Load":
      widget = Step1of1LoadingApp();
      break;
    case "1-2":
      widget = Step1of2App();
      break;
    case "1-3":
      widget = const Step1of3App();
      break;
    case "2":
      widget = const Step2App();
      break;
    case "3":
      widget = const Step3App();
      break;
    case "4":
      widget = const Step4App();
      break;
    case "5":
      widget = const Step5App();
      break;
    case "6-1":
      widget = const Step6of1App();
      break;
    case "6-2":
      widget = const Step6of2App();
      break;
    case "6-3":
      widget = const Step6of3App();
      break;
    case "7":
      widget = const Step7App();
      break;
    // case "8":
    //   widget = const Step8App();
    //   break;
    default:
      widget = const TitleApp();
      break;
  }

  return widget;
}

/// 頂端工具列
AppBar getTitleAppBar(String title) => AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.blue,
    flexibleSpace: Container(color: Colors.blue),
    title: Text(title, style: const TextStyle(fontSize: 40)));

/// 重置資訊
void reset() {
  step1of1Data = List<String>.filled(2, ""); // 開始結束姿勢標籤(2 個字串)
  step1of2Data = 0.0; // 姿態評級
  step2Data = List<double>.filled(4, 0.0); // 身體姿勢 額外加分(總共 4 類，最多計算 6 分)
  step3Data = 0.0; // 時間評級
  step4Data = 0.0; // 負重評級
  step4GenderData = "男"; // 負重評級性別
  step5Data = 0.0; // 力量傳遞/負重條件
  step6fo1Data = List<double>.filled(2, 0.0); // 不良工作條件[搬運/握持受限, 空間條件]
  step6fo2Data = List<double>.filled(2, 0.0); // 不良工作條件[手/手臂的位置與動作, 氣候條件]
  step6fo3Data = List<double>.filled(2, 0.0); // 不良工作條件[力量傳遞/應用受限, 衣服條件]
  step7Data = 0.0; // 工作協調/時間分佈
}
