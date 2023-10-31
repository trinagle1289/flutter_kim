import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

void main() => runApp(const Step7App());

class Step7App extends StatelessWidget {
  const Step7App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: '步驟七',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Step7Field());
}

class Step7Field extends StatefulWidget {
  const Step7Field({super.key});

  @override
  Step7FieldState createState() => Step7FieldState();
}

class Step7FieldState extends State<Step7Field> {
  String? selectedOption;

  void goToPreviousPage() {
    Navigator.pop(context);
  }

  void goToNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => getLhcApp("8")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(' 步驟七 ',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('                ', style: TextStyle(fontSize: 20)),
            const Align(
              alignment: Alignment.center,
              child: Text('工作協調/時間分布',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
            ),
            const Text('                ', style: TextStyle(fontSize: 20)),
            ListTile(
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text('良好', style: TextStyle(fontSize: 30))),
              ),
              subtitle: const Text('經常由於其他活動改變體力附載情況/在一個工作日中，不存在一系列僅奏且高體力的負荷',
                  style: TextStyle(fontSize: 20)),
              leading: Radio<String>(
                  value: '良好',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      switch (value) {
                        case '良好':
                          step7Data = 0.0;
                          break;
                        case '受限':
                          step7Data = 2.0;
                          break;
                        case '不良':
                          step7Data = 4.0;
                          break;
                      }
                    });
                  }),
            ),
            ListTile(
              title: const Text('受限', style: TextStyle(fontSize: 30)),
              subtitle: const Text('鮮少由於其他活動改變體力的負荷情況/在一個工作日中，偶爾有一系列緊湊且高體力的負荷',
                  style: TextStyle(fontSize: 20)),
              leading: Radio<String>(
                  value: '受限',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      switch (value) {
                        case '良好':
                          step7Data = 0.0;
                          break;
                        case '受限':
                          step7Data = 2.0;
                          break;
                        case '不良':
                          step7Data = 4.0;
                          break;
                      }
                    });
                  }),
            ),
            ListTile(
              title: const Text('不良', style: TextStyle(fontSize: 30)),
              subtitle: const Text(
                  '沒有/幾乎沒有由於其他活動改變體力的負荷情況/在一個工作日中，頻繁出現一系列緊湊且高體力的負荷',
                  style: TextStyle(fontSize: 20)),
              leading: Radio<String>(
                  value: '不良',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                      switch (value) {
                        case '良好':
                          step7Data = 0.0;
                          break;
                        case '受限':
                          step7Data = 2.0;
                          break;
                        case '不良':
                          step7Data = 4.0;
                          break;
                      }
                    });
                  }),
            ),
            const Expanded(child: SizedBox()),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 25),
                  child: ElevatedButton(
                      onPressed: goToPreviousPage,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 50))),
                      child: const Text('上一步', style: TextStyle(fontSize: 30))),
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 25),
                  child: ElevatedButton(
                      onPressed: goToNextPage,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 50))),
                      child: const Text('下一步', style: TextStyle(fontSize: 30))),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
