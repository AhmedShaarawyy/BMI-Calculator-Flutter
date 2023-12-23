import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.weighticon, this.onpressed});

  final IconData? weighticon;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(weighticon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
