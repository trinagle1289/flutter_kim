import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'step8.g.dart';

void main() => runApp(ProviderScope(child: Step8App()));

class Step8App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 風險等級
    var riskLevelText = ref.read(_riskLevelTextProvider);
    var riskLevelColor = ref.read(_riskLevelColorProvider);

    // 7 種評級
    var timeScoreText = ref.read(_timeScoreTextProvider); // 時間評級
    var bearWeightScoreText = ref.read(_bearWeightScoreTextProvider); // 負重評級
    var bearWeightGenderText =
        ref.read(_bearWeightGenderTextProvider); // 負重評級性別
    var powerTransferScoreText =
        ref.read(_powerTransferScoreTextProvider); // 力量傳遞/負重條件
    var bodyPostureScoreText = ref.read(_bodyPostureScoreTextProvider); // 身體姿勢
    var workingConditionsScoreText =
        ref.read(_workingConditionsScoreTextProvider); // 工作條件
    var workCoordinationScoreText =
        ref.read(_workCoordinationScoreTextProvider); // 工作協調

    // 評估建議
    var physiologicalText = ref.read(_physiologicalTextProvider); // 生理過載可能性文字
    var healthConcernText = ref.read(_healthConcernTextProvider); // 健康疑慮文字
    var preventiveMeasuresText =
        ref.read(_preventiveMeasuresTextProvider); // 採取措施文字

    return MaterialApp(
      title: 'FinalPage',
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text('結果報告', style: TextStyle(fontSize: 40)))),
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 風險等級
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: Container(
                          width: 350,
                          height: 55,
                          decoration: BoxDecoration(
                              color: riskLevelColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text(
                              '風險等級: $riskLevelText',
                              style: const TextStyle(
                                  fontSize: 38, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: Center(
                        child: Container(
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(235, 235, 235, 1.0),
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            // 風險等級計算結果
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '風險等級計算結果:',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                  RichText(
                                    // 時間評級
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        text: '時間評級:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: timeScoreText,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  // 負重評級
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: '負重($bearWeightGenderText):',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: bearWeightScoreText,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  // 力量傳遞
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '力量傳遞:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                        text: powerTransferScoreText,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  // 身體姿勢
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '身體姿勢:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: bodyPostureScoreText,
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ]),
                                  ),
                                  // 工作條件
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '工作條件:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: workingConditionsScoreText,
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ]),
                                  ),
                                  // 工作協調
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '工作協調:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: workCoordinationScoreText,
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ]),
                                  ),
                                  const Text('      ',
                                      style: TextStyle(fontSize: 30)),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '風險值=',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                        text: riskLevelText,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // 生理過載可能性+健康疑慮
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 生理過載可能性
                        SizedBox(
                          height: 225,
                          child: Center(
                            child: Container(
                              width: 170,
                              height: 225,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(35, 184, 177, 1.0),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '\n生理過載可能性',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.black),
                                      ),
                                      const Text(
                                        '  ',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                      Text(physiologicalText,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // 健康疑慮
                        SizedBox(
                          height: 225,
                          child: Center(
                            child: Container(
                              width: 170,
                              height: 225,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(35, 184, 177, 1.0),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '\n健康疑慮',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black),
                                    ),
                                    const Text(
                                      '  ',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                    Text(healthConcernText,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // 可以繼續添加其他框框...
                  ]),
            ),
            const SizedBox(height: 10),
            // 採取措施
            SizedBox(
              height: 200,
              child: Center(
                child: Container(
                  width: 350,
                  height: 175,
                  decoration: BoxDecoration(
                      // 設定背景顏色
                      color: Colors.orange,
                      // 設定圓角半徑
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Column(children: [
                      const Text(' ', style: TextStyle(fontSize: 10)),
                      const Text('採取措施:', style: TextStyle(fontSize: 25)),
                      const Text(' ', style: TextStyle(fontSize: 10)),
                      Text(' $preventiveMeasuresText',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.start),
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 儲存資料按鈕
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(170, 50))),
                            child: const Text('儲存資料',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ),

                          const SizedBox(width: 13),

                          // 結束報告按鈕
                          ElevatedButton(
                            onPressed: () {
                              resetAllData();
                              //結束報告+變數清空
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => getLhcApp("")));
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(170, 50))),
                            child: const Text('結束報告',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 風險值文字
@riverpod
String _riskLevelText(_RiskLevelTextRef ref) => getRiskLevel().toString();

/// 風險值顏色
@riverpod
Color _riskLevelColor(_RiskLevelColorRef ref) {
  // 輸出顏色
  Color color = Colors.black;
  // 風險值
  var level = getRiskLevel();

  if (level < 20) {
    color = const Color.fromRGBO(0, 255, 0, 1.0);
  } else if (level < 50) {
    color = const Color.fromRGBO(128, 255, 0, 1.0);
  } else if (level < 100) {
    color = const Color.fromRGBO(255, 255, 0, 1.0);
  } else {
    color = const Color.fromRGBO(255, 0, 0, 1.0);
  }

  return color;
}

/// 時間評級文字
@riverpod
String _timeScoreText(_TimeScoreTextRef ref) => step3Data.toString();

/// 負重評級文字
@riverpod
String _bearWeightScoreText(_BearWeightScoreTextRef ref) =>
    step4Data.toInt().toString();

/// 負重評級性別文字
@riverpod
String _bearWeightGenderText(_BearWeightGenderTextRef ref) =>
    step4GenderData.toString();

/// 力量傳遞/負重條件文字
@riverpod
String _powerTransferScoreText(_PowerTransferScoreTextRef ref) =>
    step5Data.toInt().toString();

/// 身體姿勢文字
@riverpod
String _bodyPostureScoreText(_BodyPostureScoreTextRef ref) =>
    getPoseData().toString();

/// 工作條件文字
@riverpod
String _workingConditionsScoreText(_WorkingConditionsScoreTextRef ref) =>
    getWorkingConditionsData().toString();

/// 工作協調文字
@riverpod
String _workCoordinationScoreText(_WorkCoordinationScoreTextRef ref) =>
    step7Data.toInt().toString();

/// 生理過載可能性文字
@riverpod
String _physiologicalText(_PhysiologicalTextRef ref) {
  String result = "";

  // 風險值
  var level = getRiskLevel();
  if (level < 20) {
    result = "生理過載可能性低";
  } else if (level < 50) {
    result = "對恢復能力較弱者有生理過載可能性";
  } else if (level < 100) {
    result = "對一般族群有生理過載可能性";
  } else {
    result = "生理過載極可能發生";
  }

  return result;
}

/// 健康疑慮文字
@riverpod
String _healthConcernText(_HealthConcernTextRef ref) {
  String result = "";

  // 風險值
  var level = getRiskLevel();
  if (level < 20) {
    result = "無預期健康疑慮";
  } else if (level < 50) {
    result = "疲勞、低度適應不良問題，可由休息時間做調適";
  } else if (level < 100) {
    result = "對一般族群有生理過載可能性";
  } else {
    result = "生理過載極可能發生";
  }

  return result;
}

/// 採取措施文字
@riverpod
String _preventiveMeasuresText(_PreventiveMeasuresTextRef ref) {
  String result = "";

  // 風險值
  var level = getRiskLevel();
  if (level < 20) {
    result = "無";
  } else if (level < 50) {
    result = "針對恢復能力較弱者進行工作再設計，以及其他預防措施";
  } else if (level < 100) {
    result = "出現異常(如疼痛)，可能有功能障礙，大部分個案為可逆的，沒有型態學上的表現";
  } else {
    result = "需要進行工作再設計，以及其他預防措施";
  }

  return result;
}
