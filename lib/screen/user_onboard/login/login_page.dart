import 'package:expenser_113/app_widgets/app_logo_stack_widget.dart';
import 'package:expenser_113/app_widgets/bottom_onboard_stack_widget.dart';
import 'package:expenser_113/app_widgets/rounded_btn_widget.dart';
import 'package:expenser_113/provider/app_provider.dart';
import 'package:expenser_113/screen/user_onboard/signup/sign_up_page.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  late MediaQueryData mq;

  bool check = false;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    print(mq.size.width);
    return Scaffold(
      body: mq.orientation == Orientation.portrait
          ? _portraitLay(context)
          : _landscapeLay(context),
    );
  }

  Widget _mainLay(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogoWidget(mq: mq),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Hello, again',
              style: mq.size.width>800 ? Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueGrey) : Theme.of(context).textTheme.titleLarge,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Start managing your expenses in one click',
              style: Theme.of(context).textTheme.titleMedium,
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
          }),
          Switch(value: check, onChanged: (value){
            print(value);
            check = value;
            Provider.of<AppProvider>(context, listen: false).changeTheme(value);
            setState((){});
          })
        ],
      ),
    );
  }

  Widget _portraitLay(BuildContext context) {
    return mq.size.height > 490
        ? _mainLay(context)
        : SingleChildScrollView(
      child: _mainLay(context),
    );
  }

  Widget _landscapeLay(BuildContext context) {
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
