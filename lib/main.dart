import 'package:flutter/material.dart';

import 'ui/title.dart';
import 'ui/lhc/step1_1.dart';
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

/// 主程式
void main() => const TitleApp();

class LhcData {}

/// 取得 LHC 介面
Widget getLhcApp(String idx) {
  Widget widget;

  switch (idx) {
    case "1-1":
      widget = const Step1of1App();
      break;
    case "1-2":
      widget = const Step1of2App();
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
