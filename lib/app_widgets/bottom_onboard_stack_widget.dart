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
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        InkWell(
            onTap: onPress,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
