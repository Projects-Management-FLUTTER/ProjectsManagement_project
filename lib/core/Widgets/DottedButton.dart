
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:managementp_projects/core/colors.dart';

class Dotted_Border_Butteon extends StatelessWidget {
  const Dotted_Border_Butteon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      dashPattern: [10, 10],
      color: Colors.white,
      strokeWidth: 1,
      child: Container(
        width: 280,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColor.main_color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              'Join',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
