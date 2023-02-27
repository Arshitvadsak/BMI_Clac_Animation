import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation Male;
  late Animation Female;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _controller1 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    Male = Tween<double>(begin: 0, end: pi * 2).animate(_controller1);
    _controller2 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    Female = Tween<double>(begin: 0, end: pi * 2).animate(_controller2);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double height = 100;
  double weight = 60;
  double age = 28;
  double bmi = 0;
  double bmiHeight = 0;
  Color maleContainerColor = const Color(0xff1d1e33);
  Color femaleContainerColor = const Color(0xff1d1e33);
  Color maleIconTextColor = Colors.white;
  Color femaleIconTextColor = Colors.white;
  bool selected = false;
  bool font = false;
  double ConSize = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff7DB9B6),
      ),
//backgroundColor: Colors.transparent,
      body: Container(
        height: 710,
        color: const Color(0xffDFFFD8),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
//female and male
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleContainerColor = const Color(0xff3b3c4d);
                          maleContainerColor = const Color(0xff1d1e33);
                          femaleIconTextColor = Colors.red;
                          maleIconTextColor = Colors.white;
                          selected = !selected;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: selected ? 130 : 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: femaleContainerColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.female_sharp,
                                size: selected ? 70 : 107,
                                color: femaleIconTextColor),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 20,
                                color: femaleIconTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          maleIconTextColor = const Color(0xffEb1555);
                          femaleIconTextColor = Colors.white;
                          maleContainerColor = const Color(0xff3b3c4d);
                          femaleContainerColor = const Color(0xff1d1e33);
                          selected = !selected;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: selected ? 170 : 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: maleContainerColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.male,
                                size: selected ? 107 : 70,
                                color: maleIconTextColor),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 20,
                                color: maleIconTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
//height
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff1d1e33),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          ScaleTransition(
                            scale: _controller,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${height.toInt()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: " cm",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: 100,
                            activeColor: const Color(0xfff5c1d1),
                            inactiveColor: const Color(0xff555555),
                            thumbColor: const Color(0xffeb1555),
                            value: height,
                            divisions: 50,
                            onChanged: (val) {
                              setState(() {
                                height = val;
                                font = !font;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
//weight and age
              Row(
                children: [
                  Expanded(
                    child: FadeTransition(
                      opacity: _controller,
                      child: Container(
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff1d1e33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${weight.toInt()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4c4f5e),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                        color: Color(0xfffffff),
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff6e6f7a),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        color: Color(0xfff67fa4),
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: FadeTransition(
                      opacity: _controller,
                      child: Container(
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff1d1e33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${age.toInt()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
//age//
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4c4f5e),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                        color: Color(0xfffffff),
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff6e6f7a),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        color: Color(0xfff67fa4),
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "BMI = ${bmi.toStringAsFixed(2)} kg/m2",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
//calculate
              SizeTransition(
                sizeFactor: _controller,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bmiHeight = height / 50;
                      bmi = weight / (bmiHeight * bmiHeight);
                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff7DB9B6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
