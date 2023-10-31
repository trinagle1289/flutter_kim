import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

void main() => runApp(const Step8App());

class Step8App extends StatelessWidget {
  const Step8App({super.key});

  @override
  Widget build(BuildContext context) {
    String ChoiceString; //時間評級
    if (choice == choice!.truncateToDouble()) {
      ChoiceString = choice!.toInt().toString();
    } else {
      ChoiceString = choice!.toString();
    } //轉
    int work = selectedTransportValue +
        selectedSpaceValue +
        selectedOptionThreeValue +
        selectedOptionFourValue +
        selectedOptionOneValue +
        selectedOptionTwoValue; //不良工作條件
    int photobody = int.parse(selectedRating); //照片的身體姿勢
    double body = c1 + c2 + c3 + c4 + photobody; //額外加分身體姿勢+照片的身體姿勢
    String bodyString =
        body.toStringAsFixed(body.truncateToDouble() == body ? 0 : 1); //轉double

    double num = ((choice ?? 0) *
            ((val ?? 0) + selectedOptionValue + body + work + score))
        as double; //最後風險值
    //double num = 100;
    // 根據 num 值選擇顏色
    Color boxColor;
    if (num < 20) {
      boxColor = const Color.fromRGBO(0, 255, 0, 1.0);
    } else if (num >= 20 && num < 50) {
      boxColor = const Color.fromRGBO(128, 255, 0, 1.0);
    } else if (num >= 50 && num < 100) {
      boxColor = const Color.fromRGBO(255, 255, 0, 1.0);
    } else {
      boxColor = const Color.fromRGBO(255, 0, 0, 1.0);
    }

    String physiologicalText;
    String healthConcernText;
    String preventiveMeasuresText;

    if (num < 20) {
      //boxColor = Colors.green;
      physiologicalText = "生理過載可能性低";
      healthConcernText = "無預期健康疑慮";
      preventiveMeasuresText = "無";
    } else if (num >= 20 && num < 50) {
      //boxColor = Colors.lightGreen;
      physiologicalText = "對恢復能力較弱者有生理過載可能性";
      healthConcernText = "疲勞、低度適應不良問題，可由休息時間做調適";
      preventiveMeasuresText = "針對恢復能力較弱者進行工作再設計，以及其他預防措施";
    } else if (num >= 50 && num < 100) {
      //boxColor = Colors.yellow;
      physiologicalText = "對一般族群有生理過載可能性";
      healthConcernText = "出現異常(如疼痛)，可能有功能障礙，大部分個案為可逆的，沒有型態學上的表現";
      preventiveMeasuresText = "建議進行工作再設計，以及其他預防措施";
    } else {
      //boxColor = Colors.red;
      physiologicalText = "生理過載極可能發生";
      healthConcernText = "產生更明確的異常或功能障礙，身體結構上受損，有病態表現";
      preventiveMeasuresText = "需要進行工作再設計，以及其他預防措施";
    }

    return MaterialApp(
      title: 'FinalPage',
      home: Scaffold(
        appBar: AppBar(
          title:
              const Center(child: Text('結果報告', style: TextStyle(fontSize: 40))),
        ),
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: Container(
                          width: 350,
                          height: 55,
                          decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text(
                              '風險等級:${(num == num.toInt()) ? num.toInt().toString() : num.toString()}',
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
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '風險等級計算結果:',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        text: '時間評級:',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '$ChoiceString',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            '負重(${selectedGender == Gender.MAN ? '男' : '女'}):',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '$val',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '力量傳遞:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                        text: '$selectedOptionValue',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '身體姿勢:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: '$bodyString',
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '工作條件:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: '$work',
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: '工作協調:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: '$score',
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
                                        text: (num == num.toInt())
                                            ? num.toInt().toString()
                                            : num.toString(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          Positioned(
                            bottom: 10,
                            left: 20,
                            child: ElevatedButton(
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
                          ),
                          const SizedBox(width: 13),
                          ElevatedButton(
                            onPressed: () {
                              selectedTransportValue = 0;
                              selectedSpaceValue = 0;
                              selectedOptionThreeValue = 0;
                              selectedOptionFourValue = 0;
                              selectedOptionOneValue = 0;
                              selectedOptionTwoValue = 0;
                              c1 = 0;
                              c2 = 0;
                              c3 = 0;
                              c4 = 0;
                              ChoiceString = "";
                              choice = 0;
                              selectedGender = null;
                              val = 0;
                              selectedOptionValue = 0;
                              bodyString = "";
                              work = 0;
                              score = 0;
                              num = 0;
                              physiologicalText = "";
                              healthConcernText = "";
                              preventiveMeasuresText = "";
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
