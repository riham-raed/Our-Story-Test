import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  int result;
  bool checkTen;

  calculate(String op) {
    setState(
      () {
        switch (op) {
          case '+':
            result = int.parse(firstNumberController.text) +
                int.parse(secondNumberController.text);
            break;
          case '-':
            result = int.parse(firstNumberController.text) -
                int.parse(secondNumberController.text);
            break;
          case '*':
            result = int.parse(firstNumberController.text) *
                int.parse(secondNumberController.text);
            break;
        }
      },
    );
    result == 10 ? checkTen = true : checkTen = false;
    showDialog<String>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text(checkTen.toString()),
        content: Text(
          firstNumberController.text +
              " " +
              op +
              " " +
              secondNumberController.text +
              " is " +
              result.toString(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            Text(
                'This App will take two integer numbers and calculate the result.'),
            SizedBox(height: 25),
            Text(
                'If the sum equlas to 10 then the app will return TRUE, else FALSE'),
            SizedBox(height: 50),
            buildTextField(firstNumberController),
            buildTextField(secondNumberController),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildOperatorSign(context, '+'),
                buildOperatorSign(context, '-'),
                buildOperatorSign(context, '*'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
    );
  }

  Widget buildOperatorSign(BuildContext context, String op) {
    return IconButton(
      onPressed: () => calculate(op),
      icon: Text(op, style: TextStyle(fontSize: 25)),
    );
  }
}
