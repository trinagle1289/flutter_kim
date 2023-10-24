import 'package:flutter/material.dart';
import 'part1_1.dart';

void main() => runApp(title());

class title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KIM UI',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(245, 147, 147, 1),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      home: KIMPage(),
    );
  }
}

class KIMPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Indicator Method (KIM)'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: buildButton1(context),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: buildButton2(context),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: buildButton3(context),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: buildButton4(context),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: buildButton5(context),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: buildButton6(context),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //button1
  ElevatedButton buildButton1(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(245,200,200, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => camera(),
          ),
        );
      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('人工物料搬運\n(KIM-LHC)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }

  //button2
  ElevatedButton buildButton2(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(189, 225, 225, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {

      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('手動處理操作\n(KIM-MHO)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }

  //button3
  ElevatedButton buildButton3(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(245,200,200, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {

      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('推拉作業搬運\n(KIM-PP)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }

  //button4
  ElevatedButton buildButton4(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(189, 225, 225, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {

      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('不當姿勢作業\n(KIM-ABP)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }

  //button5
  ElevatedButton buildButton5(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(245,200,200, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {

      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('Whole-body Forces\n(KIM-BF)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }

  //button6
  ElevatedButton buildButton6(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(189, 225, 225, 1.0),
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {

      },
      child: Container(
        width: 200,  // 設置寬度
        child: Center(
          child: Text('Body Movement\n(KIM-BM)',style: TextStyle(fontSize: 20,  ),),
        ),
      ),
    );
  }
}
