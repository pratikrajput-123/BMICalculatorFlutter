import 'package:flutter/material.dart';
import 'package:mybmi/calculation.dart';
import 'package:mybmi/screens/resultscreen.dart';
import 'package:mybmi/widgets/textcontainer.dart';

class HWScreen extends StatefulWidget {
  const HWScreen({super.key});

  @override
  State<HWScreen> createState() => _HWScreenState();
}

class _HWScreenState extends State<HWScreen> {
  int height = 180;
  int weight = 70;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextContainer(size: size, text: 'I have '),
          const SizedBox(height: 50),
          const Title(title: 'Height'),
          Padding(
            // padding: const EdgeInsets.only(right: 40.0),
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: const Color(0xFF00BB6E),
                    inactiveColor: const Color(0xFF00BB6E).withOpacity(0.25),
                    onChanged: (double newvalue) {
                      setState(
                        () {
                          height = newvalue.round();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF00BB6E).withOpacity(0.4),
                        width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '${height}cm',
                      style: const TextStyle(
                        // fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF00BB6E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Title(title: 'Weight'),
          Padding(
            // padding: const EdgeInsets.only(right: 40.0),
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Slider(
                    value: weight.toDouble(),
                    min: 30,
                    max: 120,
                    activeColor: const Color(0xFF00BB6E),
                    inactiveColor: const Color(0xFF00BB6E).withOpacity(0.25),
                    onChanged: (double newvalue) {
                      setState(
                        () {
                          weight = newvalue.round();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF00BB6E).withOpacity(0.4),
                        width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '${weight}kg',
                      style: const TextStyle(
                        // fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF00BB6E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),
          GestureDetector(
            onTap: () {
              Calculation calc = Calculation(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.result(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width * 0.72,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BB6E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Padding(
                      // padding: EdgeInsets.only(left: size.width * 0.1),
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: const ListTile(
                        title: Text(
                          'Calculate your BMI',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        trailing:
                            Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Color(0xFF00BB6E),
        ),
      ),
    );
  }
}
