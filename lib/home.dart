import 'dart:math';

import 'package:bmibody/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;

  int age = 25;

  double height = 170;

  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body Mass Index'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    build_Male_FeMale('male'),
                    SizedBox(
                      width: 15,
                    ),
                    build_Male_FeMale('female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toStringAsFixed(1) , style: Theme.of(context).textTheme.headline1,),
                          SizedBox(width: 3,),
                          Text('CM' , style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value ;
                          });
                        },
                        min: 120,
                        
                        max: 210,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    build_Weight_Height('age'),
                    SizedBox(
                      width: 15,
                    ),
                    build_Weight_Height('weight'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              color: Colors.teal,
              child: TextButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Result(isMale: isMale, result: result, age: age);
                  }));
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded build_Male_FeMale(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isMale && type == 'male' || !isMale && type == 'female'
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(type == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }

  Expanded build_Weight_Height(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2),
            SizedBox(
              height: 10,
            ),
            Text(type == 'age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
