

import '../data_provider/db_helper.dart';

class ExpenseModel{
  int? expenseId;
  int? userId;
  String? date;
  String? title;
  String? desc;
  int? categoryId;
  int? amount;
  int? balance;
  int? expenseType;

  ExpenseModel({this.expenseId, this.userId, this.date, this.title, this.desc, this.categoryId,
  this.amount, this.balance, this.expenseType});

  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
      expenseId: map[DbHelper.EXPENSE_ID],
      userId: map[DbHelper.USER_ID],
      date: map[DbHelper.EXPENSE_DATE],
      title: map[DbHelper.TITLE],
      desc: map[DbHelper.DESC],
      categoryId: map[DbHelper.CATEGORY_ID],
      amount: map[DbHelper.AMOUNT],
      balance: map[DbHelper.BALANCE],
      expenseType: map[DbHelper.EXPENSE_TYPE],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      DbHelper.EXPENSE_ID : expenseId,
      DbHelper.USER_ID : userId,
      DbHelper.EXPENSE_DATE : date,
      DbHelper.TITLE : title,
      DbHelper.DESC : desc,
      DbHelper.CATEGORY_ID : categoryId,
      DbHelper.AMOUNT : amount,
      DbHelper.BALANCE : balance,
      DbHelper.EXPENSE_TYPE : expenseType,
    };
  }
}