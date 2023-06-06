import 'package:expenser_113/app_widgets/rounded_btn_widget.dart';
import 'package:expenser_113/models/cat_model.dart';
import 'package:expenser_113/models/expense_model.dart';
import 'package:expenser_113/screen/home/bloc/cat/cat_bloc.dart';
import 'package:expenser_113/screen/home/bloc/expense/expense_bloc.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  var selectedIndex = -1;
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  bool isLoading = false;

  var listDropDownItems = ['Debit', 'Credit'];
  late String selectedDropDownValue;
  late List<CatModel>? catData;

  @override
  void initState() {
    super.initState();
    selectedDropDownValue = listDropDownItems[0];

    BlocProvider.of<CatBloc>(context).add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Title TextField
            TextField(
              controller: titleController,
              decoration:
                  fieldDecoration(hint: 'Enter title..', labelText: 'Title'),
            ),
            heightSpacer(),
            TextField(
              controller: descController,
              decoration:
                  fieldDecoration(hint: 'Enter desc..', labelText: 'Desc'),
            ),
            heightSpacer(),
            TextField(
              controller: amtController,
              keyboardType: TextInputType.number,
              decoration:
                  fieldDecoration(hint: 'Enter amount..', labelText: 'Amount'),
            ),
            //Selecting Category
            BlocBuilder<CatBloc, CatState>(
              builder: (ctx, state) {
                if (state is CatLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CatErrorState) {
                  return Center(
                    child: Text('Can\'t load all Categories!!'),
                  );
                }

                if (state is CatLoadedState) {
                  catData = state.listCat;
                  return ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(21),
                                  topRight: Radius.circular(21.0))),
                          builder: (context) {
                            return Container(
                              height: mq.size.height * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                    itemCount: catData!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                    ),
                                    itemBuilder: (ctx, index) {
                                      return InkWell(
                                        onTap: () {
                                          selectedIndex = index;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              '${catData![index].path}',
                                              width: 50,
                                              height: 50,
                                            ),
                                            heightSpacer(mHeight: 16),
                                            Text('${catData![index].title}')
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            );
                          });
                    },
                    child: selectedIndex == -1
                        ? Text('Choose Expense Type', style: mTextStyle16())
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                catData![selectedIndex].path!,
                                width: 30,
                                height: 30,
                              ),
                              widthSpacer(mWidth: 11),
                              Text(catData![selectedIndex].title!)
                            ],
                          ),
                  );
                }

                return Container();
              },
            ),
            //Selecting Expense type
            DropdownButton(
                value: selectedDropDownValue,
                dropdownColor: AppColor.appBlackColor,
                items: listDropDownItems
                    .map((expenseType) => DropdownMenuItem(
                          value: expenseType,
                          child: Text(expenseType),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedDropDownValue = value!;
                  setState(() {});
                }),

            BlocListener<ExpenseBloc, ExpenseState>(
                listener: (ctx, state) {
                  if (state is ExpenseLoadingState) {
                    isLoading = true;
                    setState(() {});
                  } else if (state is ExpenseLoadedState) {
                    isLoading = false;
                    Navigator.pop(context);
                    setState(() {});
                  } else if (state is ExpenseErrorState) {
                    isLoading = false;
                    setState(() {});
                  }
                },
                child: RoundedBtn(
                    title: isLoading ? 'Adding Expense..' : 'Add Expense',
                    isLoading: isLoading,
                    onPress: () {
                      if (selectedIndex != -1 && catData != null) {
                        var balanceTillNow = 0;
                        int amt = int.parse(amtController.text.toString());

                        var newExpense = ExpenseModel(
                            title: titleController.text.toString(),
                            desc: descController.text.toString(),
                            amount: amt,
                            userId: 0,
                            expenseType:
                                selectedDropDownValue == 'Debit' ? 1 : 2,
                            balance: selectedDropDownValue == 'Debit'
                                ? balanceTillNow - amt
                                : balanceTillNow + amt,
                            categoryId: catData![selectedIndex].id,
                            date: DateTime.now().toString());

                        BlocProvider.of<ExpenseBloc>(context)
                            .add(AddExpenseEvent(newExpense: newExpense));
                      }
                    })),
          ],
        ),
      )),
    );
  }
}
