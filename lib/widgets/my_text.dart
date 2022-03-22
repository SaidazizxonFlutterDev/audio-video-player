// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_and_audio_player/core/constants/color_const.dart';
import 'package:video_and_audio_player/core/constants/size_const.dart';

class MyText extends StatelessWidget {
  String txt;
  Color clr;
  double size;
  FontWeight weight;
  MyText(
      {Key? key,
      required this.txt,
      this.clr = ConstColor.textColor,
      this.size = ConstSize.normal,
      this.weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: clr,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
