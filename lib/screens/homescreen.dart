import 'package:flutter/material.dart';
import 'package:mybmi/screens/agescreen.dart';

import '../widgets/nextbutton.dart';
import '../widgets/textcontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool mIsChecked = false;
  bool fIsChecked = false;
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
        children: [
          TextContainer(
            size: size,
            text: 'I am a ',
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const CircleImage(gender: 'male'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: mIsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          if (fIsChecked == true) {
                            fIsChecked = false;
                          }
                          mIsChecked = value!;
                        });
                        setState(() {});
                        // print('isChecked: $isChecked');
                      },
                      // activeColor: Colors.green,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color(0xFF00BB6E).withOpacity(.32);
                        }
                        return const Color(0xFF00BB6E);
                      }),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00BB6E),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleImage(gender: 'female'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: fIsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          if (mIsChecked == true) {
                            mIsChecked = false;
                          }
                          fIsChecked = value!;
                        });
                        setState(
                          () {},
                        );
                        // print('isChecked: $isChecked');
                      },
                      // activeColor: Colors.green,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color(0xFF00BB6E).withOpacity(.32);
                        }
                        return const Color(0xFF00BB6E);
                      }),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00BB6E),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.16),
          NextButton(size: size, screen: const AgeScreen()),
        ],
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final String gender;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: const Color(0xFF00BB6E),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/$gender.png'),
      ),
    );
  }
}
