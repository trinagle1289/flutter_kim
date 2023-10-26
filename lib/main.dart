import 'package:flutter/material.dart';

import 'ui/title.dart';
import 'ui/lhc/step1_1.dart';

/// 主程式
void main() => const TitleApp();

/// 取得 LHC 介面
Widget getLhcApp(String idx) {
  Widget widget;

  switch (idx) {
    case "1-1":
      widget = const Step1of1App();
      break;
    default:
      widget = const TitleApp();
      break;
  }

  return widget;
}
