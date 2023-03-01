import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight in KG'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height in Feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height in Inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are OverWeight";
                          bgColor = Colors.amber;
                        } else if (bmi < 18) {
                          msg = "You are UndderWeight";
                          bgColor = Colors.red.shade500;
                        } else {
                          msg = "You are Healthy!";
                          bgColor = Colors.green.shade700;
                        }

                        setState(() {
                          result = "$msg\nYour BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill the required Blanks!";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
