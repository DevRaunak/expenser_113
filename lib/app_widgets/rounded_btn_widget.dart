import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  double mWidth;
  double mHeight;
  String title;
  Color? mColor;
  VoidCallback onPress;
  IconData? mIcon;
  double borderRadius;
  bool isLoading;

  RoundedBtn({
    required this.title,
    required this.onPress,
    this.isLoading = false,
    this.mWidth = double.infinity,
    this.mHeight = 50.0,
    this.mColor,
    this.borderRadius = 21.0,
    this.mIcon,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor:
                mColor ?? (themeMode ? AppColor.appBlackColor : Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: mIcon != null
            ? isLoading
                ? Row(
                    children: [
                      CircularProgressIndicator(),
                      widthSpacer(),
                      Icon(
                        mIcon,
                        color:
                            themeMode ? Colors.white : AppColor.appBlackColor,
                      ),
                      widthSpacer(),
                      Text(title,
                          style: mTextStyle16(
                              mColor: themeMode
                                  ? Colors.white
                                  : AppColor.appBlackColor))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        mIcon,
                        color:
                            themeMode ? Colors.white : AppColor.appBlackColor,
                      ),
                      widthSpacer(),
                      Text(title,
                          style: mTextStyle16(
                              mColor: themeMode
                                  ? Colors.white
                                  : AppColor.appBlackColor))
                    ],
                  )
            : isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      widthSpacer(),
                      Text(title,
                          style: mTextStyle16(
                              mColor: themeMode
                                  ? Colors.white
                                  : AppColor.appBlackColor))
                    ],
                  )
                : Text(
                    title,
                    style: mTextStyle16(
                        mColor:
                            themeMode ? Colors.white : AppColor.appBlackColor),
                  ),
      ),
    );
  }
}
