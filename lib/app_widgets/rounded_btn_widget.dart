import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  double mWidth;
  double mHeight;
  String title;
  Color mColor;
  VoidCallback onPress;
  IconData? mIcon;
  double borderRadius;

  RoundedBtn({
    required this.title,
    required this.onPress,
    this.mWidth = double.infinity,
    this.mHeight = 50.0,
    this.mColor = AppColor.appBlackColor,
    this.borderRadius = 21.0,
    this.mIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: ElevatedButton(
          onPressed: onPress,
          child: mIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(mIcon), widthSpacer(), Text(title)],
                )
              : Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: mColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)
          )
        ),
      ),
    );
  }
}
