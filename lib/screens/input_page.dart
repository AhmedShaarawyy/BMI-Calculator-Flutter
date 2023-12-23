import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/container_details.dart';
import 'package:bmi_calculator/components/reusable_container.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xff1d1e33);
const bottomContainerColor = Colors.redAccent;
const inactiveContainerColor = Color(0xff111328);

const boldTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? selectedGenders;
  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          centerTitle: true,
          elevation: 10,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGenders = Genders.male;
                      });
                    },
                    colour: selectedGenders == Genders.male
                        ? activeContainerColor
                        : inactiveContainerColor,
                    containerChild: ContainerDetails(
                      icoon: FontAwesomeIcons.mars,
                      iconColor: Color.fromARGB(255, 13, 134, 234),
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGenders = Genders.female;
                      });
                    },
                    colour: selectedGenders == Genders.female
                        ? activeContainerColor
                        : inactiveContainerColor,
                    containerChild: ContainerDetails(
                      icoon: FontAwesomeIcons.venus,
                      iconColor: Color(0xFFEB1555),
                      label: "FEMALE",
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: ReusableContainer(
              colour: activeContainerColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: klabelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0xFFEB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableContainer(
                    colour: activeContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: klabelTextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              weighticon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              weighticon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableContainer(
                    colour: activeContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: klabelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              weighticon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              weighticon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            BottomButton(
              name: "CALCULATE",
              onTap: () {
                CalculatorBrain calcing =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calcing.calculateBMI(),
                            resultText: calcing.getResult(),
                            interpretation: calcing.getInterpretation(),
                          )),
                );
              },
            )
          ],
        ));
  }
}
