import 'package:flutter/material.dart';
import 'title.dart';

void main() {
  runApp(Anima());
}

class Anima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: anima1(),
    );
  }
}

class anima1 extends StatefulWidget {
  @override
  _Anima1State createState() => _Anima1State();
}

class _Anima1State extends State<anima1> {
  @override
  void initState() {
    super.initState();
    // 使用 Future.delayed 来在一定时间后自动切换页面
    Future.delayed(Duration(seconds: 2), () {
      // 使用 pushReplacement 来替代当前页面
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => title()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),
              Text(
                '暫時',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}