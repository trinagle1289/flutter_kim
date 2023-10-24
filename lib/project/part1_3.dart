import 'package:flutter/material.dart';
import 'part2.dart';

String selectedRating = '0';
void main() {
  runApp(aftercamera2());
}

class aftercamera2 extends StatelessWidget {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '步驟一(3/3)',
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
            Container(
              width: double.infinity,
              color: Color(0xFFFFDCB2),
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                '請根據下圖的姿勢評級表選擇合適的姿勢評級',
                style: TextStyle(color: Colors.black, fontSize: 19),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'picture/topic-1.png',
              width: 370,
              height: 370,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '姿勢評級:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedRating,
                  items: [
                    '0',
                    '03',
                    '05',
                    '07',
                    '09',
                    '10',
                    '13',
                    '15',
                    '18',
                    '20',
                  ].map((rating) {
                    return DropdownMenuItem<String>(
                      value: rating,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.2,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          rating,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRating = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const page6()),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(170, 50)),
              ),
              child: const Text('下一步', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}