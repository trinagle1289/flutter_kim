import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

int selectedTransportValue = 0;
int selectedSpaceValue = 0;

void main() => runApp(const Step6of1App());

class Step6of1App extends StatelessWidget {
  const Step6of1App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(title: 'Button App', home: Step6of1Field());
}

class Step6of1Field extends StatefulWidget {
  const Step6of1Field({Key? key}) : super(key: key);

  @override
  Step6of1FieldState createState() => Step6of1FieldState();
}

class Step6of1FieldState extends State<Step6of1Field> {
  List<bool> isTransportSelected = [false, false];
  List<bool> isSpaceSelected = [false, false];

  void updateTransportSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isTransportSelected.length; i++) {
        if (i == index) {
          isTransportSelected[i] = !isTransportSelected[i];
          if (isTransportSelected[i]) {
            selectedTransportValue = getTransportValue(i);
          } else {
            selectedTransportValue = -1;
          }
        } else {
          isTransportSelected[i] = false;
        }
      }
    });
  }

  void updateSpaceSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isSpaceSelected.length; i++) {
        if (i == index) {
          isSpaceSelected[i] = !isSpaceSelected[i];
          if (isSpaceSelected[i]) {
            selectedSpaceValue = getSpaceValue(i);
          } else {
            selectedSpaceValue = -1;
          }
        } else {
          isSpaceSelected[i] = false;
        }
      }
    });
  }

  int getTransportValue(int index) {
    switch (index) {
      case 0:
        return 2;
      case 1:
        return 5;
      default:
        return -1;
    }
  }

  int getSpaceValue(int index) {
    switch (index) {
      case 0:
        return 1;
      case 1:
        return 2;
      default:
        return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '步驟六(1/3)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            '不良工作條件',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '搬運/握持受限',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              buildCircularCheckboxTransport(0, '每次搬運/持握持續5-10秒，搬運距離2-5公尺'),
              buildCircularCheckboxTransport(1, '每次搬運/持握持續>10秒，搬運距離>5公尺'),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '空間條件',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              buildCircularCheckboxSpace(
                  0, '工作空間<1.5m²，地板中度骯髒、輕度不平整、輕微傾斜(不超過5°)，輕度穩定度受限，重物須放置精確'),
              buildCircularCheckboxSpace(1,
                  '自由度嚴重受限、考活動的高度不足、工作空間侷限，地板非常骯髒、不平整或粗糙地面，傾斜5-10°，穩定度受限，重物須放置非常精確'),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(170, 50)),
                ),
                child: const Text(
                  '上一步',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => getLhcApp("6-2")),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(170, 50)),
                ),
                child: const Text(
                  '下一步',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircularCheckboxTransport(int index, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Center(
        child: ListTile(
          title: Row(
            children: [
              Checkbox(
                value: isTransportSelected[index],
                onChanged: (value) {
                  updateTransportSelectedIndex(index);
                },
                shape: const CircleBorder(),
                activeColor: Colors.blue,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 8),
                  child: Text(
                    subtitle,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }

  Widget buildCircularCheckboxSpace(int index, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Center(
        child: ListTile(
          title: Row(
            children: [
              Checkbox(
                value: isSpaceSelected[index],
                onChanged: (value) {
                  updateSpaceSelectedIndex(index);
                },
                shape: const CircleBorder(),
                activeColor: Colors.blue,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 8),
                  child: Text(
                    subtitle,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
