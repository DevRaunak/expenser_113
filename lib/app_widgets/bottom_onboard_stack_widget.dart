import 'package:flutter/material.dart';

import '../ui_helper.dart';

class BottomOnBoardStack extends StatelessWidget {
  VoidCallback onPress;
  String title;
  String subTitle;

  BottomOnBoardStack(
      {required this.onPress,
      this.title = 'Don\'t have an Account ',
      this.subTitle = 'Sign - up now'});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: mTextStyle12(mColor: Colors.grey),
          ),
        ),
        InkWell(
            onTap: onPress,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                subTitle,
                style: mTextStyle12(mWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
