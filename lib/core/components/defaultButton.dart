import 'package:flutter/material.dart';
import 'package:managementp_projects/core/colors.dart';

class ButtonComponent extends StatelessWidget {
  String text;
  ButtonComponent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColor.white_color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: AppColor.main_color),
        ),
      ),
    );
  }
}
