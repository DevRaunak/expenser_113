


import 'package:flutter/material.dart';

import '../ui_helper.dart';

class AppLogoWidget extends StatelessWidget{
  MediaQueryData mq;
  Color? iconColor;
  Color? bgColor;

  AppLogoWidget({required this.mq, this.bgColor, this.iconColor});

  @override
  Widget build(BuildContext context) {

    var themeMode = Theme.of(context).brightness==Brightness.light;

    return CircleAvatar(
      backgroundColor: bgColor ?? (themeMode ? AppColor.appBlackColor : Colors.white),
      radius: mq.size.width*0.05,
      child: Padding(
        padding: EdgeInsets.all(mq.size.width*0.02),
        child: Image.asset('assets/images/logo_fill.png', color: themeMode ? Colors.white : AppColor.appBlackColor,),
      ),
    );
  }
}