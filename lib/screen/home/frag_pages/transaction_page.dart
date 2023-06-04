import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../provider/app_provider.dart';
import '../../add_expense/add_expense_page.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool check = false;
  var isLight;
  var dummyData = Constants.arrTransaction;
  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpensePage(),));
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.secondaryColor,
                        child: Icon(Icons.add, color: AppColor.appBlackColor,),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 6,
                child: totalBalanceUI()),
            Expanded(
              flex: 9,
                child: ListView.builder(
                    itemCount: dummyData.length,
                    itemBuilder: (ctx, index){
                      return getAllTransactionsDateWise(dummyData[index]);
                    }))
          ],
        ),
      ),
    );
  }

  Widget getAllTransactionsDateWise(Map<String, dynamic> dayWiseData){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dayWiseData['day'], style: mTextStyle12(mColor: AppColor.secondaryColor),),
            Text('\$ ${dayWiseData['amt']}',  style: mTextStyle12(mColor: AppColor.secondaryColor),)
          ],
        ),
        Container(
          height: 1,
          color: AppColor.secondaryColor,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: (dayWiseData['transactions'] as List).length,
            itemBuilder: (ctx, index){
            return getListOfAllTransAccToDate(dayWiseData['transactions'][index]);
        })
      ],
    );
  }

  Widget getListOfAllTransAccToDate(Map<String, dynamic> dayWiseTransaction){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        color: Colors.grey,
      ),
    );
  }

  Widget totalBalanceUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Spent Till now',
            style: mTextStyle12(
                mColor: isLight
                    ? AppColor.appBlackColor
                    : AppColor.secondaryColor)),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '\$ ',
                  style: mTextStyle25(
                      mColor: isLight
                          ? AppColor.appBlackColor
                          : AppColor.secondaryColor,
                      mWeight: FontWeight.bold)),
              TextSpan(
                  text: '543',
                  style: mTextStyle43(
                      mWeight: FontWeight.bold,
                      mColor: isLight ? AppColor.appBlackColor : AppColor.secondaryColor)),
              TextSpan(
                  text: '.56',
                  style: mTextStyle25(
                      mWeight: FontWeight.bold,
                      mColor: isLight ? AppColor.appBlackColor : AppColor.secondaryColor))
            ]))
      ],
    );
  }
}


//Center(
//           child: Switch(value: check, onChanged: (value){
//             print(value);
//             check = value;
//             Provider.of<AppProvider>(context, listen: false).changeTheme(value);
//             setState((){});
//           }),
//         ),
