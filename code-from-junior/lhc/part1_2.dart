import 'package:flutter/material.dart';
import 'part1_3.dart';
import 'part1_1.dart';
import 'part2.dart';

void main() {
  runApp(aftercamera());
}

class aftercamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YourWidget(),
    );
  }
}

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  String NUM = "0"; // 你要從前一頁取得的值

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            SizedBox(height: 10),
            Text('開始/結束',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ),),
            Container(
              width: 330.0, // 增加寬度以獲得更長的橫線
              height: 3.0,  // 或者增加高度以獲得更長的縱線
              color: Colors.black,
            ),
            Container(
              child:Row(
                children:[
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Container(
                color: Colors.teal[100], // 青瑩的背景色
                child: Text(
                  '姿勢評級: $NUM',
                  style: TextStyle(color: Colors.black, fontSize: 35), // 改變字體大小
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push( // 點擊按鈕時導航到第二個畫面
                      context,
                      MaterialPageRoute(builder: (context) => camera()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(Size(170, 50)), // 將按鈕大小改回 170x50
                  ),
                  child: Text('重新錄影', style: TextStyle(fontSize: 30)), // 更改文字
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push( // 點擊按鈕時導航到第二個畫面
                      context,
                      MaterialPageRoute(builder: (context) => aftercamera2()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(Size(170, 50)), // 將按鈕大小改回 170x50
                  ),
                  child: Text('手動評估', style: TextStyle(fontSize: 30)), // 更改文字
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page6()),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(170, 50)), // 將按鈕大小改回 170x50
              ),
              child: Text('下一步', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
