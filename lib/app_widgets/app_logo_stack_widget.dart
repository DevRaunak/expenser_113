


import 'package:flutter/material.dart';

import '../ui_helper.dart';

class AppLogoWidget extends StatelessWidget{
  MediaQueryData mq;
  Color iconColor;
  Color bgColor;

  AppLogoWidget({required this.mq, this.bgColor = AppColor.appBlackColor, this.iconColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: mq.size.width*0.1,
      child: Padding(
        padding: EdgeInsets.all(mq.size.width*0.05),
        child: Image.asset('assets/images/logo_fill.png', color: iconColor,),
      ),
    );
  }
}