import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

int selectedOptionOneValue = 0;
int selectedOptionTwoValue = 0;

void main() => runApp(const Step6of3App());

class Step6of3App extends StatelessWidget {
  const Step6of3App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(title: 'Button App', home: Step6of3Field());
}

class Step6of3Field extends StatefulWidget {
  const Step6of3Field({Key? key}) : super(key: key);

  @override
  State<Step6of3Field> createState() => Step6of3FieldState();
}

class Step6of3FieldState extends State<Step6of3Field> {
  List<bool> isOptionOneSelected = [false, false];
  List<bool> isOptionTwoSelected = [false, false];

  void updateTransportSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isOptionOneSelected.length; i++) {
        if (i == index) {
          isOptionOneSelected[i] = !isOptionOneSelected[i];
          if (isOptionOneSelected[i]) {
            selectedOptionOneValue = getOptionOneValue(i);
          } else {
            selectedOptionOneValue = -1;
          }
        } else {
          isOptionOneSelected[i] = false;
        }
      }
    });
  }

  void updateSpaceSelectedIndex(int index) {
    setState(() {
      for (int i = 0; i < isOptionTwoSelected.length; i++) {
        if (i == index) {
          isOptionTwoSelected[i] = !isOptionTwoSelected[i];
          if (isOptionTwoSelected[i]) {
            selectedOptionTwoValue = getOptionTwoValue(i);
          } else {
            selectedOptionTwoValue = -1;
          }
        } else {
          isOptionTwoSelected[i] = false;
        }
      }
    });
  }

  int getOptionOneValue(int index) {
    switch (index) {
      case 0:
        return 1;
      case 1:
        return 2;
      default:
        return -1;
    }
  }

  int getOptionTwoValue(int index) {
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
          '步驟六(3/3)',
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
            '力量傳遞/應用受限',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              buildCircularCheckboxTransport(0, '重物不易抓握/需更大的持握力量/沒有造型的握柄/工作手套'),
              buildCircularCheckboxTransport(
                  1, '重物幾乎難以抓握/滑、軟、尖銳的邊緣/無或不適當的握柄/工作手套'),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '衣服條件',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              buildCircularCheckboxSpace(
                  0, '由於防護衣物或裝備增加額外身體負荷，例如厚重雨衣、全身防護裝、呼吸防護器、裝備腰帶等')
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
                  Navigator.pop(context);
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
                  '上一步',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => getLhcApp("7")),
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
                value: isOptionOneSelected[index],
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
                value: isOptionTwoSelected[index],
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
