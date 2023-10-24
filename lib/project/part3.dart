import 'package:flutter/material.dart';
import 'part2.dart';
import 'part4.dart';

double? choice = 0;
String ChoiceString = choice!.toStringAsFixed(0);

class two extends StatefulWidget {
  @override
  _Part2State createState() => _Part2State();
}

class _Part2State extends State<two> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var appTitle = const Align(
      alignment: Alignment.center,
      child: Text(
        '步驟三',
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    );

    var times1 = const Text(
      '時間評級',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
    var times3 = const Text(
      '                           ',
      style: TextStyle(
        fontSize: 20,
      ),
    );

    var times2 = const Text(
      '步驟一動作的每日執行次數',
      style: TextStyle(
        fontSize: 30,
        color: Colors.black,
      ),
    );

    var appBody = Stack(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                times3,
                times1,
                times3,
                times2,
                times3,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.2,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedOption,
                    hint: const Text(' 大約為', textAlign: TextAlign.center),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    items: <String>[
                      '5次',
                      '20次',
                      '50次',
                      '100次',
                      '150次',
                      '220次',
                      '300次',
                      '500次',
                      '750次',
                      '1000次',
                      '1500次',
                      '2000次',
                      '2500次',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              if (selectedOption != null) {
                if (selectedOption == '5次') {
                  choice = 1;
                } else if (selectedOption == '20次') {
                  choice = 1.5;
                } else if (selectedOption == '50次') {
                  choice = 2;
                } else if (selectedOption == '100次') {
                  choice = 2.5;
                } else if (selectedOption == '150次') {
                  choice = 3;
                } else if (selectedOption == '220次') {
                  choice = 3.5;
                } else if (selectedOption == '300次') {
                  choice = 4;
                } else if (selectedOption == '500次') {
                  choice = 5;
                } else if (selectedOption == '750次') {
                  choice = 6;
                } else if (selectedOption == '1000次') {
                  choice = 7;
                } else if (selectedOption == '1500次') {
                  choice = 8;
                } else if (selectedOption == '2000次') {
                  choice = 9;
                } else if (selectedOption == '2500次') {
                  choice = 10;
                }
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>RadioExampleApp()),
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
            child: const Text(
              '下一步',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>page6()),
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
            child: const Text(
              '上一步',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: appTitle,
        ),
        body: appBody,
      ),
    );
  }
}
