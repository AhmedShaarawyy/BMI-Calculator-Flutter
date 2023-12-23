import 'package:flutter/material.dart';

const labelTextstyle = TextStyle(color: Colors.grey, fontSize: 18);

class ContainerDetails extends StatelessWidget {
  ContainerDetails({this.icoon, this.label, this.iconColor});
  final IconData? icoon;
  final String? label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icoon, size: 80,color: iconColor,),
        Text(
          '$label',
          style: labelTextstyle,
        )
      ],
    );
  }
}
