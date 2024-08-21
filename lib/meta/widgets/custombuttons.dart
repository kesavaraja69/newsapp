import 'package:flutter/material.dart';

import '../../app/constants/constants.dart';

class Custombutton1 extends StatelessWidget {
  final GestureTapCallback voidCallback;
  final double height;
  final double width;
  final String string;
  final TextStyle textstyle;
  const Custombutton1(
      {super.key,
      required this.height,
      required this.width,
      required this.string,
      required this.textstyle,
      required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BConstantColors.buttonbgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            string,
            style: textstyle,
          ),
        ),
      ),
    );
  }
}

class Custombutton2 extends StatelessWidget {
  final String string;
  final TextStyle textstyle;
  final GestureTapCallback voidCallback;
  final TextAlign textAlign;
  const Custombutton2(
      {super.key,
      required this.string,
      required this.textstyle,
      required this.voidCallback,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Text(
        string,
        style: textstyle,
        textAlign: textAlign,
      ),
    );
  }
}
