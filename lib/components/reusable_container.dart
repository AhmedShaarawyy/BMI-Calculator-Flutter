import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.colour, this.containerChild, this.onPress});
  final Color colour;
  final Widget? containerChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: containerChild,
        margin: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: colour),
            
      ),
    );
  }
}
