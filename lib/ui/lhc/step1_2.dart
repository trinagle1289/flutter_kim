import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

void main() => const Step1of2App();

/// 步驟 1-2 介面
class Step1of2App extends StatelessWidget {
  const Step1of2App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PoseResultField());
  }
}

/// 評估姿勢結果區域
class PoseResultField extends StatefulWidget {
  const PoseResultField({super.key});

  @override
  State<StatefulWidget> createState() => PoseResultFieldState();
}

/// 評估姿勢結果區域之狀態
class PoseResultFieldState extends State<PoseResultField> {
  String NUM = "0"; // 你要從前一頁取得的值********************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '步驟一(2/3)',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              '開始/結束',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 330.0, // 增加寬度以獲得更長的橫線
              height: 3.0, // 或者增加高度以獲得更長的縱線
              color: Colors.black,
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'picture/img_2.png',
                    width: 190,
                    height: 250,
                  ),
                  Image.asset(
                    'picture/img_2.png',
                    width: 190,
                    height: 250,
                  )
                ],
              ), // 這裡是空白圖片的背景色，你可以自由調整
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                color: Colors.teal[100], // 青瑩的背景色
                child: Text(
                  '姿勢評級: $NUM',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 35), // 改變字體大小
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      // 點擊按鈕時導航到錄影畫面
                      context,
                      MaterialPageRoute(builder: (context) => getLhcApp("1-1")),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(170, 50)), // 將按鈕大小改回 170x50
                  ),
                  child: const Text('重新錄影',
                      style: TextStyle(fontSize: 30)), // 更改文字
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      // 點擊按鈕時導航到手動評估畫面
                      context,
                      MaterialPageRoute(builder: (context) => getLhcApp("1-3")),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(170, 50)), // 將按鈕大小改回 170x50
                  ),
                  child: const Text('手動評估',
                      style: TextStyle(fontSize: 30)), // 更改文字
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  // 點擊按鈕時導航到步驟二
                  context,
                  MaterialPageRoute(builder: (context) => getLhcApp("2")),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(170, 50)), // 將按鈕大小改回 170x50
              ),
              child: const Text('下一步', style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
