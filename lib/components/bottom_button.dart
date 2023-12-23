
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.name, required this.onTap});
  final String? name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: bottomContainerColor,
        height: bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
          name!,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
        )),
      ),
    );
  }
}

