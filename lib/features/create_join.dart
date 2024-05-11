import 'package:flutter/material.dart';
import 'package:managementp_projects/core/Widgets/DottedButton.dart';
import 'package:managementp_projects/core/colors.dart';
import 'package:managementp_projects/core/components/defaultButton.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateJoinPage extends StatelessWidget {
  const CreateJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main_color,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/big_logo.png',
            ),
            ButtonComponent(text: "create"),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Dotted_Border_Butteon(),
              onTap: () {
               // display_Bottom_sheet();
              },
            ),
          ],
        ),
      ),
      
    );

   
  }
   Future display_Bottom_sheet(BuildContext context){
      return showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 360,
                      child: Column(children: [
                        Row(
                          children: [
                            Text("Enter project’s ID..",style: TextStyle(
                              
                            ),)
                          ],
                        ),
                      ]),
                    );
                  },
                );
    }
}
