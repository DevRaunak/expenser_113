import 'package:expenser_113/app_widgets/app_logo_stack_widget.dart';
import 'package:expenser_113/app_widgets/bottom_onboard_stack_widget.dart';
import 'package:expenser_113/app_widgets/rounded_btn_widget.dart';
import 'package:expenser_113/screen/user_onboard/signup/sign_up_page.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  late MediaQueryData mq;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    return Scaffold(
      body: mq.orientation == Orientation.portrait
          ? _portraitLay(context)
          : _landscapeLay(context),
    );
  }

  Widget _mainLay(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogoWidget(mq: mq),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Hello, again',
              style: mTextStyle43(mWeight: FontWeight.bold),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Start managing your expenses in one click',
              style: mTextStyle16(),
            ),
          ),
          heightSpacer(mHeight: mq.size.height * 0.05),
          TextField(
            controller: emailController,
            decoration: fieldDecoration(
                hint: 'Enter your Email..',
                labelText: 'Email',
                prefixIcon: Icons.email_outlined),
          ),
          heightSpacer(),
          TextField(
            controller: passController,
            decoration: fieldDecoration(
                hint: 'Enter your Pass..',
                labelText: 'Password',
                prefixIcon: Icons.password,
                isPasswordField: true),
          ),
          heightSpacer(mHeight: mq.size.height * 0.05),
          RoundedBtn(
            title: 'Login',
            onPress: () {},
            mIcon: Icons.login,
          ),
          heightSpacer(mHeight: mq.size.height * 0.01),
          BottomOnBoardStack(onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ));
          })
        ],
      ),
    );
  }

  Widget _portraitLay(context) {
    return LayoutBuilder(builder: (_, constraints) {
      return mq.size.height > 490
          ? _mainLay(context)
          : SingleChildScrollView(
              child: _mainLay(context),
            );
    });
  }

  Widget _landscapeLay(context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              color: AppColor.appBlackColor,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              AppLogoWidget(
                mq: mq,
                bgColor: Colors.white,
                iconColor: AppColor.appBlackColor,
              ),
              heightSpacer(mHeight: mq.size.height * 0.05),
              Text(
                'Expenser',
                style: mTextStyle43(mColor: Colors.white,),
              )
          ],
        ),
            )),
        Expanded(child: mq.size.height > 490
            ? _mainLay(context)
            : SingleChildScrollView(
          child: _mainLay(context),
        ))
      ],
    );
  }
}
