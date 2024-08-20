import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 45),
                    ))),
            Row(
              children: [
                customoutlinebutton('9'),
                customoutlinebutton('8'),
                customoutlinebutton('7'),
                customoutlinebutton('+'),
              ],
            ),
            Row(
              children: [
                customoutlinebutton('6'),
                customoutlinebutton('5'),
                customoutlinebutton('4'),
                customoutlinebutton('-'),
              ],
            ),
            Row(
              children: [
                customoutlinebutton('3'),
                customoutlinebutton('2'),
                customoutlinebutton('1'),
                customoutlinebutton('x'),
              ],
            ),
            Row(
              children: [
                customoutlinebutton('c'),
                customoutlinebutton('0'),
                customoutlinebutton('='),
                customoutlinebutton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customoutlinebutton(String val) {
    return Expanded(
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1))),
          onPressed: () => btnClicked(val),
          child: Text(
            val,
            style: TextStyle(fontSize: 35),
          )),
    );
  }

  late int firstnum, secondnum;
  late String text = "", res, opp;
  void btnClicked(String btnText) {
    if (btnText == "c") {
      text = "";
      res = "";
      firstnum = 0;
      secondnum = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstnum = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      secondnum = int.parse(text);
      if (opp == "+") {
        res = (firstnum + secondnum).toString();
      }
      else if (opp == "-") {
        res = (firstnum - secondnum).toString();
      }
      else if (opp == "x") {
        res = (firstnum * secondnum).toString();
      }
      else if (opp == "/") {
        res = (firstnum / secondnum).toString();
      }
      

    } else {
      res = text + btnText;
    }
    setState(() {
      text = res;
    });
  }
}
