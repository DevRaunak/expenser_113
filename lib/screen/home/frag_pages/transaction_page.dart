import 'package:expenser_113/screen/home/bloc/cat/cat_bloc.dart';
import 'package:expenser_113/screen/home/bloc/expense/expense_bloc.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/cat_model.dart';
import '../../../models/expense_model.dart';
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

  var totalSpent = 0.0;

  late List<ExpenseModel> arrExpenseData;
  List<Map<String, dynamic>> arrDateWiseData = [];
  List<CatModel> arrCat = [];
  late DateTime date;
  late String todayDate;
  late String yesterdayDate;

  @override
  void initState() {
    super.initState();

    //Today date
    date = DateTime.now();
    var yesterday = date.subtract(Duration(days:1));
    todayDate =
        '${date.year}-${date.month.toString().length == 1 ? '0${date.month}' : date.month}-${date.day.toString().length == 1 ? '0${date.day}' : date.day}';
    yesterdayDate =
        '${yesterday.year}-${yesterday.month.toString().length == 1 ? '0${yesterday.month}' : yesterday.month}-${yesterday.day.toString().length == 1 ? '0${yesterday.day}' : yesterday.day}';

    //get All Transactions

    BlocProvider.of<ExpenseBloc>(context).add(GetExpenseEvent());
    BlocProvider.of<CatBloc>(context).add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        body: BlocListener<CatBloc, CatState>(
          listener: (context, state) {
            if (state is CatLoadedState) {
              arrCat = state.listCat;
            }
          },
          child: Column(
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddExpensePage(),
                          ));
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      child: Icon(
                        Icons.add,
                        color: AppColor.appBlackColor,
                      ),
                    ),
                  ),
                ),
              )),
              BlocBuilder<ExpenseBloc, ExpenseState>(builder: (ctx, state) {
                if (state is ExpenseLoadingState) {
                  return CircularProgressIndicator();
                }
                if (state is ExpenseLoadedState) {
                  arrExpenseData = state.listExpenses.reversed.toList();
                  print(arrExpenseData.length);
                  if (arrExpenseData.isNotEmpty) {
                    filterExpenseDateWise();
                    return Expanded(
                        flex: 15,
                        child: Column(
                          children: [
                            Expanded(flex: 6, child: totalBalanceUI()),
                            Expanded(
                                flex: 9,
                                child: ListView.builder(
                                    itemCount: arrDateWiseData.length,
                                    itemBuilder: (ctx, index) {
                                      return getAllTransactionsDateWise(
                                          arrDateWiseData[index]);
                                    }))
                          ],
                        ));
                  } else {
                    // No Expenses yet UI
                  }
                }

                if (state is ExpenseErrorState) {
                  return Center(child: Text(state.errorMsg));
                }
                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }

  void filterExpenseDateWise() {
    var uniqueDates = [];
    arrDateWiseData.clear();

    for (ExpenseModel model in arrExpenseData) {
      var eachDateFormat = DateTime.parse(model.date!);

      var eachDate =
          '${eachDateFormat.year}-${eachDateFormat.month.toString().length == 1 ? '0${eachDateFormat.month}' : eachDateFormat.month}-${eachDateFormat.day.toString().length == 1 ? '0${eachDateFormat.day}' : eachDateFormat.day}';
      print(eachDate);

      if (!uniqueDates.contains(eachDate)) {
        uniqueDates.add(eachDate);
      }
    }

    for (String eachDate in uniqueDates) {
      List<ExpenseModel> eachDateTransactions = arrExpenseData
          .where((element) => element.date!.contains(eachDate))
          .toList();

      print(todayDate);
      print(yesterdayDate);
      if (eachDate == todayDate) {
        eachDate = 'Today';
      } else if (eachDate == yesterdayDate) {
        eachDate = 'Yesterday';
      }

      var eachDayAmt = 0.0;

      eachDateTransactions.forEach((transaction) {
        if(transaction.expenseType==1){
          eachDayAmt -= transaction.amount!;
        } else {
          eachDayAmt += transaction.amount!;
        }
      });

      Map<String, dynamic> eachDateMap = {};
      eachDateMap['day'] = '$eachDate';
      eachDateMap['amt'] = eachDayAmt.isNegative ? '${eachDayAmt}' : '+${eachDayAmt}';
      eachDateMap['transactions'] = eachDateTransactions;

      arrDateWiseData.add(eachDateMap);
    }

    print(arrDateWiseData);
  }

  Widget getAllTransactionsDateWise(Map<String, dynamic> dayWiseData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dayWiseData['day'],
                      style: mTextStyle12(mColor: AppColor.secondaryColor),
                    ),
                    Text(
                      '\$ ${dayWiseData['amt']}',
                      style: mTextStyle12(mColor: AppColor.secondaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(right: 11),
                height: 1,
                color: AppColor.secondaryColor,
              ),
            )
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: (dayWiseData['transactions'] as List).length,
            itemBuilder: (ctx, index) {
              return getListOfAllTransAccToDate(
                  (dayWiseData['transactions'][index] as ExpenseModel));
            })
      ],
    );
  }

  Widget getListOfAllTransAccToDate(ExpenseModel dayWiseTransaction) {
    var imgPath = "";

    for (var catModel in arrCat) {
      if (catModel.id == dayWiseTransaction.categoryId) {
        imgPath = catModel.path!;
        break;
      }
    }

    var isDebit = dayWiseTransaction.expenseType==1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              imgPath,
              width: 40,
              height: 40,
            )),
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dayWiseTransaction.title!,
                          style: mTextStyle16(mWeight: FontWeight.bold),
                        ),
                        Text(
                          dayWiseTransaction.desc!,
                          style: mTextStyle12(),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${isDebit ? '-':'+'}\$ ${dayWiseTransaction.amount!}',
                          style: mTextStyle16(mWeight: FontWeight.bold, mColor: isDebit?Colors.red : Colors.lightGreenAccent),
                        ),
                        Text(
                          '\$ ${dayWiseTransaction.balance!}',
                          style: mTextStyle12(),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget totalBalanceUI() {
    calculateTotalSpent();
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
              text: '${totalSpent!=0.0 ? totalSpent.toString().split('.')[0] : '000'}',
              style: mTextStyle43(
                  mWeight: FontWeight.bold,
                  mColor: isLight
                      ? AppColor.appBlackColor
                      : AppColor.secondaryColor)),
          TextSpan(
              text: '.${totalSpent!=0.0 ? totalSpent.toString().split('.')[1] : '00'}',
              style: mTextStyle25(
                  mWeight: FontWeight.bold,
                  mColor: isLight
                      ? AppColor.appBlackColor
                      : AppColor.secondaryColor))
        ]))
      ],
    );
  }

  void calculateTotalSpent() {
    totalSpent = 0.0;
    arrExpenseData.forEach((expense) {
      if(expense.expenseType==1){
        //debit
        totalSpent -= expense.amount!;
      } else {
        //credit
        totalSpent += expense.amount!;
      }
    });

    print(totalSpent);
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
