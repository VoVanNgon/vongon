import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _nController = TextEditingController();
  String _result = '';
  final SnackBar _snackBar = SnackBar(content: Text('Vui lòng nhập số hợp lệ!'));

  void _calculate(String operator) {
    double? a = double.tryParse(_aController.text);
    double? b = double.tryParse(_bController.text);

    if (a == null || b == null) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      return;
    }

    setState(() {
      switch (operator) {
        case '+':
          _result = 'Kết quả: ${a + b}';
          break;
        case '-':
          _result = 'Kết quả: ${a - b}';
          break;
        case '*':
          _result = 'Kết quả: ${a * b}';
          break;
        case '/':
          _result = b != 0 ? 'Kết quả: ${a / b}' : 'Không thể chia cho 0';
          break;
      }
    });
  }

  bool _isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void _checkPrime() {
    String nText = _nController.text;
    int? n = int.tryParse(nText);

    if (n == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vui lòng nhập một số hợp lệ!')));
    } else {
      bool isPrime = _isPrime(n);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$n ${isPrime ? 'là' : 'không phải là'} số nguyên tố.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _aController,
              decoration: InputDecoration(labelText: 'Nhập số A'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: InputDecoration(labelText: 'Nhập số B'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_result),
            SizedBox(height: 20),
            TextField(
              controller: _nController,
              decoration: InputDecoration(labelText: 'Nhập số n để kiểm tra số nguyên tố'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkPrime,
              child: Text('Kiểm tra'),
            ),
          ],
        ),
      ),
    );
  }
}
