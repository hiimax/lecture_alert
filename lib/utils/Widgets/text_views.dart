import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_alert/res/colors/colors.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Function()? onTap;
  final int? maxLines;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  @override
  const TextView({
    super.key,
    required this.text,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.maxLines,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        key: key,
        style: textStyle ??
            TextStyle(
                fontFamily: fontFamily ?? 'Poppins',
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? lectureAlertBlack,
                decoration: decoration),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
