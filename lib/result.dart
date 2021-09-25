import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.isMale, required this.result, required this.age})
      : super(key: key);
  final bool isMale;

  final double result;

  final int age;
String get healthiness {
  String resultText = '' ;
  if (result >= 30) resultText = 'Obese' ;
  if (result < 30 && result >=25 ) resultText = 'Overweight' ;
  if (result <= 24.9 && result >=18.5 ) resultText = 'Normal' ;
  if (result < 18.5) resultText = 'Thin' ;
  return resultText ;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('   Gender :   ${isMale? 'Male' : 'Female'}'),
                SizedBox(height: 15,),
                Text('       Result :   ${result.toStringAsFixed(2)}'),
                SizedBox(height: 15,),
                Text('Healthiness :   $healthiness'),
                SizedBox(height: 15,),
                Text('      Age :   $age'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
