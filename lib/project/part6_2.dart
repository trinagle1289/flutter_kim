import 'package:flutter/material.dart';
import 'part6.dart';
import 'part6_3.dart';
import 'final.dart';

int selectedOptionThreeValue = 0;
int selectedOptionFourValue = 0;

void main() {
  runApp(const page8());
}

class page8 extends StatelessWidget {
  const page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button App',
      initialRoute: '/',
      routes: {
        '/': (context) => const thirdPage(),
      },
    );
  }
}

class thirdPage extends StatefulWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  _thirdPageState createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  List<bool> isOptionThreeSelected = [false, false];
  List<bool> isOptionFourSelected = [false, false];


  void updateTransportSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isOptionThreeSelected.length; i++) {
        if (i == index) {
          isOptionThreeSelected[i] = !isOptionThreeSelected[i];
          if (isOptionThreeSelected[i]) {
            selectedOptionThreeValue = getOptionThreeValue(i);
          } else {
            selectedOptionThreeValue = -1;
          }
        } else {
          isOptionThreeSelected[i] = false;
        }
      }
    });
  }

  void updateSpaceSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isOptionFourSelected.length; i++) {
        if (i == index) {
          isOptionFourSelected[i] = !isOptionFourSelected[i];
          if (isOptionFourSelected[i]) {
            selectedOptionFourValue = getOptionFourValue(i);
          } else {
            selectedOptionFourValue = -1;
          }
        } else {
          isOptionFourSelected[i] = false;
        }
      }
    });
  }

  int getOptionThreeValue(int index) {
    switch (index) {
      case 0:
        return 1;
      case 1:
        return 2;
      default:
        return -1;
    }
  }

  int getOptionFourValue(int index) {
    switch (index) {
      case 0:
        return 1;
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
          '步驟六(2/3)',
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
            '手/手臂的位置與動作',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'picture/img.png',
            width: 350,
            height: 90,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildCircularCheckboxTransport(0, '偶爾達到關節活動範圍極限'),
              buildCircularCheckboxTransport(1, '經常達到關節活動範圍極限'),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '氣候條件',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              buildCircularCheckboxSpace(0, '熱、不舒服的吹風、寒冷、潮濕')
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page7()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(const Size(170, 50)),
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
                    MaterialPageRoute(builder: (context) => const page9()),
                  );
                  // 在這裡處理下一步按鈕的程式碼
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(const Size(170, 50)),
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
                value: isOptionThreeSelected[index],
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
                value: isOptionFourSelected[index],
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